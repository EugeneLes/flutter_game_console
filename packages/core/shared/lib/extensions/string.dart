extension NullableString on String? {
  String? get nullIfEmpty => isEmptyOrNull ? null : this;

  bool get isNotEmptyOrNull => !isEmptyOrNull;

  bool get isEmptyOrNull => this == null || this!.isEmpty;

  String get orBlank => this ?? '';

  String? get valueIgnoringNull => this == null || this == 'null' ? null : this;

  bool get isNullOrWhitespace {
    final str = this;

    if (str == null) {
      return true;
    }

    for (var i = 0; i < str.length; i++) {
      if (str[i] != ' ') {
        return false;
      }
    }

    return true;
  }
}

extension StringUtils on String {
  String get noSpaces => replaceAll(' ', '_');

  String cropByLength(int maxLength, {String cropper = '...'}) =>
      length > maxLength ? '${substring(0, maxLength)}$cropper' : this;

  bool isEqualExcludeEmpty(String? stringToCompare) {
    return isNotEmpty && stringToCompare == this;
  }

  bool isEqualCaseInsensitive(String stringToCompare) {
    return toLowerCase() == stringToCompare.toLowerCase();
  }

  String removeSuffix(String suffix) {
    if (endsWith(suffix)) {
      return substring(0, length - suffix.length);
    }

    return this;
  }

  String append(dynamic addition) {
    final glue = isEmpty || endsWith('_') || addition.toString().startsWith('_') ? '' : '_';

    return '$this$glue$addition';
  }

  String or(String str) {
    if (isNotEmpty) return this;

    return str;
  }
}

extension UriExtension on String {
  String? urlScheme({List<String> excludedSchemes = const ['http', 'https']}) {
    final uri = Uri.tryParse(this);

    if (uri == null) {
      return null;
    }

    final scheme = uri.scheme;

    if (scheme.isEmpty || excludedSchemes.contains(scheme)) {
      return null;
    }

    return scheme;
  }

  bool isCustomUrlScheme({List<String> excludedSchemes = const ['http', 'https']}) {
    return !urlScheme(excludedSchemes: excludedSchemes).isEmptyOrNull;
  }
}
