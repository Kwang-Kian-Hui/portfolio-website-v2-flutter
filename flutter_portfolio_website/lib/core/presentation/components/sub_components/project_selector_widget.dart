import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/application/project_class.dart';
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  bool containsCategory(Project currentProject, List<String> categoryList){
    if(categoryList.isEmpty){
      return true;
    }
    for (var element in currentProject.categories) {
      if(categoryList.contains(element)){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> techStackList = [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 0) {
              ref.read(selectedTechStackIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Frontend");
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(0);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Frontend");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedTechStackIndexProvider) == 0
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Frontend",
                style: ref.watch(selectedTechStackIndexProvider) == 0
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 1) {
              ref.read(selectedTechStackIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Backend");
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(1);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Backend");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedTechStackIndexProvider) == 1
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Backend",
                style: ref.watch(selectedTechStackIndexProvider) == 1
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 2) {
              ref.read(selectedTechStackIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Data");
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(2);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Data");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedTechStackIndexProvider) == 2
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Data",
                style: ref.watch(selectedTechStackIndexProvider) == 2
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 3) {
              ref.read(selectedTechStackIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Others");
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(3);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Others");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedTechStackIndexProvider) == 3
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Others",
                style: ref.watch(selectedTechStackIndexProvider) == 3
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
    ];

    List<Widget> languagesList = [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedLanguagesIndexProvider) == 0) {
              ref.read(selectedLanguagesIndexProvider.notifier).change(5);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Dart");
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(0);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Dart");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedLanguagesIndexProvider) == 0
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Dart",
                style: ref.watch(selectedLanguagesIndexProvider) == 0
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedLanguagesIndexProvider) == 1) {
              ref.read(selectedLanguagesIndexProvider.notifier).change(5);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Python");
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(1);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Python");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedLanguagesIndexProvider) == 1
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Python",
                style: ref.watch(selectedLanguagesIndexProvider) == 1
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedLanguagesIndexProvider) == 2) {
              ref.read(selectedLanguagesIndexProvider.notifier).change(5);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("JavaScript");
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(2);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("JavaScript");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedLanguagesIndexProvider) == 2
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "JavaScript",
                style: ref.watch(selectedLanguagesIndexProvider) == 2
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedLanguagesIndexProvider) == 3) {
              ref.read(selectedLanguagesIndexProvider.notifier).change(5);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("HTML/CSS");
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(3);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("HTML/CSS");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedLanguagesIndexProvider) == 3
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "HTML/CSS",
                style: ref.watch(selectedLanguagesIndexProvider) == 3
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedLanguagesIndexProvider) == 4) {
              ref.read(selectedLanguagesIndexProvider.notifier).change(5);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("C++");
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("C++");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedLanguagesIndexProvider) == 4
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "C++",
                style: ref.watch(selectedLanguagesIndexProvider) == 4
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
    ];

    List<Widget> projectTypeList = [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedProjectTypeIndexProvider) == 0) {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Web/Mobile");
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(0);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Web/Mobile");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedProjectTypeIndexProvider) == 0
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Web/Mobile",
                style: ref.watch(selectedProjectTypeIndexProvider) == 0
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedProjectTypeIndexProvider) == 1) {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Data Analytics");
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(1);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Data Analytics");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedProjectTypeIndexProvider) == 1
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Data Analytics",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ref.watch(selectedProjectTypeIndexProvider) == 1
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedProjectTypeIndexProvider) == 2) {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Predictive Analytics");
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(2);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Predictive Analytics");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedProjectTypeIndexProvider) == 2
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Predictive Analytics",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ref.watch(selectedProjectTypeIndexProvider) == 2
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedProjectTypeIndexProvider) == 3) {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
              ref.read(selectedProjectFiltersProvider.notifier).removeElement("Others");
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(3);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref.read(selectedProjectFiltersProvider.notifier).addElement("Others");
            }
          },
          child: Card(
            elevation: 5,
            color: const Color(0xff222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: ref.watch(selectedProjectTypeIndexProvider) == 3
                ? const Color(0xffF58C82)
                : null,
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Others",
                style: ref.watch(selectedProjectTypeIndexProvider) == 3
                    ? AppStyles.roboto14ColoredBold
                    : AppStyles.roboto14,
              ),
            ),
          ),
        ),
      ),
    ];

    return SingleChildScrollView(
      controller: projectSelectorScrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text("Categories", style: AppStyles.roboto18Bold),
          ),
          Container(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if (ref.read(selectedProjectIndexProvider) == 0) {
                        ref
                            .read(selectedProjectIndexProvider.notifier)
                            .change(3);
                      } else {
                        ref
                            .read(selectedProjectIndexProvider.notifier)
                            .change(0);
                      }
                      ref.read(selectedLanguagesIndexProvider.notifier).change(5);
                      ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
                      ref.read(selectedProjectFiltersProvider.notifier).resetList();
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color(0xff222222),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: ref.watch(selectedProjectIndexProvider) == 0
                          ? const Color(0xffF58C82)
                          : null,
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Tech Stacks",
                          style: ref.watch(selectedProjectIndexProvider) == 0
                              ? AppStyles.roboto14ColoredBold
                              : AppStyles.roboto14,
                        ),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if (ref.read(selectedProjectIndexProvider) == 1) {
                        ref
                            .read(selectedProjectIndexProvider.notifier)
                            .change(3);
                      } else {
                        ref
                            .read(selectedProjectIndexProvider.notifier)
                            .change(1);
                      }
                      ref.read(selectedTechStackIndexProvider.notifier).change(4);
                      ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
                      ref.read(selectedProjectFiltersProvider.notifier).resetList();
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color(0xff222222),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: ref.watch(selectedProjectIndexProvider) == 1
                          ? const Color(0xffF58C82)
                          : null,
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Languages",
                          style: ref.watch(selectedProjectIndexProvider) == 1
                              ? AppStyles.roboto14ColoredBold
                              : AppStyles.roboto14,
                        ),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if (ref.read(selectedProjectIndexProvider) == 2) {
                        ref
                            .read(selectedProjectIndexProvider.notifier)
                            .change(3);
                      } else {
                        ref
                            .read(selectedProjectIndexProvider.notifier)
                            .change(2);
                      }
                      ref.read(selectedTechStackIndexProvider.notifier).change(4);
                      ref.read(selectedLanguagesIndexProvider.notifier).change(5);
                      ref.read(selectedProjectFiltersProvider.notifier).resetList();
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color(0xff222222),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: ref.watch(selectedProjectIndexProvider) == 2
                          ? const Color(0xffF58C82)
                          : null,
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Project Types",
                          style: ref.watch(selectedProjectIndexProvider) == 2
                              ? AppStyles.roboto14ColoredBold
                              : AppStyles.roboto14,
                        ),
                      ),
                    ),
                  ),
                ),
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
            child: const Text("Projects", style: AppStyles.roboto18Bold),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              projectList.length,
              (index) => containsCategory(projectList[index], ref.watch(selectedProjectFiltersProvider)) ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (ref.read(selectedProjectDetailIndexProvider) - 1 ==
                          index) {
                        ref
                            .read(selectedProjectDetailIndexProvider.notifier)
                            .change(0);
                      } else {
                        ref
                            .read(selectedProjectDetailIndexProvider.notifier)
                            .change(index + 1);
                      }
                    });
                  },
                  child: Card(
                    elevation: 5,
                    color: const Color(0xff222222),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor:
                        ref.watch(selectedProjectDetailIndexProvider) - 1 ==
                                index
                            ? const Color(0xffF58C82)
                            : null,
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(projectList[index].shortTitle, style: ref.watch(selectedProjectDetailIndexProvider) - 1 == index
                              ? AppStyles.roboto14ColoredBold
                              : AppStyles.roboto14,),
                    ),
                  ),
                ),
              ) : const SizedBox(),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
