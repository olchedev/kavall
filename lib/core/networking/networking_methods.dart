part of 'networking.dart';

/// Response data parser
typedef ParserParser<T, R> = R Function(T);

/// Networking request methods extension.
extension NetworkingRequestMethods on Networking {
  /// GET request with optional [query] parameters, returns [R] data.
  Future<T?> getRaw<T>(
    /// Request path.
    String path, {

    /// Request query parameters.
    Map<String, dynamic>? query,
  }) async {
    final response = await _client.get<T>(
      path,
      queryParameters: query,
    );

    return response.data;
  }

  /// GET request with [parser] calback, and [query] parameters, returns [R] data.
  Future<T> get<T>(
    /// Request path.
    String path, {

    /// Response parser method.
    required ParserParser<List<dynamic>?, T> parser,

    /// Request query parameters.
    Map<String, dynamic>? query,

    /// Request options.
    Options? options,
  }) async {
    final response = await _client.get<List<dynamic>>(
      path,
      queryParameters: query,
      options: options,
    );

    return parser(response.data);
  }

  /// DELETE request.
  Future<Response> deleteRaw(
    /// Request path.
    String path, {

    /// Request query parameters.
    Map<String, Object>? query,
  }) {
    return _client.delete<dynamic>(path);
  }

  /// GET request with [parser] calback, and [query] parameters, returns [R] data.
  Future<List<T>> getList<T>(
    /// Request path.
    String path, {

    /// Response parser method.
    required ParserParser<List<Map<String, dynamic>>, List<T>> parser,

    /// Request query parameters.
    Map<String, Object>? query,
  }) async {
    final response = await _client.get<dynamic>(
      path,
      queryParameters: query,
    );

    final dataList = List<Map<String, dynamic>>.from(response.data['data']);

    return parser(dataList);
  }

  /// POST request with [data] and [query] parameters, [parser] callback,
  /// and [cancelToken] to interrupt the request.
  Future<T> post<T>(
    /// Request path.
    String path, {
    Map<String, dynamic>? data,

    /// Response parser method.
    required ParserParser<Map<String, dynamic>?, T> parser,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      path,
      data: data,
    );

    return parser(response.data);
  }

  /// POST request with [data], [query] parameters, and [cancelToken] to
  /// interrupt the request.
  Future<T?> postRaw<T>(
    /// Request path.
    String path, {

    /// Request data.
    Map<String, Object>? data,

    /// Cancellation token.
    CancelToken? cancelToken,
  }) async {
    final response = await _client.post<T>(
      path,
      data: data,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  /// POST (multipart/form-data) request with [formData], returns raw [T]
  /// typed data.
  Future<T?> postRawForm<T>(
    /// Request path.
    String path, {

    /// Request data.
    required FormData formData,
  }) async {
    final response = await _client.post<T>(
      path,
      options: Options(
        contentType: ContentType.parse('multipart/form-data').mimeType,
      ),
      data: formData,
    );

    return response.data;
  }

  /// PUT request with [data] and [query] parameters, [parser] callback,
  /// and [cancelToken] to interrupt the request.
  Future<T> put<T>(
    /// Request path.
    String path, {

    /// Request data.
    Map<String, dynamic>? data,

    /// Response parser method.
    required ParserParser<Map<String, dynamic>?, T> parser,

    /// Cancellation token.
    CancelToken? cancelToken,
  }) async {
    final response = await _client.put<Map<String, dynamic>>(
      path,
      data: data,
      cancelToken: cancelToken,
    );

    return parser(response.data);
  }

  /// PUT request with [data], returns raw [R] typed data.
  Future<R?> putRaw<R>(
    /// Request path.
    String path, {

    /// Request data.
    Map<String, dynamic>? data,
  }) async {
    final response = await _client.put<R>(path, data: data);
    return response.data;
  }

  /// PUT request with with replaced [accessToken] and [data], returns raw [R]
  /// typed data.
  Future<T?> putRawWithAccessToken<T>(
    /// Request path.
    String path,

    /// An accessToken string.
    String accessToken, {

    /// Request data.
    Map<String, Object>? data,
  }) async {
    final response = await _client.put<T>(
      path,
      data: data,
      options: Options(
        headers: {
          ..._client.options.headers,
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data;
  }

  /// PUT request for [localFile].
  Future<Response> putRawFile(
    /// Request path.
    String path, {

    /// Local file that is need to be uploaded.
    required File localFile,
  }) async {
    final multipartFile = await MultipartFile.fromFile(
      localFile.path,
      filename: basename(localFile.path),
      contentType: MediaType(
        'image',
        extension(localFile.path).replaceAll('.', ''),
      ),
    );

    return _client.put<void>(
      path,
      data: FormData.fromMap(<String, dynamic>{
        'file': multipartFile,
      }),
    );
  }

  /// Proxy method to download file by [path] to [localPath] on device.
  Future<Response> downloadRawFile(
    String path,
    String localPath, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String? method,
  }) async {
    return _client.download(
      path,
      localPath,
      data: data,
      queryParameters: query,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      options: Options(method: method),
    );
  }
}
