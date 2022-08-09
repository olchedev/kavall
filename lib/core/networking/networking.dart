import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:http_parser/http_parser.dart';
import 'package:kavall/core/app_log/app_log.dart';
import 'package:path/path.dart' show basename, extension;

part 'networking_methods.dart';

part 'request_extra.dart';

/// Common networking client.
class Networking {
  Networking._(
    this._baseOptions,
  )   : _client = Dio(_baseOptions),
        _spare = Dio(_baseOptions) {
    _client.transformer = FlutterTransformer();
    _client.interceptors.add(
      InterceptorsWrapper(
        onRequest: _handleRequest,
        onResponse: _handleResponse,
        onError: _handleError,
      ),
    );
    _spare.transformer = FlutterTransformer();
  }

  /// Create [Networking] instance based on [baseUrl].
  factory Networking.fromBaseUrl({
    String? accessToken,
    String? sessionId,
    String? pathSuffix,
    String? hostUrl,
  }) {
    final baseOptions = BaseOptions(
      baseUrl: '${hostUrl ?? _hostUrl}${pathSuffix ?? _requestPathSuffix}',
      contentType: ContentType.json.mimeType,
      connectTimeout: _requestTimeout * 1000,
      receiveTimeout: _requestTimeout * 1000,
    );

    final networking = Networking._(baseOptions);

    return networking;
  }

  static const _hostUrl =
      'https://europe-west3-getgaston-test.cloudfunctions.net';
  static const _requestPathSuffix = '';
  static const _requestTimeout = 60;

  static Networking? _instance;

  final BaseOptions _baseOptions;
  final Dio _client;
  final Dio _spare;

  /// Returns [Networking] instance.
  static Networking? get instance {
    if (_instance == null) {
      throw Exception('Networking instance not initialized.');
    }

    return _instance;
  }

  /// Sets networking static instance.
  static void setInstance(Networking networking) {
    _instance = networking;
  }

  /// Removes static instance.
  static void destroy() {
    _instance?.destroyDio();
    _instance = null;
  }

  /// Closes [Dio] connections force.
  void destroyDio() {
    _client.close(force: true);
    _spare.close(force: true);
  }

  /// Build request string based on [options].
  String _plainRequestOptions(
    RequestOptions options, {
    Duration? duration,
  }) {
    final buffer = StringBuffer(options.method)
      ..write(' ${options.baseUrl}${options.path}');

    if (duration != null) {
      buffer.write(' Time: [$duration]');
    }

    /// ADD QUERY PARAMETERS
    if (options.queryParameters.isNotEmpty) {
      final query = options.queryParameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      buffer.write('?$query');
    }

    /// ADD DATA
    if (options.data != null) {
      buffer.write(' Data: ');
      final data = options.data;
      if (data is Map) {
        buffer.write(data);
      } else if (data is FormData) {
        buffer.write(data.fields);

        if (data.files.isNotEmpty) {
          final files = data.files.map((e) {
            final mFile = e.value;

            return '{${mFile.filename} ${mFile.length} Bytes '
                'Type: ${mFile.contentType}}';
          }).toList(growable: false);

          buffer.write(' Files: $files');
        }
      } else {
        buffer.write(data);
      }
    }

    return buffer.toString();
  }

  String _plainResponse(Response response, {bool includeData = true}) {
    final buffer = StringBuffer(
      _plainRequestOptions(
        response.requestOptions,
      ),
    );

    /// ADD DATA
    if (includeData && response.data != null) {
      buffer.write(' Response Data: ');

      final data = response.data;
      if (data is Map) {
        buffer.write(data);
      } else {
        buffer.write(data);
      }
    }

    return buffer.toString();
  }

  /// Handle request on the fly.
  void _handleRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requestString = _plainRequestOptions(options);
    AppLog.info('REQUEST $requestString');

    return handler.next(options);
  }

  /// Handle response on the fly.
  void _handleResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final requestString = _plainResponse(response);
    AppLog.info('RESPONSE $requestString');

    return handler.next(response);
  }

  /// Handle error on the fly.
  dynamic _handleError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    final options = error.requestOptions;

    final duration = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(
        options.extra[RequestExtra.requestedAt.name],
      ),
    );

    final requestString = _plainRequestOptions(
      options,
      duration: duration,
    );
    AppLog.info('ERROR $requestString Error message: ${error.message}');

    AppLog.warn(
      'RESOLVING $requestString ${error.error}\n'
      '::\t${error.response?.headers}\n'
      '::\t${error.response?.data}',
      exception: error,
      stackTrace: StackTrace.current,
    );

    return handler.next(error);
  }
}
