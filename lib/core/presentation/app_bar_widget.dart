import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_portfolio_website/core/presentation/click_and_scroll_buttons.dart';
import 'package:flutter_portfolio_website/core/presentation/components/dropdown_menu_button.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarWidget extends ConsumerStatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  AppBarWidgetState createState() => AppBarWidgetState();
}

class AppBarWidgetState extends ConsumerState<AppBarWidget> {
  bool hoverOnIcon = false;
  bool hoverOnAbout = false;
  bool hoverOnExperience = false;
  bool hoverOnProject = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.containerBorderRadius)),
      elevation: 10,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: AppStyles.containerColour,
          borderRadius: BorderRadius.circular(AppStyles.containerBorderRadius),
          boxShadow: AppStyles.containerShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: MouseRegion(
                onEnter: (pointerEvent) {
                  setState(() {
                    hoverOnIcon = true;
                  });
                },
                onExit: (pointerEvent) {
                  setState(() {
                    hoverOnIcon = false;
                  });
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                  onTap: () {
                    ref
                        .read(scrollControllerProvider.notifier)
                        .scrollToIndex(0);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppStyles.containerGradient,
                      boxShadow: AppStyles.roundedButtonShadow,
                    ),
                    child: Center(
                      child: Text(
                        "KH",
                        style: hoverOnIcon
                            ? AppStyles.courgette20Colored
                            : AppStyles.courgette20,
                      ),
                    ),
                    // ),
                  ),
                ),
              ),),
            ),
            ResponsiveWrapper.of(context).isLargerThan(MOBILE)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        onEnter: (pointerEvent) {
                          setState(() {
                            hoverOnAbout = true;
                          });
                        },
                        onExit: (pointerEvent) {
                          setState(() {
                            hoverOnAbout = false;
                          });
                        },
                        child: ClickAndScrollButtons(
                            index: 1,
                            buttonText: "ABOUT ME",
                            state: hoverOnAbout),
                      ),
                      MouseRegion(
                        onEnter: (pointerEvent) {
                          setState(() {
                            hoverOnExperience = true;
                          });
                        },
                        onExit: (pointerEvent) {
                          setState(() {
                            hoverOnExperience = false;
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        child: ClickAndScrollButtons(
                            index: 2,
                            buttonText: "EXPERIENCES",
                            state: hoverOnExperience),
                      ),
                      MouseRegion(
                        onEnter: (pointerEvent) {
                          setState(() {
                            hoverOnProject = true;
                          });
                        },
                        onExit: (pointerEvent) {
                          setState(() {
                            hoverOnProject = false;
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        child: ClickAndScrollButtons(
                            index: 3,
                            buttonText: "PROJECTS",
                            state: hoverOnProject),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: DropdownMenuButton(
                      hoverOnAbout: hoverOnAbout,
                      hoverOnExperience: hoverOnExperience,
                      hoverOnProject: hoverOnProject,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
