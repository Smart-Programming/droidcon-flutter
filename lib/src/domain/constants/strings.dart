class AppStrings {
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0',
  );

  static const String appName = 'Droidcon Flutter';
  static const String landingPageTitle = 'Landing Page';
  static const String landingPageDescription =
      'From here, we can begin our development process';
  static const String dashboardPageTitle = 'Dashboard';
  static const String dashboardPageDescription =
      'We can proceed to develop the dashboard pages from here';
  static const String proceedText = 'Proceed';
}
