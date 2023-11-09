import 'package:droidcon_flutter/src/application/utils/global_container.dart';
import 'package:droidcon_flutter/src/application/utils/spacers.dart';
import 'package:droidcon_flutter/src/domain/constants/keys.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:droidcon_flutter/src/application/utils/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  List<String> presenters = <String>[
    'Paul Mburu',
    'Steven Maina',
    'Nderi Kamau',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.containerColor.withOpacity(.3),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const GlobalContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Lottie.asset(
                              'assets/lottie/building.json',
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              controller: _animationController,
                              onLoaded: (LottieComposition composition) {
                                _animationController
                                  ..duration = composition.duration
                                  ..repeat();
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Building Resilient Flutter Apps:',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 24.0,
                              color: Styles.textColor,
                            ),
                          ).animate().slide(delay: 220.ms),
                          const SizedBox(height: 10),
                          Text(
                            'Layered Architecture with a Focus on Testing and Infrastructure',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              color: Styles.textColor,
                            ),
                          ).animate().slide(delay: 260.ms),
                          Divider(
                            height: 30,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Presented By:',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Styles.textColor,
                            ),
                          ).animate().slide(delay: 260.ms),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: presenters.length,
                            padding: const EdgeInsets.only(),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Icon(
                                  Icons.person_2_outlined,
                                  color: Styles.textColor,
                                ),
                                minLeadingWidth: 6,
                                title: Text(
                                  presenters[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    color: Styles.textColor,
                                  ),
                                ),
                                dense: true,
                              ).animate().slide(
                                    delay: Duration(milliseconds: 270 * index),
                                  );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          key: AppKeys.kanbanBtnKey,
                          style: ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll<EdgeInsetsGeometry?>(
                            const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                          )),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.kanbanRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppStrings.kanbanText),
                              SizedBox(width: Spacing.largeSize),
                              Icon(Icons.arrow_right_alt_rounded)
                            ],
                          ),
                        ),
                      ).animate().slide(delay: 450.ms),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          key: AppKeys.kanbanBtnKey,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.orange.shade600,
                            ),
                            padding:
                                MaterialStatePropertyAll<EdgeInsetsGeometry?>(
                              const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.kanbanRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(AppStrings.presentationText),
                              SizedBox(width: Spacing.largeSize),
                              Icon(Icons.arrow_right_alt_rounded)
                            ],
                          ),
                        ),
                      ).animate().slide(delay: 550.ms),
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
