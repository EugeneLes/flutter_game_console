class BuildConst {
  static const android = 'android';
  static const ios = 'ios';

  static const platform = String.fromEnvironment('OS');

  static bool get isMockedBackend =>
      const String.fromEnvironment('MOCKED', defaultValue: 'false') == 'true';
}
