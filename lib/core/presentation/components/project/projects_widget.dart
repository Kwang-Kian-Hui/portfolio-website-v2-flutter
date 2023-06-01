import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_display_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_item_card_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_selector_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectsWidget extends ConsumerStatefulWidget {
  const ProjectsWidget({Key? key}) : super(key: key);

  @override
  ProjectsWidgetState createState() => ProjectsWidgetState();
}

class ProjectsWidgetState extends ConsumerState<ProjectsWidget> {
  List<ResponsiveRowColumnItem> buildProjectCardItems(int i) {
    List<ResponsiveRowColumnItem> widgetList = [
      ResponsiveRowColumnItem(
          child: ProjectItemCardWidget(projectItem: projectList[i]))
    ];
    if (i + 1 < projectList.length) {
      widgetList.add(ResponsiveRowColumnItem(
          child: ProjectItemCardWidget(projectItem: projectList[i + 1])));
    } else {
      widgetList.add(
          const ResponsiveRowColumnItem(child: Expanded(child: SizedBox())));
    }
    if (!ResponsiveWrapper.of(context)
        .isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")) {
      if (i + 2 < projectList.length) {
        widgetList.add(ResponsiveRowColumnItem(
            child: ProjectItemCardWidget(projectItem: projectList[i + 2])));
      } else {
        widgetList.add(
            const ResponsiveRowColumnItem(child: Expanded(child: SizedBox())));
      }
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    bool lessProjectsSelectable =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")
            ? ref.watch(viewingProjectIndex) - 2 >= -1
            : ref.watch(viewingProjectIndex) - 3 >= -2;
    bool moreProjectsSelectable =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")
            ? ref.watch(viewingProjectIndex) + 2 < projectList.length + 1
            : ref.watch(viewingProjectIndex) + 3 < projectList.length + 2;
    return Container(
      height: MediaQuery.of(context).size.height - 159,
      margin: const EdgeInsets.only(top: 159),
      child: Container(
        margin: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
        decoration: BoxDecoration(
          color: AppStyles.containerColour,
          borderRadius: BorderRadius.circular(AppStyles.containerBorderRadius),
        ),
        child: Column(
          children: [
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppStyles.mobileBorderPadding),
                  child: Text(
                      ref.watch(selectedProjectIndexProvider) == -1
                          ? "Project Title"
                          : projectList[ref.watch(selectedProjectIndexProvider)]
                              .shortTitle,
                      style: AppStyles.montserrat25),
                ),
                Container(
                  width: 100,
                  height: 10,
                  color: Colors.red,
                ),
                MouseRegion(
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
                          var currentIndex = ref.read(viewingProjectIndex);
                          if (ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")) {
                            if (currentIndex <= 2) {
                              ref.read(viewingProjectIndex.notifier).change(0);
                            } else {
                              ref
                                  .read(viewingProjectIndex.notifier)
                                  .change(ref.read(viewingProjectIndex) - 2);
                            }
                          } else {
                            if (currentIndex <= 3) {
                              ref.read(viewingProjectIndex.notifier).change(0);
                            } else {
                              ref
                                  .read(viewingProjectIndex.notifier)
                                  .change(ref.read(viewingProjectIndex) - 3);
                            }
                          }
                        }
                      });
                    },
                  ),
                ),
                MouseRegion(
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
                          var currentIndex = ref.read(viewingProjectIndex);
                          if (ResponsiveWrapper.of(context)
                              .isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")) {
                            if (currentIndex < projectList.length - 2) {
                              ref
                                  .read(viewingProjectIndex.notifier)
                                  .change(ref.read(viewingProjectIndex) + 2);
                            }
                          } else {
                            if (currentIndex < projectList.length - 3) {
                              ref
                                  .read(viewingProjectIndex.notifier)
                                  .change(ref.read(viewingProjectIndex) + 3);
                            }
                          }
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ResponsiveRowColumn(
                layout:
                    ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                children: buildProjectCardItems(ref.read(viewingProjectIndex)),
              ),
            ),

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
