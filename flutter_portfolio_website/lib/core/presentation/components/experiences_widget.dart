import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/experiences_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

class ExperiencesWidget extends ConsumerStatefulWidget {
  const ExperiencesWidget({Key? key}) : super(key: key);

  @override
  ExperiencesWidgetState createState() => ExperiencesWidgetState();
}

class ExperiencesWidgetState extends ConsumerState<ExperiencesWidget> {
  double getWidgetHeight() {
    if (ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")) {
      return 700;
    }
    if (ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP") &&
        ResponsiveWrapper.of(context).isLargerThan(MOBILE)) {
      return 450;
    }
    return 500;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
          ? MediaQuery.of(context).size.height * 2
          : MediaQuery.of(context).size.height,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Expanded(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 90,
                    left: 100,
                    right: 100,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 100,
                    right: 100,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 70,
                    bottom: 150,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 80,
                    bottom: 150,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 250,
                      height: 190,
                      alignment: Alignment.center,
                      color: const Color(0xff222222),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Where I've", style: AppStyles.roboto25Bold),
                          Text(" Worked", style: AppStyles.roboto25ColoredBold),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 47.5,
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff292929),
                          radius: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                                'assets/images/synpulse8_logo.png',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 47.5,
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                                'assets/images/abundant_accounting_logo.png',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    top: 150,
                    right: 100,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff292929),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: getWidgetHeight(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        alignment: Alignment.topCenter,
                        child: const EmptySelectionExp(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Expanded(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 90,
                    left: 100,
                    right: 100,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 100,
                    right: 100,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 70,
                    bottom: 150,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 80,
                    bottom: 150,
                    child: SizedBox(
                      height: 10.0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 250,
                      height: 190,
                      alignment: Alignment.center,
                      color: const Color(0xff222222),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Where I've", style: AppStyles.roboto25Bold),
                          Text(" Studied",
                              style: AppStyles.roboto25ColoredBold),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    right: 47.5,
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/images/sim_logo.png',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    right: 47.5,
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/images/np_logo.png',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 150,
                    right: 130,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff292929),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: getWidgetHeight(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
