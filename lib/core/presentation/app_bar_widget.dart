import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarWidget extends ConsumerStatefulWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  AppBarWidgetState createState() => AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWidgetState extends ConsumerState<AppBarWidget> {
  bool hoverOnIcon = false;
  bool hoverOnAbout = false;
  bool hoverOnExperience = false;
  bool hoverOnProject = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppStyles.mainAppColour,
      title: SizedBox(
        height: 75,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: MouseRegion(
                onEnter: (pointerEvent){
                  setState(() {
                    hoverOnIcon = true;
                  });
                },
                onExit: (pointerEvent){
                  setState((){
                    hoverOnIcon = false;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                  ref.read(scrollControllerProvider.notifier).scrollToIndex(0);
                },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: hoverOnIcon ? const Color(0xffF58C82) : Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "KH",
                        style: hoverOnIcon ? AppStyles.courgette20Colored : AppStyles.courgette20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            MouseRegion(
              onEnter: (pointerEvent){
                  setState(() {
                    hoverOnAbout = true;
                  });
                },
                onExit: (pointerEvent){
                  setState((){
                    hoverOnAbout = false;
                  });
                },
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  ref.read(scrollControllerProvider.notifier).scrollToIndex(1);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? AppStyles.mobileBorderPadding
                              : AppStyles.webBorderPadding),
                  alignment: Alignment.center,
                  child: Text(
                    "About Me",
                    style: hoverOnAbout ? AppStyles.roboto20Colored : AppStyles.roboto20,
                  ),
                ),
              ),
            ),
            MouseRegion(
              onEnter: (pointerEvent){
                  setState(() {
                    hoverOnExperience = true;
                  });
                },
                onExit: (pointerEvent){
                  setState((){
                    hoverOnExperience = false;
                  });
                },
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  ref.read(scrollControllerProvider.notifier).scrollToIndex(2);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? AppStyles.mobileBorderPadding
                              : AppStyles.webBorderPadding),
                  alignment: Alignment.center,
                  child: Text(
                    "Experiences",
                    style: hoverOnExperience ? AppStyles.roboto20Colored : AppStyles.roboto20,
                  ),
                ),
              ),
            ),
            MouseRegion(
              onEnter: (pointerEvent){
                  setState(() {
                    hoverOnProject = true;
                  });
                },
                onExit: (pointerEvent){
                  setState((){
                    hoverOnProject = false;
                  });
                },
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  ref.read(scrollControllerProvider.notifier).scrollToIndex(3);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? AppStyles.mobileBorderPadding
                              : AppStyles.webBorderPadding),
                  alignment: Alignment.center,
                  child: Text(
                    "Projects",
                    style: hoverOnProject ? AppStyles.roboto20Colored : AppStyles.roboto20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
