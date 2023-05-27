import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_display_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/project_selector_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({Key? key}) : super(key: key);

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
          ? MediaQuery.of(context).size.height * 2
          : MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SelectableText("What I've", style: AppStyles.montserrat25Bold),
                SelectableText(" Done", style: AppStyles.montserrat25ColoredBold),
              ],
            ),
          ),
          Expanded(
            child: ResponsiveRowColumn(
              layout:
                  ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
              rowMainAxisAlignment: MainAxisAlignment.spaceAround,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnMainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ResponsiveRowColumnItem(
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: ResponsiveWrapper.of(context)
                                .isSmallerThan("MINI-DESKTOP")
                            ? 30
                            : 15,
                        left: 30,
                        bottom: ResponsiveWrapper.of(context)
                                .isSmallerThan("MINI-DESKTOP") ? 30 : 100,
                      ),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff292929),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const ProjectSelectorWidget(),
                        ),
                      ),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: ResponsiveWrapper.of(context)
                                .isSmallerThan("MINI-DESKTOP")
                            ? 30
                            : 15,
                        right: 30,
                        bottom: 100,
                      ),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff292929),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const ProjectDisplayWidget(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
