import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    List<Widget> techStackList = [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 0) {
              ref.read(selectedTechStackIndexProvider.notifier).change(5);
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(0);
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
              child: Text("Frontend"),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 1) {
              ref.read(selectedTechStackIndexProvider.notifier).change(5);
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(1);
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
              child: Text("Backend"),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 2) {
              ref.read(selectedTechStackIndexProvider.notifier).change(5);
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(2);
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
              child: Text("Data"),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (ref.read(selectedTechStackIndexProvider) == 3) {
              ref.read(selectedTechStackIndexProvider.notifier).change(5);
            } else {
              ref.read(selectedTechStackIndexProvider.notifier).change(3);
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
              child: Text("Others"),
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
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(0);
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
              child: Text("Dart"),
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
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(1);
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
              child: Text("Python"),
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
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(2);
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
              child: Text("JavaScript"),
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
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(3);
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
              child: Text("HTML/CSS"),
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
            } else {
              ref.read(selectedLanguagesIndexProvider.notifier).change(4);
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
              child: Text("C++"),
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
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(0);
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
              child: Text("Web/Mobile"),
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
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(1);
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
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(2);
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
              child: Text("Predictive Analytics",
                  maxLines: 2, overflow: TextOverflow.ellipsis),
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
            } else {
              ref.read(selectedProjectTypeIndexProvider.notifier).change(3);
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
              child: Text("Others"),
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
                        ref.read(selectedProjectIndexProvider.notifier).change(3);
                      } else {
                        ref.read(selectedProjectIndexProvider.notifier).change(0);
                      }
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
                        ref.read(selectedProjectIndexProvider.notifier).change(3);
                      } else {
                        ref.read(selectedProjectIndexProvider.notifier).change(1);
                      }
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
                        ref.read(selectedProjectIndexProvider.notifier).change(3);
                      } else {
                        ref.read(selectedProjectIndexProvider.notifier).change(2);
                      }
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
              alignment: WrapAlignment.spaceAround,
              children: List.generate(
                projectList.length,
                (index) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(ref.read(selectedProjectDetailIndexProvider) - 1 == index){
                        ref.read(selectedProjectDetailIndexProvider.notifier).change(0);
                      } else {
                        ref.read(selectedProjectDetailIndexProvider.notifier).change(index + 1);
                      }
                      });
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color(0xff222222),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: ref.watch(selectedProjectDetailIndexProvider) - 1 == index
                          ? const Color(0xffF58C82)
                          : null,
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(projectList[index].shortTitle),
                      ),
                    ),
                  ),
                ),
              ),),
              const SizedBox(height: 30),
        ],
      ),
    );
  }
}
