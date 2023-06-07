import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_portfolio_website/core/shared/widget_builders.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/application/project_class.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectItemCardWidget extends ConsumerStatefulWidget {
  const ProjectItemCardWidget({Key? key, required this.projectItem})
      : super(key: key);
  final Project projectItem;
  // final int index;

  @override
  ProjectItemCardWidgetState createState() => ProjectItemCardWidgetState();
}

class ProjectItemCardWidgetState extends ConsumerState<ProjectItemCardWidget> {
  ScrollController descriptionScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    bool isSmallerThanMiniDesktop =
        ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP");
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            ref.read(selectedProjectIndexProvider.notifier).change(
                projectList.indexWhere(
                    (element) => element.title == widget.projectItem.title));
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
                horizontal: AppStyles.webBorderPadding,
                vertical: AppStyles.webBorderPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius:
                  BorderRadius.circular(AppStyles.containerBorderRadius),
              gradient: AppStyles.containerGradient,
              boxShadow: AppStyles.containerShadow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                isSmallerThanMiniDesktop
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppStyles.mobileBorderPadding,
                        ),
                        child: Text(
                          widget.projectItem.shortTitle,
                          style: AppStyles.montserrat18,
                        ),
                      )
                    : Wrap(
                        children: buildCategoryWidgetList(
                            widget.projectItem.categories),
                      ),
                !isSmallerThanMiniDesktop
                    ? ResponsiveRowColumn(
                        layout: isSmallerThanMiniDesktop
                            ? ResponsiveRowColumnType.ROW
                            : ResponsiveRowColumnType.COLUMN,
                        rowMainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ResponsiveRowColumnItem(
                            child: Container(
                              height: 75,
                              padding: EdgeInsets.only(
                                  right: isSmallerThanMiniDesktop
                                      ? AppStyles.mobileBorderPadding
                                      : 0),
                              alignment: Alignment.center,
                              child: Text(
                                widget.projectItem.shortTitle,
                                style: AppStyles.montserrat18,
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            child: Container(
                              height: 25,
                              alignment: Alignment.center,
                              child: Text(
                                DateFormat("MMM yyyy")
                                    .format(widget.projectItem.date),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppStyles.mobileBorderPadding,
                        right: AppStyles.mobileBorderPadding,
                        bottom: AppStyles.mobileBorderPadding,
                        top: !isSmallerThanMiniDesktop
                            ? 0
                            : AppStyles.mobileBorderPadding),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppStyles.containerBorderRadius),
                      child: Image(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                            widget.projectItem.listOfImagePaths.isNotEmpty
                                ? widget.projectItem.listOfImagePaths[0]
                                : "assets/images/img_placeholder.png"),
                      ),
                    ),
                  ),
                ),
                !isSmallerThanMiniDesktop
                    ? Expanded(
                        child: Scrollbar(
                          controller: descriptionScrollController,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: descriptionScrollController,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppStyles.webBorderPadding),
                              alignment: Alignment.center,
                              child: Text(
                                widget.projectItem.description,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
