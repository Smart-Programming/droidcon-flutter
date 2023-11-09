class AppStrings {
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0',
  );

  static const String dbName = 'tasks.db';

  static const String appName = 'Droidcon Flutter';
  static const String landingPageTitle = 'Landing Page';
  static const String landingPageDescription =
      'From here, we can begin our journey!';
  static const String dashboardPageTitle = 'Dashboard';
  static const String dashboardPageDescription =
      'We can proceed to develop the dashboard pages from here';
  static const String proceedText = 'Proceed';
  static const String kanbanText = 'Kanban Board';
  static const String documentationText = 'Documentation';
  static const String presentationText = 'Presentation';
}
