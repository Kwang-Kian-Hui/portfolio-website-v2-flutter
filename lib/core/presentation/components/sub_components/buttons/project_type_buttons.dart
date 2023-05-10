import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectTypeButtons extends ConsumerStatefulWidget {
  const ProjectTypeButtons(
      {Key? key, required this.index, required this.buttonTitle})
      : super(key: key);
  final int index;
  final String buttonTitle;

  @override
  ProjectTypeButtonsState createState() => ProjectTypeButtonsState();
}

class ProjectTypeButtonsState extends ConsumerState<ProjectTypeButtons> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (ref.read(selectedProjectIndexProvider) == widget.index) {
            ref.read(selectedProjectIndexProvider.notifier).change(3);
          } else {
            ref.read(selectedProjectIndexProvider.notifier).change(widget.index);
          }
          ref.read(selectedTechStackIndexProvider.notifier).change(4);
          ref.read(selectedLanguagesIndexProvider.notifier).change(5);
          ref.read(selectedProjectTypeIndexProvider.notifier).change(4);
          ref.read(selectedProjectFiltersProvider.notifier).resetList();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 50,
          width: 110,
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: ref.watch(selectedProjectIndexProvider) == widget.index
                  ? Alignment.bottomRight
                  : Alignment.topLeft,
              end: ref.watch(selectedProjectIndexProvider) == widget.index
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
                inset: ref.watch(selectedProjectIndexProvider) == widget.index
                    ? true
                    : false,
              ),
              BoxShadow(
                color: const Color(0xff151515),
                offset: const Offset(15.4, 15.4),
                blurRadius: 30,
                spreadRadius: 0.0,
                inset: ref.watch(selectedProjectIndexProvider) == widget.index
                    ? true
                    : false,
              ),
            ],
          ),
          child: Text(
            widget.buttonTitle,
            style: ref.watch(selectedProjectIndexProvider) == widget.index
                ? AppStyles.roboto14ColoredBold
                : AppStyles.roboto14,
          ),
        ),
      ),
    );
  }
}
