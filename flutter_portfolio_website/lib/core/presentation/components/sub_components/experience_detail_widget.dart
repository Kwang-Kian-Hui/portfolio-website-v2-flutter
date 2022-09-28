import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ExperienceDetailWidget extends ConsumerStatefulWidget {
  const ExperienceDetailWidget({Key? key, required this.currentSelection})
      : super(key: key);
  final ExperienceClass currentSelection;

  @override
  ExperienceDetailWidgetState createState() => ExperienceDetailWidgetState();
}

class ExperienceDetailWidgetState
    extends ConsumerState<ExperienceDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            DragTarget<ExperienceClass>(
              onAccept: (droppedIndex) {
                ref
                    .read(selectedExperienceIndexProvider.notifier)
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
            Expanded(
              child: Container(
                height: 54,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.currentSelection.expTitle, maxLines: 3,
                  style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                          ResponsiveWrapper.of(context)
                              .isSmallerThan(DESKTOP)
                      ? AppStyles.roboto14Bold
                      : ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-MOBILE")
                          ? AppStyles.roboto14Bold
                          : AppStyles.roboto20Bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.currentSelection.jobTitle, maxLines: 3,
                  style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                          ResponsiveWrapper.of(context)
                              .isSmallerThan(DESKTOP)
                      ? AppStyles.roboto14Bold
                      : ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-MOBILE")
                          ? AppStyles.roboto14Bold
                          : AppStyles.roboto18Bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "${DateFormat("MMM yyyy").format(widget.currentSelection.startDate)} - ${DateFormat("MMM yyyy").format(widget.currentSelection.endDate)}", maxLines: 3,
                  style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                          ResponsiveWrapper.of(context)
                              .isSmallerThan(DESKTOP)
                      ? AppStyles.roboto14Bold
                      : ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-MOBILE")
                          ? AppStyles.roboto14Bold
                          : AppStyles.roboto18Bold,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.currentSelection.description,
                  maxLines: 20,
                  textAlign: TextAlign.start,
                  style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                          ResponsiveWrapper.of(context)
                              .isSmallerThan(DESKTOP)
                      ? AppStyles.roboto10
                      : ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-MOBILE")
                          ? AppStyles.roboto10
                          : AppStyles.roboto14,
                ),
              ),
            ),
      ],
    );
  }
}
