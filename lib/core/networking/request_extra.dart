part of 'networking.dart';

/// Represents [RequestOptions] extra keys.
enum RequestExtra {
  requestedAt,
}

extension RequestExtraExtension on RequestExtra {
  /// Returns simple name of the [RequestExtra] item.
  String get name => toString().split('.').last;
}
