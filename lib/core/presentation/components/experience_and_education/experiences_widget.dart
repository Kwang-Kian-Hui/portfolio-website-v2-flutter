import 'dart:async';

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_portfolio_website/core/application/education_class.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';
import 'package:flutter_portfolio_website/core/infrastructure/edu_and_exp_data.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/radial_menu_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/radial_menu_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/education_detail_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/empty_selection_edu.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/empty_selection_exp.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/experience_detail_widget.dart';
import 'package:flutter_portfolio_website/core/shared/const.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

import 'empty_selection_edu.dart';

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

  @override
  Widget build(BuildContext context) {
    var selectedExperiencesIndex = ref.watch(selectedExperienceIndexProvider);
    var selectedEducationIndex = ref.watch(selectedEducationIndexProvider);

    bool isSmallerThanCustomBp =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT");
    return Container(
      height: isSmallerThanCustomBp
          ? (MediaQuery.of(context).size.height - 120) * 2
          : MediaQuery.of(context).size.height - 120,
      constraints: const BoxConstraints(
        minHeight: 1440,
      ),
      margin: const EdgeInsets.only(top: 120),
      child: ResponsiveRowColumn(
        layout: isSmallerThanCustomBp
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Expanded(
              child: Container(
                margin: !isSmallerThanCustomBp
                    ? const EdgeInsets.only(
                        left: 39, top: 39, bottom: 39, right: 19.5)
                    : const EdgeInsets.all(39),
                decoration: BoxDecoration(
                  color: AppStyles.containerColour,
                  borderRadius:
                      BorderRadius.circular(AppStyles.containerBorderRadius),
                  boxShadow: AppStyles.containerShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 215,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 50,
                                top: 50,
                              ),
                              child: RadialMenuWidget(
                                controller: ref
                                    .watch(expRadialMenuAnimationController)!,
                                isExp: true,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.only(
                                right: 50,
                                top: 50,
                              ),
                              child: DragTarget<ExperienceClass>(
                                onAccept: (droppedIndex) {
                                  ref
                                      .read(selectedExperienceIndexProvider
                                          .notifier)
                                      .change(droppedIndex.index);
                                  ref
                                      .read(expRadialMenuAnimationController
                                          .notifier)
                                      .reverse();
                                },
                                onWillAccept: (droppedData) {
                                  if (droppedData != null) {
                                    return true;
                                  }
                                  return false;
                                },
                                builder: ((context, candidateData,
                                        rejectedData) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: selectedExperiencesIndex == 0
                                            ? AppStyles
                                                .invertedRoundedButtonShadow
                                            : [],
                                      ),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: AppStyles
                                              .invertedContainerGradient,
                                        ),
                                        child: selectedExperiencesIndex == 0
                                            ? const SizedBox()
                                            : MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      ref
                                                          .read(
                                                              selectedExperienceIndexProvider
                                                                  .notifier)
                                                          .change(0);
                                                    });
                                                  },
                                                  child: LogoWidget(
                                                    logoImagePath: expClassList[
                                                            selectedExperiencesIndex -
                                                                1]
                                                        .imagePath,
                                                    hasBackground: expClassList[
                                                            selectedExperiencesIndex -
                                                                1]
                                                        .hasBackground,
                                                    width: 60,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    expWidgetsList[selectedExperiencesIndex],
                    const SizedBox(height: 39),
                  ],
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Expanded(
              child: Container(
                margin: !isSmallerThanCustomBp
                    ? const EdgeInsets.only(
                        left: 19.5, top: 39, bottom: 39, right: 39)
                    : const EdgeInsets.all(39),
                decoration: BoxDecoration(
                  color: AppStyles.containerColour,
                  borderRadius:
                      BorderRadius.circular(AppStyles.containerBorderRadius),
                  boxShadow: AppStyles.containerShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 215,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 50,
                                top: 50,
                              ),
                              child: DragTarget<EducationClass>(
                                onAccept: (droppedIndex) {
                                  ref
                                      .read(selectedEducationIndexProvider
                                          .notifier)
                                      .change(droppedIndex.index);
                                  ref
                                      .read(eduRadialMenuAnimationController
                                          .notifier)
                                      .reverse();
                                },
                                onWillAccept: (droppedData) {
                                  if (droppedData != null) {
                                    return true;
                                  }
                                  return false;
                                },
                                builder: ((context, candidateData,
                                        rejectedData) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: selectedEducationIndex == 0
                                            ? AppStyles
                                                .invertedRoundedButtonShadow
                                            : [],
                                      ),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: AppStyles
                                              .invertedContainerGradient,
                                        ),
                                        child: selectedEducationIndex == 0
                                            ? const SizedBox()
                                            : MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      ref
                                                          .read(
                                                              selectedEducationIndexProvider
                                                                  .notifier)
                                                          .change(0);
                                                    });
                                                  },
                                                  child: LogoWidget(
                                                    logoImagePath: eduClassList[
                                                            selectedEducationIndex -
                                                                1]
                                                        .imagePath,
                                                    hasBackground: eduClassList[
                                                            selectedEducationIndex -
                                                                1]
                                                        .hasBackground,
                                                    width: 60,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.only(
                                right: 50,
                                top: 50,
                              ),
                              child: RadialMenuWidget(
                                controller: ref
                                    .watch(eduRadialMenuAnimationController)!,
                                isExp: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    eduWidgetsList[selectedEducationIndex],
                    const SizedBox(height: 39),
                  ],
                ),
              ),
            ),
          ),

          // ResponsiveRowColumnItem(
          //   child: AnimatedContainer(
          //     duration: const Duration(seconds: 3),
          //     alignment: Alignment.bottomCenter,
          //     curve: Curves.ease,
          //     padding: EdgeInsets.only(bottom: animatedPadding),
          //     height: MediaQuery.of(context).size.height,
          //     child: Container(
          //       height: 80,
          //       width: 80,
          //       decoration: const BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: AppStyles.greyColour,
          //       ),
          //       alignment: Alignment.center,
          //       child: Image.asset(
          //         "assets/images/icons/synpulse8_logo.png",
          //         height: 60,
          //         width: 60,
          //         fit: BoxFit.fill,
          //         filterQuality: FilterQuality.medium,
          //       ),
          //     ),
          //   ),
          // ),
          //     ResponsiveRowColumnItem(
          //       child: Expanded(
          //         child: Stack(
          //           fit: StackFit.expand,
          //           alignment: Alignment.topCenter,
          //           children: [
          //             Positioned(
          //               top: 90,
          //               left: isSmallerThanTablet ? 70 : 100,
          //               right: isSmallerThanTablet ? 70 : 100,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     height: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 100,
          //               left: isSmallerThanTablet ? 70 : 100,
          //               right: isSmallerThanTablet ? 70 : 100,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     height: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 150,
          //               left: isSmallerThanTablet ? 50 : 70,
          //               bottom: 150,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     width: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 150,
          //               left: isSmallerThanTablet ? 60 : 80,
          //               bottom: 150,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     width: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 0,
          //               child: Container(
          //                 width: 250,
          //                 height: 190,
          //                 alignment: Alignment.center,
          //                 color: AppStyles.mainAppColour,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: const [
          //                     SelectableText("Where I've", style: AppStyles.montserrat25Bold),
          //                     SelectableText(" Worked", style: AppStyles.montserrat25ColoredBold),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 180,
          //               left: isSmallerThanTablet ? 27.5 : 47.5,
          // child: Draggable<ExperienceClass>(
          //   data: expClassList[0],
          //   feedback: const LogoWidget(
          //       logoImagePath: ConstObjects.s8Logo,
          //       hasBackground: false),
          //   childWhenDragging: const SizedBox(),
          //   child: GestureDetector(
          //     onTap: () => ref
          //         .read(selectedExperienceIndexProvider.notifier)
          //         .change(1),
          //     child: const LogoWidget(
          //       logoImagePath: ConstObjects.s8Logo,
          //       hasBackground: false,
          //     ),
          //   ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 250,
          //               left: isSmallerThanTablet ? 27.5 : 47.5,
          //               child: Draggable<ExperienceClass>(
          //                 data: expClassList[1],
          //                 feedback: const LogoWidget(
          //                     logoImagePath: ConstObjects.s8Logo,
          //                     hasBackground: false),
          //                 childWhenDragging: const SizedBox(),
          //                 child: GestureDetector(
          //                   onTap: () => ref
          //                       .read(selectedExperienceIndexProvider.notifier)
          //                       .change(2),
          //                   child: const LogoWidget(
          //                     logoImagePath: ConstObjects.s8Logo,
          //                     hasBackground: false,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 320,
          //               left: isSmallerThanTablet ? 27.5 : 47.5,
          //               child: Draggable<ExperienceClass>(
          //                 data: expClassList[2],
          //                 feedback: const LogoWidget(
          //                     logoImagePath:
          //                         ConstObjects.abundantAccountingLogo,
          //                     hasBackground: true),
          //                 childWhenDragging: const SizedBox(),
          //                 child: GestureDetector(
          //                   onTap: () => ref
          //                       .read(selectedExperienceIndexProvider.notifier)
          //                       .change(3),
          //                   child: const LogoWidget(
          //                     logoImagePath:
          //                         ConstObjects.abundantAccountingLogo,
          //                     hasBackground: true,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               left: isSmallerThanTablet ? 100 : 130,
          //               top: 150,
          //               right: isSmallerThanTablet ? 60 : 100,
          //               child: Card(
          //                 elevation: 5,
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20),
          //                 ),
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     color: AppStyles.containerColour,
          //                     borderRadius: BorderRadius.circular(20),
          //                   ),
          //                   height: MediaQuery.of(context).size.height * 0.65,
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 30, horizontal: 30),
          //                   alignment: Alignment.topCenter,
          //                   child: expWidgetsList[
          //                       ref.watch(selectedExperienceIndexProvider)],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     ResponsiveRowColumnItem(
          //       child: Expanded(
          //         child: Stack(
          //           fit: StackFit.expand,
          //           alignment: Alignment.topCenter,
          //           children: [
          //             Positioned(
          //               top: 90,
          //               left: isSmallerThanTablet ? 70 : 100,
          //               right: isSmallerThanTablet ? 70 : 100,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     height: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 100,
          //               left: isSmallerThanTablet ? 70 : 100,
          //               right: isSmallerThanTablet ? 70 : 100,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     height: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 150,
          //               right: isSmallerThanTablet ? 50 : 70,
          //               bottom: 150,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     width: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 150,
          //               right: isSmallerThanTablet ? 60 : 80,
          //               bottom: 150,
          //               child: SizedBox(
          //                 height: 10.0,
          //                 child: Center(
          //                   child: Container(
          //                     margin: const EdgeInsetsDirectional.only(
          //                         start: 1.0, end: 1.0),
          //                     width: 0.5,
          //                     color: Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 0,
          //               child: Container(
          //                 width: 250,
          //                 height: 190,
          //                 alignment: Alignment.center,
          //                 color: AppStyles.mainAppColour,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: const [
          //                     SelectableText("Where I've", style: AppStyles.montserrat25Bold),
          //                     SelectableText(" Studied",
          //                         style: AppStyles.montserrat25ColoredBold),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 180,
          //               right: isSmallerThanTablet ? 27.5 : 47.5,
          //               child: Draggable<EducationClass>(
          //                 data: eduClassList[0],
          //                 feedback: const LogoWidget(
          //                     logoImagePath: ConstObjects.simLogo,
          //                     hasBackground: true),
          //                 childWhenDragging: const SizedBox(),
          //                 child: GestureDetector(
          //                   onTap: () => ref
          //                       .read(selectedEducationIndexProvider.notifier)
          //                       .change(1),
          //                   child: const LogoWidget(
          //                       logoImagePath: ConstObjects.simLogo,
          //                       hasBackground: true),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: 250,
          //               right: isSmallerThanTablet ? 27.5 : 47.5,
          //               child: Draggable<EducationClass>(
          //                 data: eduClassList[1],
          //                 feedback: const LogoWidget(
          //                     logoImagePath: ConstObjects.npLogo,
          //                     hasBackground: true),
          //                 childWhenDragging: const SizedBox(),
          //                 child: GestureDetector(
          //                   onTap: () => ref
          //                       .read(selectedEducationIndexProvider.notifier)
          //                       .change(2),
          //                   child: const LogoWidget(
          //                       logoImagePath: ConstObjects.npLogo,
          //                       hasBackground: true),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               left: isSmallerThanTablet ? 60 : 100,
          //               top: 150,
          //               right: isSmallerThanTablet ? 100 : 130,
          //               child: Card(
          //                 elevation: 5,
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20),
          //                 ),
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     color: AppStyles.containerColour,
          //                     borderRadius: BorderRadius.circular(20),
          //                   ),
          //                   height: MediaQuery.of(context).size.height * 0.65,
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 30, horizontal: 30),
          //                   alignment: Alignment.topCenter,
          //                   child: eduWidgetsList[
          //                       ref.watch(selectedEducationIndexProvider)],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          // ),
        ],
      ),
    );
  }
}
