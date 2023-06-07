import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';

class ProjectDisplayWidget extends ConsumerStatefulWidget {
  const ProjectDisplayWidget({Key? key}) : super(key: key);

  @override
  ProjectDisplayWidgetState createState() => ProjectDisplayWidgetState();
}

class ProjectDisplayWidgetState extends ConsumerState<ProjectDisplayWidget> {
  ScrollController descriptionScrollerController = ScrollController();
  ScrollController moreInfoScrollerController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var projectIndex = ref.watch(selectedProjectDetailIndexProvider);

    return projectIndex == 0
        ? const Center(
            child: SelectableText("Select a project to view details",
                style: AppStyles.montserrat18Bold),
          )
        : Column(
            children: [
              Container(
                height: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                    ? 125
                    : 75,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  projectList[projectIndex - 1].title,
                  style: AppStyles.montserrat18ColoredBold,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 30),
                  child: ResponsiveRowColumn(
                    layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Expanded(
                          child: Scrollbar(
                            controller: descriptionScrollerController,
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              controller: descriptionScrollerController,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                        "Date: ${DateFormat('MMM yyyy').format(projectList[projectIndex - 1].date)}"),
                                    projectList[projectIndex - 1].githubLink !=
                                            ""
                                        ? LinkWidget(
                                            titleString: "Github: ",
                                            linkString:
                                                projectList[projectIndex - 1]
                                                    .githubLink,
                                          )
                                        : const SizedBox(),
                                    projectList[projectIndex - 1]
                                                .prototypeLink1 !=
                                            ""
                                        ? LinkWidget(
                                            titleString: "Lo-Fi Prototype: ",
                                            linkString:
                                                projectList[projectIndex - 1]
                                                    .prototypeLink1!,
                                          )
                                        : const SizedBox(),
                                    projectList[projectIndex - 1]
                                                .prototypeLink2 !=
                                            ""
                                        ? LinkWidget(
                                            titleString: "Hi-Fi Prototype: ",
                                            linkString:
                                                projectList[projectIndex - 1]
                                                    .prototypeLink2!,
                                          )
                                        : const SizedBox(),
                                    projectList[projectIndex - 1].appLink != ""
                                        ? LinkWidget(
                                            titleString: "App Link: ",
                                            linkString:
                                                projectList[projectIndex - 1]
                                                    .appLink!,
                                          )
                                        : const SizedBox(),
                                    projectList[projectIndex - 1].webLink != ""
                                        ? LinkWidget(
                                            titleString: "Web Link: ",
                                            linkString:
                                                projectList[projectIndex - 1]
                                                    .webLink!,
                                          )
                                        : const SizedBox(),
                                    projectList[projectIndex - 1].demoLink != ""
                                        ? LinkWidget(
                                            titleString: "Demo Link: ",
                                            linkString:
                                                projectList[projectIndex - 1]
                                                    .demoLink!,
                                          )
                                        : const SizedBox(),
                                    SelectableText(projectList[projectIndex - 1]
                                        .description),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CarouselSlider(
                                  items: projectList[projectIndex - 1]
                                      .listOfImagePaths
                                      .map((imagePath) {
                                    return Builder(
                                        builder: (BuildContext context) {
                                      return Image(
                                        image: AssetImage(imagePath),
                                        errorBuilder: (context, index, _) =>
                                            const Image(
                                          image: AssetImage(
                                            "assets/images/img_placeholder.png",
                                          ),
                                        ),
                                      );
                                    });
                                  }).toList(),
                                  options: CarouselOptions(
                                    enableInfiniteScroll:
                                        projectList[projectIndex - 1]
                                                    .listOfImagePaths
                                                    .length >
                                                1
                                            ? true
                                            : false,
                                    autoPlay: projectList[projectIndex - 1]
                                                .listOfImagePaths
                                                .length >
                                            1
                                        ? true
                                        : false,
                                    enlargeCenterPage: true,
                                    aspectRatio: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: Scrollbar(
                                  controller: moreInfoScrollerController,
                                  thumbVisibility: projectList[projectIndex - 1]
                                                  .additionalInfo ==
                                              null &&
                                          projectList[projectIndex - 1]
                                                  .futureWork ==
                                              null
                                      ? false
                                      : true,
                                  child: SingleChildScrollView(
                                    controller: moreInfoScrollerController,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          projectList[projectIndex - 1]
                                                      .additionalInfo !=
                                                  null
                                              ? SelectableText(
                                                  projectList[projectIndex - 1]
                                                      .additionalInfo!)
                                              : const SizedBox(),
                                          const SizedBox(height: 30),
                                          projectList[projectIndex - 1]
                                                      .futureWork !=
                                                  null
                                              ? SelectableText(
                                                  projectList[projectIndex - 1]
                                                      .futureWork!)
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}

class LinkWidget extends StatelessWidget {
  const LinkWidget({
    Key? key,
    required this.titleString,
    required this.linkString,
  }) : super(key: key);

  final String titleString;
  final String linkString;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ResponsiveWrapper.of(context).isLargerThan(DESKTOP)
              ? 160
              : ResponsiveWrapper.of(context).isLargerThan("MINI-DESKTOP")
                  ? 135
                  : ResponsiveWrapper.of(context).isLargerThan(TABLET)
                      ? 90
                      : ResponsiveWrapper.of(context)
                              .isLargerThan("BP-FOR-MOBILE")
                          ? 125
                          : 150,
          child: SelectableText(
            titleString,
            maxLines: 2,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () async {
                try {
                  await launchUrl(Uri.parse(linkString),
                      mode: LaunchMode.inAppWebView);
                } on Exception {}
              },
              child: const SelectableText("Link"),
            ),
          ),
        ),
      ],
    );
  }
}
