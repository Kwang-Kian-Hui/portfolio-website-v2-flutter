import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/application/education_class.dart';
import 'package:intl/intl.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EducationDetailWidget extends ConsumerStatefulWidget {
  const EducationDetailWidget({Key? key, required this.currentSelection})
      : super(key: key);
  final EducationClass currentSelection;

  @override
  EducationDetailWidgetState createState() => EducationDetailWidgetState();
}

class EducationDetailWidgetState extends ConsumerState<EducationDetailWidget> {
  ScrollController detailScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: AppStyles.horizontalPadding10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectableText(
                  widget.currentSelection.eduTitle,
                  style: AppStyles.montserrat25,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SelectableText(
                  widget.currentSelection.courseTitle,
                  style: AppStyles.montserrat18,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SelectableText(
                  "${DateFormat("MMM yyyy").format(widget.currentSelection.startDate)} - "
                  "${widget.currentSelection.endDate == DateTime(0, 0, 0) ? "Present" : DateFormat("MMM yyyy").format(widget.currentSelection.endDate)}",
                  style: AppStyles.montserrat18,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              controller: detailScrollController,
              child: SingleChildScrollView(
                controller: detailScrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? AppStyles.mobileBorderPadding
                              : AppStyles.webBorderPadding),
                      child: SelectableText(
                        "(${widget.currentSelection.grade})",
                        style: AppStyles.montserrat14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? AppStyles.mobileBorderPadding
                              : AppStyles.webBorderPadding),
                      child: SelectableText(
                        widget.currentSelection.description,
                        style: AppStyles.montserrat14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // widget.currentSelection.eduTitle == "Synpulse8"
          //     ? Padding(
          //       padding: const EdgeInsets.only(top: 15),
          //       child: TextButton(
          //           onPressed: () async {
          //             try {
          //               await launchUrl(_url, mode: LaunchMode.inAppWebView);
          //             } on Exception {
          //               urlError = true;
          //             }
          //           },
          //           child: Text(
          //             !urlError
          //                 ? "Click here to learn more about the project"
          //                 : "Have a look at the project here: https://synpulse8.com/our-solutions/pulse8-srs-framework",
          //             style: AppStyles.montserrat14Bold,
          //           ),
          //         ),
          //     )
          //     : const SizedBox(),
        ],
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //     Row(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             height: 54,
    //             alignment: Alignment.centerLeft,
    //             padding: AppStyles.horizontalPadding10,
    //             child: SelectableText(
    //               widget.currentSelection.eduTitle,
    //               style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
    //                       ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
    //                   ? AppStyles.montserrat14ColoredBold
    //                   : ResponsiveWrapper.of(context)
    //                           .isSmallerThan("BP-FOR-MOBILE")
    //                       ? AppStyles.montserrat14ColoredBold
    //                       : AppStyles.montserrat20ColoredBold,
    //             ),
    //           ),
    //         ),
    //         DragTarget<EducationClass>(
    //           onAccept: (droppedIndex) {
    //             ref
    //                 .read(selectedEducationIndexProvider.notifier)
    //                 .change(droppedIndex.index);
    //           },
    //           onWillAccept: (droppedData) {
    //             if (droppedData != null) {
    //               return true;
    //             }
    //             return false;
    //           },
    //           builder: (context, candidateData, rejectedData) => LogoWidget(
    //             logoImagePath: widget.currentSelection.imagePath,
    //             hasBackground: widget.currentSelection.hasBackground,
    //             width: 80,
    //           ),
    //         ),
    //       ],
    //     ),
    //     Expanded(
    //       child: Container(
    //         alignment: Alignment.centerLeft,
    //         padding: AppStyles.horizontalPadding10,
    //         child: SelectableText(
    //           widget.currentSelection.courseTitle,
    //           style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
    //                   ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
    //               ? AppStyles.montserrat14Bold
    //               : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
    //                   ? AppStyles.montserrat14Bold
    //                   : AppStyles.montserrat18Bold,
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         alignment: Alignment.centerLeft,
    //         padding: AppStyles.horizontalPadding10,
    //         child: SelectableText(
    //           "${DateFormat("MMM yyyy").format(widget.currentSelection.startDate)} - ${widget.currentSelection.endDate == DateTime(0, 0, 0) ? "Present" : DateFormat("MMM yyyy").format(widget.currentSelection.endDate)}",
    //           style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
    //                   ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
    //               ? AppStyles.montserrat14Bold
    //               : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
    //                   ? AppStyles.montserrat14Bold
    //                   : AppStyles.montserrat18Bold,
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         alignment: Alignment.centerLeft,
    //         padding: AppStyles.horizontalPadding10,
    //         child: SelectableText(
    //           widget.currentSelection.grade,
    //           style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
    //                   ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
    //               ? AppStyles.montserrat10
    //               : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
    //                   ? AppStyles.montserrat10
    //                   : AppStyles.montserrat14,
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       flex: 5,
    //       child: Container(
    //         alignment: Alignment.topLeft,
    //         padding: AppStyles.horizontalPadding10,
    //         child: SelectableText(
    //           widget.currentSelection.description,
    //           textAlign: TextAlign.start,
    //           style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
    //                   ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
    //               ? AppStyles.montserrat10
    //               : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
    //                   ? AppStyles.montserrat10
    //                   : AppStyles.montserrat14,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
