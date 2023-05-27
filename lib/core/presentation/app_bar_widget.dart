import 'package:flutter/material.dart';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 10,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: AppStyles.containerColour,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      color: AppStyles.mainAppColour,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "KH",
                        style: hoverOnIcon
                            ? AppStyles.courgette20Colored
                            : AppStyles.courgette20,
                      ),
                    ),
                  ),
                ),
              ),
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
                        cursor: SystemMouseCursors.click,
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
                : DropdownMenuButton(
                    hoverOnAbout: hoverOnAbout,
                    hoverOnExperience: hoverOnExperience,
                    hoverOnProject: hoverOnProject,
                  ),
          ],
        ),
      ),
    );
  }
}
