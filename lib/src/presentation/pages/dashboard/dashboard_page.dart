import 'package:droidcon_flutter/src/application/utils/global_container.dart';
import 'package:droidcon_flutter/src/application/utils/spacers.dart';
import 'package:droidcon_flutter/src/domain/constants/keys.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:droidcon_flutter/src/application/utils/colors.dart';
import 'package:lottie/lottie.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
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
    return Scaffold(
      backgroundColor: Styles.containerColor.withOpacity(.3),
      body: Stack(
        children: [
          const GlobalContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 90),
            child: Stack(
              fit: StackFit.loose,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Lottie.asset(
                              'assets/lottie/building.json',
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              controller: _animationController,
                              onLoaded: (composition) {
                                _animationController
                                  ..duration = composition.duration
                                  ..forward();
                              },
                            ),
                          ),
                          Text(
                              'Building Resilient Flutter Apps:\nLayered Architecture with a Focus on Testing and Infrastructure',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28.0,
                                  color: Styles.textColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Presented By:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Styles.textColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('. Paul Mburu\n. Steve Maina\n. Nderi Kamau',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0,
                                  color: Styles.textColor)),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(
                              //   width: 180.0,
                              //   height: 50.0,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //         // backgroundColor: Styles.buttonColor,
                              //         ),
                              //     onPressed: () {},
                              //     child: const Row(
                              //       children: [
                              //         Text(
                              //           "Kanban Board",
                              //           style: TextStyle(color: Colors.white),
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Icon(
                              //           Icons.arrow_right_alt_rounded,
                              //           color: Colors.white,
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              ElevatedButton(
                                key: AppKeys.kanbanBtnKey,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.kanbanRoute);
                                },
                                child: Row(
                                  children: [
                                    Text(AppStrings.kanbanText),
                                    SizedBox(width: Spacing.largeSize),
                                    Icon(Icons.arrow_right_alt_rounded)
                                  ],
                                ),
                              ),
                              // ElevatedButton(
                              //   key: AppKeys.discussionBtnKey,
                              //   onPressed: () {
                              //     Navigator.of(context)
                              //         .pushNamed(AppRoutes.dashboardRoute);
                              //   },
                              //   child: Row(
                              //     children: [
                              //       Text(AppStrings.documentationText),
                              //       SizedBox(width: Spacing.largeSize),
                              //       Icon(Icons.arrow_right_alt_rounded)
                              //     ],
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                      // SizedBox(height: 20), // Add some spacing between the columns
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
