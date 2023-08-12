import 'package:droidcon_flutter/src/application/utils/spacers.dart';
import 'package:droidcon_flutter/src/domain/constants/keys.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppStrings.landingPageTitle,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Spacing.mediumSize),
          Text(
            AppStrings.landingPageDescription,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: Spacing.largeSize),
          ElevatedButton(
            key: AppKeys.proceedBtnKey,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.dashboardRoute);
            },
            child: Text(AppStrings.proceedText),
          )
        ],
      ),
    );
  }
}
