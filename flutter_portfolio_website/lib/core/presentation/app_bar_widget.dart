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
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff222222),
      title: SizedBox(
        height: 75,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: MouseRegion(
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
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "KH",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            MouseRegion(
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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            MouseRegion(
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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            MouseRegion(
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
                    style: Theme.of(context).textTheme.headline6,
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
