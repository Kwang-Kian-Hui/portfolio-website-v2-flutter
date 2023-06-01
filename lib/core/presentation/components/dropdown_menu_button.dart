import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

class DropdownMenuButton extends ConsumerStatefulWidget {
  const DropdownMenuButton(
      {super.key,
      required this.hoverOnAbout,
      required this.hoverOnExperience,
      required this.hoverOnProject});

  final bool hoverOnAbout;
  final bool hoverOnExperience;
  final bool hoverOnProject;

  @override
  DropdownMenuButtonState createState() => DropdownMenuButtonState();
}

class DropdownMenuButtonState extends ConsumerState<DropdownMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppStyles.containerGradient,
        boxShadow: AppStyles.roundedButtonShadow,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: PopupMenuButton(
          position: PopupMenuPosition.under,
          padding: const EdgeInsets.all(0),
          tooltip: "",
          color: AppStyles.mainAppColour,
          splashRadius: 1,
          offset: const Offset(0, 0),
          icon: const Icon(
            Icons.menu_sharp,
            size: 32,
            color: Color(0xffffffff),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: PopupMenuItemWidget(
                    state: widget.hoverOnAbout,
                    textString: "ABOUT ME",
                    index: 1),
              ),
              PopupMenuItem(
                child: PopupMenuItemWidget(
                    state: widget.hoverOnExperience,
                    textString: "EXPERIENCES",
                    index: 2),
              ),
              PopupMenuItem(
                child: PopupMenuItemWidget(
                    state: widget.hoverOnProject,
                    textString: "PROJECTS",
                    index: 3),
              ),
            ];
          },
        ),
      ),
    );
  }
}

class PopupMenuItemWidget extends ConsumerWidget {
  const PopupMenuItemWidget(
      {Key? key,
      required this.state,
      required this.textString,
      required this.index})
      : super(key: key);
  final bool state;
  final String textString;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () async {
          ref.read(scrollControllerProvider.notifier).scrollToIndex(index);
        },
        child: SizedBox(
          child: Text(
            textString,
            style:
                state ? AppStyles.montserrat20Colored : AppStyles.montserrat20,
          ),
        ),
      ),
    );
  }
}
