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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 54,
                alignment: Alignment.centerLeft,
                padding: AppStyles.horizontalPadding10,
                child: SelectableText(
                  widget.currentSelection.eduTitle,
                  style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? AppStyles.roboto14ColoredBold
                      : ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-MOBILE")
                          ? AppStyles.roboto14ColoredBold
                          : AppStyles.roboto20ColoredBold,
                ),
              ),
            ),
            DragTarget<EducationClass>(
              onAccept: (droppedIndex) {
                ref
                    .read(selectedEducationIndexProvider.notifier)
                    .change(droppedIndex.index);
              },
              onWillAccept: (droppedData) {
                if (droppedData != null) {
                  return true;
                }
                return false;
              },
              builder: (context, candidateData, rejectedData) => LogoWidget(
                logoImagePath: widget.currentSelection.imagePath,
                hasBackground: widget.currentSelection.hasBackground,
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: AppStyles.horizontalPadding10,
            child: SelectableText(
              widget.currentSelection.courseTitle,
              style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? AppStyles.roboto14Bold
                  : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
                      ? AppStyles.roboto14Bold
                      : AppStyles.roboto18Bold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: AppStyles.horizontalPadding10,
            child: SelectableText(
              "${DateFormat("MMM yyyy").format(widget.currentSelection.startDate)} - ${widget.currentSelection.endDate == DateTime(0, 0, 0) ? "Present" : DateFormat("MMM yyyy").format(widget.currentSelection.endDate)}",
              style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? AppStyles.roboto14Bold
                  : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
                      ? AppStyles.roboto14Bold
                      : AppStyles.roboto18Bold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: AppStyles.horizontalPadding10,
            child: SelectableText(
              widget.currentSelection.grade,
              style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? AppStyles.roboto10
                  : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
                      ? AppStyles.roboto10
                      : AppStyles.roboto14,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.topLeft,
            padding: AppStyles.horizontalPadding10,
            child: SelectableText(
              widget.currentSelection.description,
              textAlign: TextAlign.start,
              style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? AppStyles.roboto10
                  : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
                      ? AppStyles.roboto10
                      : AppStyles.roboto14,
            ),
          ),
        ),
      ],
    );
  }
}
