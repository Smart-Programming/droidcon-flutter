import 'package:droidcon_flutter/src/application/utils/spacers.dart';
import 'package:droidcon_flutter/src/domain/constants/keys.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/landing.jpg'),
              fit: BoxFit.cover,
              opacity: .4)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Lottie.asset(
                'assets/lottie/logo.json',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 2,
                controller: _animationController,
                onLoaded: (LottieComposition composition) {
                  _animationController
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            Text(
              AppStrings.appName,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              // style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Spacing.mediumSize),
            Text(
              AppStrings.landingPageDescription,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 15),
              // style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: Spacing.largeSize,
            ),
            // SizedBox(
            //   height: 22,
            //   width: 22,
            //   child: CircularProgressIndicator(
            //     strokeWidth: 3,
            //   ),
            // )
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
      ),
    );
  }
}
