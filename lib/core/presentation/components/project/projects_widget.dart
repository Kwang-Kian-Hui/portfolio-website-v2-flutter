import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/application/project_class.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_detail_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_display_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_item_card_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_selector_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_portfolio_website/core/shared/widget_builders.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectsWidget extends ConsumerStatefulWidget {
  const ProjectsWidget({Key? key}) : super(key: key);

  @override
  ProjectsWidgetState createState() => ProjectsWidgetState();
}

class ProjectsWidgetState extends ConsumerState<ProjectsWidget> {
  bool projectTypeFilterButtonOpen = false;
  List<Project> filteredProjectList = projectList;

  List<ResponsiveRowColumnItem> buildProjectCardItems(
      int i, bool isSmallerThanCustomBp) {
    List<ResponsiveRowColumnItem> widgetList = [
      ResponsiveRowColumnItem(
          child: ProjectItemCardWidget(projectItem: filteredProjectList[i]))
    ];
    if (i + 1 < filteredProjectList.length) {
      widgetList.add(ResponsiveRowColumnItem(
          child:
              ProjectItemCardWidget(projectItem: filteredProjectList[i + 1])));
    } else {
      widgetList.add(
          const ResponsiveRowColumnItem(child: Expanded(child: SizedBox())));
    }
    if (!isSmallerThanCustomBp) {
      if (i + 2 < filteredProjectList.length) {
        widgetList.add(ResponsiveRowColumnItem(
            child: ProjectItemCardWidget(
                projectItem: filteredProjectList[i + 2])));
      } else {
        widgetList.add(
            const ResponsiveRowColumnItem(child: Expanded(child: SizedBox())));
      }
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    bool isSmallerThanCustomBp =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2");
    bool isSmallerThanMiniDesktop =
        ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP");
    var selectedProjectIndex = ref.watch(selectedProjectIndexProvider);
    bool lessProjectsSelectable = isSmallerThanCustomBp
        ? ref.watch(viewingProjectIndex) - 2 >= -1
        : ref.watch(viewingProjectIndex) - 3 >= -2;
    bool moreProjectsSelectable = isSmallerThanCustomBp
        ? ref.watch(viewingProjectIndex) + 2 < filteredProjectList.length
        : ref.watch(viewingProjectIndex) + 3 < filteredProjectList.length;
    return Container(
      height: deviceHeight - 159,
      constraints: const BoxConstraints(
        minHeight: 720,
      ),
      margin: const EdgeInsets.only(top: 159),
      child: Container(
        margin: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
        decoration: BoxDecoration(
            color: AppStyles.containerColour,
            borderRadius:
                BorderRadius.circular(AppStyles.containerBorderRadius),
            boxShadow: AppStyles.containerShadow),
        child: Column(
          children: [
            Row(
              children: [
                selectedProjectIndex != -1
                    ? SizedBox(
                        width: 50,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: const Icon(
                              Icons.arrow_back,
                              size: 25,
                              color: AppStyles.greyColour,
                            ),
                            onTap: () {
                              setState(() {
                                ref
                                    .read(selectedProjectIndexProvider.notifier)
                                    .change(-1);
                              });
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  flex: 6,
                  child: Padding(
                      padding:
                          const EdgeInsets.all(AppStyles.mobileBorderPadding),
                      child: selectedProjectIndex == -1
                          ? GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onPanDown: (details) {
                                setState(() {
                                  projectTypeFilterButtonOpen = true;
                                });
                              },
                              child: PopupMenuButton<String>(
                                position: PopupMenuPosition.under,
                                initialValue: "All",
                                onCanceled: () => setState(() {
                                  projectTypeFilterButtonOpen = false;
                                }),
                                onSelected: (value) {
                                  setState(() {
                                    projectTypeFilterButtonOpen = false;
                                    ref
                                        .read(viewingProjectIndex.notifier)
                                        .change(0);
                                    switch (value) {
                                      case "All":
                                        filteredProjectList = projectList;
                                        ref
                                            .read(selectedProjectFilterProvider
                                                .notifier)
                                            .change("All");
                                        break;
                                      case "Frontend":
                                        filteredProjectList = projectList
                                            .where((element) => element
                                                    .categories
                                                    .toSet()
                                                    .intersection({
                                                  "Web",
                                                  "Mobile"
                                                }).isNotEmpty)
                                            .toList();
                                        ref
                                            .read(selectedProjectFilterProvider
                                                .notifier)
                                            .change("Frontend");
                                        break;
                                      case "Backend":
                                        filteredProjectList = projectList
                                            .where((element) => element
                                                    .categories
                                                    .toSet()
                                                    .intersection({
                                                  "Django",
                                                  "Google Firestore",
                                                  "SQLite"
                                                }).isNotEmpty)
                                            .toList();
                                        ref
                                            .read(selectedProjectFilterProvider
                                                .notifier)
                                            .change("Backend");
                                        break;
                                      case "Data Engineering / Science / Analytics":
                                        filteredProjectList = projectList
                                            .where((element) => element
                                                    .categories
                                                    .toSet()
                                                    .intersection({
                                                  "ETL",
                                                  "Data Engineering",
                                                  "Data Analytics"
                                                }).isNotEmpty)
                                            .toList();
                                        ref
                                            .read(selectedProjectFilterProvider
                                                .notifier)
                                            .change(
                                                "Data Engineering / Science / Analytics");
                                        break;
                                      case "AI / ML":
                                        filteredProjectList = projectList
                                            .where((element) => element
                                                    .categories
                                                    .toSet()
                                                    .intersection({
                                                  "AI / ML",
                                                  "Mobile"
                                                }).isNotEmpty)
                                            .toList();
                                        ref
                                            .read(selectedProjectFilterProvider
                                                .notifier)
                                            .change("AI / ML");
                                        break;
                                      case "Others":
                                        filteredProjectList = projectList
                                            .where((element) => element
                                                    .categories
                                                    .toSet()
                                                    .intersection({
                                                  "Image Processing",
                                                  "Audio Processing",
                                                  "Speech Recognition",
                                                  "Animations",
                                                  "C++"
                                                }).isNotEmpty)
                                            .toList();
                                        ref
                                            .read(selectedProjectFilterProvider
                                                .notifier)
                                            .change("Others");
                                        break;
                                      default:
                                        filteredProjectList = projectList;
                                        break;
                                    }
                                  });
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: "All",
                                    child: Text("All"),
                                  ),
                                  const PopupMenuItem(
                                    value: "Frontend",
                                    child: Text("Frontend"),
                                  ),
                                  const PopupMenuItem(
                                    value: "Backend",
                                    child: Text("Backend"),
                                  ),
                                  const PopupMenuItem(
                                    value:
                                        "Data Engineering / Science / Analytics",
                                    child: Text(
                                        "Data Engineering / Science / Analytics"),
                                  ),
                                  const PopupMenuItem(
                                    value: "AI / ML",
                                    child: Text("AI / ML"),
                                  ),
                                  const PopupMenuItem(
                                    value: "Others",
                                    child: Text("Others"),
                                  ),
                                ],
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppStyles.containerBorderRadius),
                                    color: AppStyles.mainAppColour,
                                    boxShadow: AppStyles.containerShadow,
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            ref.watch(
                                                selectedProjectFilterProvider),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: projectTypeFilterButtonOpen
                                            ? const Icon(
                                                Icons.arrow_drop_up_rounded,
                                                size: 25)
                                            : const Icon(
                                                Icons.arrow_drop_down_rounded,
                                                size: 25),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Text(
                              projectList[
                                      ref.watch(selectedProjectIndexProvider)]
                                  .title,
                              style: AppStyles.montserrat25)),
                ),
                selectedProjectIndex == -1
                    ? SizedBox(
                        width: 50,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Icon(Icons.arrow_left_rounded,
                                size: 50,
                                color: lessProjectsSelectable
                                    ? AppStyles.greyColour
                                    : AppStyles.lightShadowColour),
                            onTap: () {
                              setState(() {
                                if (lessProjectsSelectable) {
                                  var currentIndex =
                                      ref.read(viewingProjectIndex);
                                  if (isSmallerThanCustomBp) {
                                    if (currentIndex <= 2) {
                                      ref
                                          .read(viewingProjectIndex.notifier)
                                          .change(0);
                                    } else {
                                      ref
                                          .read(viewingProjectIndex.notifier)
                                          .change(
                                              ref.read(viewingProjectIndex) -
                                                  2);
                                    }
                                  } else {
                                    if (currentIndex <= 3) {
                                      ref
                                          .read(viewingProjectIndex.notifier)
                                          .change(0);
                                    } else {
                                      ref
                                          .read(viewingProjectIndex.notifier)
                                          .change(
                                              ref.read(viewingProjectIndex) -
                                                  3);
                                    }
                                  }
                                }
                              });
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
                selectedProjectIndex == -1
                    ? SizedBox(
                        width: 50,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Icon(Icons.arrow_right_rounded,
                                size: 50,
                                color: moreProjectsSelectable
                                    ? AppStyles.greyColour
                                    : AppStyles.lightShadowColour),
                            onTap: () {
                              setState(() {
                                if (moreProjectsSelectable) {
                                  var currentIndex =
                                      ref.read(viewingProjectIndex);
                                  if (isSmallerThanCustomBp) {
                                    if (currentIndex <
                                        filteredProjectList.length - 2) {
                                      ref
                                          .read(viewingProjectIndex.notifier)
                                          .change(
                                              ref.read(viewingProjectIndex) +
                                                  2);
                                    }
                                  } else {
                                    if (currentIndex <
                                        filteredProjectList.length - 3) {
                                      ref
                                          .read(viewingProjectIndex.notifier)
                                          .change(
                                              ref.read(viewingProjectIndex) +
                                                  3);
                                    }
                                  }
                                }
                              });
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            selectedProjectIndex == -1
                ? Expanded(
                    child: ResponsiveRowColumn(
                      layout: isSmallerThanMiniDesktop
                          ? ResponsiveRowColumnType.COLUMN
                          : ResponsiveRowColumnType.ROW,
                      children: buildProjectCardItems(
                          ref.read(viewingProjectIndex), isSmallerThanCustomBp),
                    ),
                  )
                : const ProjectDetailWidget(),

            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 30),
            //   height: 100,
            //   width: MediaQuery.of(context).size.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       SelectableText("What I've", style: AppStyles.montserrat25Bold),
            //       SelectableText(" Done", style: AppStyles.montserrat25ColoredBold),
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: ResponsiveRowColumn(
            //     layout:
            //         ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
            //             ? ResponsiveRowColumnType.COLUMN
            //             : ResponsiveRowColumnType.ROW,
            //     rowMainAxisAlignment: MainAxisAlignment.spaceAround,
            //     rowCrossAxisAlignment: CrossAxisAlignment.start,
            //     columnMainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       ResponsiveRowColumnItem(
            //         child: Expanded(
            //           child: Padding(
            //             padding: EdgeInsets.only(
            //               right: ResponsiveWrapper.of(context)
            //                       .isSmallerThan("MINI-DESKTOP")
            //                   ? 30
            //                   : 15,
            //               left: 30,
            //               bottom: ResponsiveWrapper.of(context)
            //                       .isSmallerThan("MINI-DESKTOP") ? 30 : 100,
            //             ),
            //             child: Card(
            //               elevation: 5,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   color: const Color(0xff292929),
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 child: const ProjectSelectorWidget(),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       ResponsiveRowColumnItem(
            //         child: Expanded(
            //           flex: 2,
            //           child: Padding(
            //             padding: EdgeInsets.only(
            //               left: ResponsiveWrapper.of(context)
            //                       .isSmallerThan("MINI-DESKTOP")
            //                   ? 30
            //                   : 15,
            //               right: 30,
            //               bottom: 100,
            //             ),
            //             child: Card(
            //               elevation: 5,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   color: const Color(0xff292929),
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 child: const ProjectDisplayWidget(),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
