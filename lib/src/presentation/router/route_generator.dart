import 'package:droidcon_flutter/src/presentation/pages/article/list_page.dart';
import 'package:droidcon_flutter/src/presentation/pages/article/single_topic_page.dart';
import 'package:droidcon_flutter/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:droidcon_flutter/src/presentation/pages/kanban/task_board.dart';
import 'package:droidcon_flutter/src/presentation/pages/landing_page.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  /// TODO: Uncomment the following line if you need
  /// to pass any properties to a page as route arguments

  final dynamic routeArgs = settings.arguments;

  switch (settings.name) {
    case AppRoutes.dashboardRoute:
      return MaterialPageRoute<DashboardPage>(
        builder: (_) => DashboardPage(),
      );
    case AppRoutes.kanbanRoute:
      return MaterialPageRoute<TaskBoard>(builder: (_) => TaskBoard());
    case AppRoutes.articlesRoute:
      return MaterialPageRoute<TaskBoard>(builder: (_) => ArticlesList());
    case AppRoutes.singleArticleRoute:
      return MaterialPageRoute<TaskBoard>(
        builder: (_) => SingleTopicPage(
          props: routeArgs as Props,
        ),
      );
    default:
      return MaterialPageRoute<LandingPage>(
        builder: (_) => LandingPage(),
      );
  }
}
