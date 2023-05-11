import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectFiltersButton extends ConsumerStatefulWidget {
  const ProjectFiltersButton(
      {Key? key, required this.index, required this.buttonTitle, required this.categoryType})
      : super(key: key);
  final int index;
  final String buttonTitle;
  final String categoryType;

  @override
  ProjectFiltersButtonState createState() => ProjectFiltersButtonState();
}

class ProjectFiltersButtonState extends ConsumerState<ProjectFiltersButton> {
  @override
  Widget build(BuildContext context) {
    int readProvider;
    int watchProvider;
    IntegerProvider notifierProvider;
    if(widget.categoryType == "Tech Stacks"){
      readProvider = ref.read(selectedTechStackIndexProvider);
      watchProvider = ref.watch(selectedTechStackIndexProvider);
      notifierProvider = ref.read(selectedTechStackIndexProvider.notifier);
    } else if(widget.categoryType == "Languages"){
      readProvider = ref.read(selectedLanguagesIndexProvider);
      watchProvider = ref.watch(selectedLanguagesIndexProvider);
      notifierProvider = ref.read(selectedLanguagesIndexProvider.notifier);
    } else {
      readProvider = ref.read(selectedProjectTypeIndexProvider);
      watchProvider = ref.watch(selectedProjectTypeIndexProvider);
      notifierProvider = ref.read(selectedProjectTypeIndexProvider.notifier);
    }
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
            if (readProvider == widget.index) {
              notifierProvider.change(-1);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
            } else {
              notifierProvider.change(widget.index);
              ref.read(selectedProjectFiltersProvider.notifier).resetList();
              ref
                  .read(selectedProjectFiltersProvider.notifier)
                  .addElement(widget.buttonTitle);
            }
          },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          height: 40,
          width: 175,
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: watchProvider == widget.index
                  ? Alignment.bottomRight
                  : Alignment.topLeft,
              end: watchProvider == widget.index
                  ? Alignment.topLeft
                  : Alignment.bottomRight,
              colors: const [
                Color(0xff333333),
                Color(0xff333333),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff515151),
                offset: const Offset(-5.4, -5.4),
                blurRadius: 30,
                spreadRadius: 0.0,
                inset: watchProvider == widget.index
                    ? true
                    : false,
              ),
              BoxShadow(
                color: const Color(0xff151515),
                offset: const Offset(15.4, 15.4),
                blurRadius: 30,
                spreadRadius: 0.0,
                inset: watchProvider == widget.index
                    ? true
                    : false,
              ),
            ],
          ),
          child: Text(
            widget.buttonTitle,
            style: watchProvider == widget.index
                ? AppStyles.roboto12ColoredBold
                : AppStyles.roboto12,
          ),
        ),
      ),
    );
  }
}
