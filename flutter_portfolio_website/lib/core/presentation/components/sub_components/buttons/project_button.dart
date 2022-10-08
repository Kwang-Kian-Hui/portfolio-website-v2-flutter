import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectButton extends ConsumerStatefulWidget {
  const ProjectButton(
      {Key? key, required this.index, required this.buttonTitle})
      : super(key: key);
  final int index;
  final String buttonTitle;

  @override
  ProjectButtonState createState() => ProjectButtonState();
}

class ProjectButtonState extends ConsumerState<ProjectButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
            if (ref.read(selectedProjectDetailIndexProvider) -
                                    1 ==
                                widget.index) {
                              ref
                                  .read(selectedProjectDetailIndexProvider
                                      .notifier)
                                  .change(0);
                            } else {
                              ref
                                  .read(selectedProjectDetailIndexProvider
                                      .notifier)
                                  .change(widget.index + 1);
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
              begin: ref.watch(selectedProjectDetailIndexProvider) - 1 == widget.index
                  ? Alignment.bottomRight
                  : Alignment.topLeft,
              end: ref.watch(selectedProjectDetailIndexProvider) - 1 == widget.index
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
                inset: ref.watch(selectedProjectDetailIndexProvider) - 1 == widget.index
                    ? true
                    : false,
              ),
              BoxShadow(
                color: const Color(0xff151515),
                offset: const Offset(15.4, 15.4),
                blurRadius: 30,
                spreadRadius: 0.0,
                inset: ref.watch(selectedProjectDetailIndexProvider) - 1 == widget.index
                    ? true
                    : false,
              ),
            ],
          ),
          child: Text(
            widget.buttonTitle,
            style: ref.watch(selectedProjectDetailIndexProvider) - 1 == widget.index
                ? AppStyles.roboto12ColoredBold
                : AppStyles.roboto12,
          ),
        ),
      ),
    );
  }
}
