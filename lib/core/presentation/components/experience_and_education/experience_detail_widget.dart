import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';

// import 'package:video_player/video_player.dart';

class ExperienceDetailWidget extends ConsumerStatefulWidget {
  const ExperienceDetailWidget({Key? key, required this.currentSelection})
      : super(key: key);
  final ExperienceClass currentSelection;

  @override
  ExperienceDetailWidgetState createState() => ExperienceDetailWidgetState();
}

class ExperienceDetailWidgetState
    extends ConsumerState<ExperienceDetailWidget> {
  final Uri _url = Uri.parse(
      'https://synpulse8.com/our-solutions/pulse8-srs-framework');

  bool urlError = false;

  ScrollController detailScrollController = ScrollController();

  //     late VideoPlayerController _videoController;

  // @override
  // void initState() {
  //   super.initState();
  //   _videoController = VideoPlayerController.network(
  //       'https://synpulse8.com/our-solutions/pulse8-srs-framework')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                padding: AppStyles.horizontalPadding10,
                child: SelectableText(
                  widget.currentSelection.expTitle,
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
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: AppStyles.horizontalPadding10,
            child: SelectableText(
              widget.currentSelection.jobTitle,
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
          flex: 6,
          child: Scrollbar(
            thumbVisibility: true,
            thickness: 5,
            controller: detailScrollController,
            child: SingleChildScrollView(
              controller: detailScrollController,
              child: Container(
                alignment: Alignment.topLeft,
                padding: AppStyles.horizontalPadding10,
                child: SelectableText(
                  widget.currentSelection.description,
                  textAlign: TextAlign.start,
                  style: ResponsiveWrapper.of(context).isLargerThan(TABLET) &&
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? AppStyles.roboto10
                      : ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-MOBILE")
                          ? AppStyles.roboto10
                          : AppStyles.roboto14,
                ),
              ),
            ),
          ),
        ),
        widget.currentSelection.index == 2
            ? Expanded(
              child: TextButton(
                  onPressed: () async {
                    try {
                      await launchUrl(_url, mode: LaunchMode.inAppWebView);
                    } on Exception {
                      urlError = true;
                    }
                  },
                  child: SelectableText(
                    !urlError
                        ? "Have a look at the project here!"
                        : "Have a look at the project here: https://synpulse8.com/our-solutions/pulse8-srs-framework",
                    style: AppStyles.roboto14Colored,
                  ),
                ),
            )
            : const SizedBox(),
      ],
    );
  }
}
