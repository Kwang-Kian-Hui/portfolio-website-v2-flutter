import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/buttons/project_button.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/buttons/project_filter_buttons.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/buttons/project_type_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_portfolio_website/core/application/project_class.dart';
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';

class ProjectSelectorWidget extends ConsumerStatefulWidget {
  const ProjectSelectorWidget({Key? key}) : super(key: key);

  @override
  ProjectSelectorWidgetState createState() => ProjectSelectorWidgetState();
}

class ProjectSelectorWidgetState extends ConsumerState<ProjectSelectorWidget> {
  ScrollController projectSelectorScrollController = ScrollController();

  List<Widget> emptyList = [
    Container(
      height: 40,
      width: 250,
      alignment: Alignment.center,
      child: const Text("Select a category to filter projects",
          style: AppStyles.roboto14),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool containsCategory(Project currentProject, List<String> categoryList) {
      if (categoryList.isEmpty) {
        return true;
      }
      for (var element in currentProject.categories) {
        if (categoryList.contains(element)) {
          return true;
        }
      }
      return false;
    }

    List<Widget> techStackList = const [
      ProjectFiltersButton(
          index: 0, buttonTitle: "Frontend", categoryType: "Tech Stacks"),
      ProjectFiltersButton(
          index: 1, buttonTitle: "Backend", categoryType: "Tech Stacks"),
      ProjectFiltersButton(
          index: 2, buttonTitle: "Data", categoryType: "Tech Stacks"),
      ProjectFiltersButton(
          index: 3, buttonTitle: "Others", categoryType: "Tech Stacks"),
    ];

    List<Widget> languagesList = const [
      ProjectFiltersButton(
          index: 0, buttonTitle: "Dart", categoryType: "Languages"),
      ProjectFiltersButton(
          index: 1, buttonTitle: "Python", categoryType: "Languages"),
      ProjectFiltersButton(
          index: 2, buttonTitle: "JavaScript", categoryType: "Languages"),
      ProjectFiltersButton(
          index: 3, buttonTitle: "HTML/CSS", categoryType: "Languages"),
      ProjectFiltersButton(
          index: 4, buttonTitle: "C++", categoryType: "Languages"),
    ];

    List<Widget> projectTypeList = const [
      ProjectFiltersButton(
          index: 0, buttonTitle: "Web/Mobile", categoryType: "Project Type"),
      ProjectFiltersButton(
          index: 1, buttonTitle: "Data Analytics", categoryType: "Project Type"),
      ProjectFiltersButton(
          index: 2, buttonTitle: "Predictive Analytics", categoryType: "Project Type"),
      ProjectFiltersButton(
          index: 3, buttonTitle: "Others", categoryType: "Project Type"),
    ];

    return SingleChildScrollView(
      controller: projectSelectorScrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text("Categories", style: AppStyles.roboto18ColoredBold),
          ),
          Container(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: const [
                ProjectTypeButtons(index: 0, buttonTitle: "Tech Stacks"),
                ProjectTypeButtons(index: 1, buttonTitle: "Languages"),
                ProjectTypeButtons(index: 2, buttonTitle: "Project Types"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: ref.watch(selectedProjectIndexProvider) == 0
                ? techStackList
                : ref.watch(selectedProjectIndexProvider) == 1
                    ? languagesList
                    : ref.watch(selectedProjectIndexProvider) == 2
                        ? projectTypeList
                        : emptyList,
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text("Projects", style: AppStyles.roboto18ColoredBold),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              projectList.length,
              (index) => containsCategory(projectList[index],
                      ref.watch(selectedProjectFiltersProvider))
                      ? ProjectButton(index: index, buttonTitle: projectList[index].shortTitle)
                  : const SizedBox(),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}