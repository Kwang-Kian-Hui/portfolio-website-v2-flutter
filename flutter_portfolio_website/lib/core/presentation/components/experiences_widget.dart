import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/application/education_class.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';
import 'package:flutter_portfolio_website/core/infrastructure/edu_and_exp_data.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/education_detail_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/empty_selection_edu.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/empty_selection_exp.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/experience_detail_widget.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

class ExperiencesWidget extends ConsumerStatefulWidget {
  const ExperiencesWidget({Key? key}) : super(key: key);

  @override
  ExperiencesWidgetState createState() => ExperiencesWidgetState();
}

class ExperiencesWidgetState extends ConsumerState<ExperiencesWidget> {
  List<Widget> expWidgetsList = [
    const EmptySelectionExp(),
    ExperienceDetailWidget(currentSelection: expClassList[0]),
    ExperienceDetailWidget(currentSelection: expClassList[1]),
    ExperienceDetailWidget(currentSelection: expClassList[2]),
  ];

  List<Widget> eduWidgetsList = [
    const EmptySelectionEdu(),
    EducationDetailWidget(currentSelection: eduClassList[0]),
    EducationDetailWidget(currentSelection: eduClassList[1]),
  ];

  double getWidgetHeight() {
    if (ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")) {
      return 550;
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
                    child: Draggable<ExperienceClass>(
                      data: expClassList[0],
                      feedback: const LogoWidget(
                          logoImagePath: 'assets/images/synpulse8_logo.png',
                          hasBackground: false),
                      childWhenDragging: const SizedBox(),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(selectedExperienceIndexProvider.notifier)
                            .change(1),
                        child: const LogoWidget(
                          logoImagePath: 'assets/images/synpulse8_logo.png',
                          hasBackground: false,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 47.5,
                    child: Draggable<ExperienceClass>(
                      data: expClassList[1],
                      feedback: const LogoWidget(
                          logoImagePath: 'assets/images/synpulse8_logo.png',
                          hasBackground: false),
                      childWhenDragging: const SizedBox(),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(selectedExperienceIndexProvider.notifier)
                            .change(2),
                        child: const LogoWidget(
                          logoImagePath: 'assets/images/synpulse8_logo.png',
                          hasBackground: false,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    left: 47.5,
                    child: Draggable<ExperienceClass>(
                      data: expClassList[2],
                      feedback: const LogoWidget(
                          logoImagePath:
                              'assets/images/abundant_accounting_logo.png',
                          hasBackground: true),
                      childWhenDragging: const SizedBox(),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(selectedExperienceIndexProvider.notifier)
                            .change(3),
                        child: const LogoWidget(
                          logoImagePath:
                              'assets/images/abundant_accounting_logo.png',
                          hasBackground: true,
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
                        child: expWidgetsList[
                            ref.watch(selectedExperienceIndexProvider)],
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
                    child: Draggable<EducationClass>(
                      data: eduClassList[0],
                      feedback: const LogoWidget(
                          logoImagePath: 'assets/images/sim_logo.png',
                          hasBackground: true),
                      childWhenDragging: const SizedBox(),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(selectedEducationIndexProvider.notifier)
                            .change(1),
                        child: const LogoWidget(
                            logoImagePath: 'assets/images/sim_logo.png',
                            hasBackground: true),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    right: 47.5,
                    child: Draggable<EducationClass>(
                      data: eduClassList[1],
                      feedback: const LogoWidget(
                          logoImagePath: 'assets/images/np_logo.png',
                          hasBackground: true),
                      childWhenDragging: const SizedBox(),
                      child: GestureDetector(
                        onTap: () => ref
                            .read(selectedEducationIndexProvider.notifier)
                            .change(2),
                        child: const LogoWidget(
                            logoImagePath: 'assets/images/np_logo.png',
                            hasBackground: true),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        alignment: Alignment.topCenter,
                        child: eduWidgetsList[
                            ref.watch(selectedEducationIndexProvider)],
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
