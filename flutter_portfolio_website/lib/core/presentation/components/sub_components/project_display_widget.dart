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
            child: Text("Select a project to view details",
                style: AppStyles.roboto18Bold),
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
                  style: AppStyles.roboto18ColoredBold,
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
                    children: [
                      ResponsiveRowColumnItem(
                        child: Expanded(
                          child: SingleChildScrollView(
                            controller: descriptionScrollerController,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Date: ${DateFormat('MMM yyyy').format(projectList[projectIndex - 1].date)}"),
                                  projectList[projectIndex - 1].githubLink != ""
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
                                          titleString: "Lo-Fi Prototype Link: ",
                                          linkString:
                                              projectList[projectIndex - 1]
                                                  .prototypeLink1!,
                                        )
                                      : const SizedBox(),
                                  projectList[projectIndex - 1]
                                              .prototypeLink2 !=
                                          ""
                                      ? LinkWidget(
                                          titleString: "Hi-Fi Prototype Link: ",
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
                                  Text(projectList[projectIndex - 1]
                                      .description),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ResponsiveWrapper.of(context)
                      // .isSmallerThan("BP-FOR-MOBILE") ? const ResponsiveRowColumnItem(child: SizedBox()) : ResponsiveRowColumnItem(
                      //   child: Expanded(
                      //                         child: SingleChildScrollView(
                      //                           controller: descriptionScrollerController,
                      //                           child: Padding(
                      //                             padding: const EdgeInsets.symmetric(horizontal: 30),
                      //                             child: Column(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Text(projectList[projectIndex - 1].description),
                      //   ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      // ),
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
                                      return Container(
                                        child: Image(
                                          image: AssetImage(imagePath),
                                          errorBuilder: (context, index, _) =>
                                              const Image(
                                                  image: AssetImage(
                                                      "assets/images/img_placeholder.png")),
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
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: moreInfoScrollerController,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      children: [
                                        projectList[projectIndex - 1]
                                                    .additionalInfo !=
                                                null
                                            ? Text(projectList[projectIndex - 1]
                                                .additionalInfo!)
                                            : const SizedBox(),
                                        projectList[projectIndex - 1]
                                                    .futureWork !=
                                                null
                                            ? Text(projectList[projectIndex - 1]
                                                .futureWork!)
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ResponsiveWrapper.of(context)
                      //         .isSmallerThan("BP-FOR-MOBILE") ? ResponsiveRowColumnItem(
                      //           child: Expanded(
                      //                                 child: SingleChildScrollView(
                      //                                   controller: descriptionScrollerController,
                      //                                   child: Padding(
                      //                                     padding: const EdgeInsets.symmetric(horizontal: 30),
                      //                                     child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text(projectList[projectIndex - 1].description),
                      //           ],
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //         ) : const ResponsiveRowColumnItem(child: SizedBox()),
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
        Text(titleString),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () async {
                try {
                  await launchUrl(Uri.parse(linkString),
                      mode: LaunchMode.inAppWebView);
                } on Exception {
                  print("error");
                }
              },
              child: const Text("Link"),
            ),
          ),
        ),
      ],
    );
  }
}
