import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
            const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                        ? AppStyles.mobileBorderPadding
                        : AppStyles.webBorderPadding),
                alignment: Alignment.center,
                child: Text(
                  "Projects",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                        ? AppStyles.mobileBorderPadding
                        : AppStyles.webBorderPadding),
                alignment: Alignment.center,
                child: Text(
                  "Experience",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                        ? AppStyles.mobileBorderPadding
                        : AppStyles.webBorderPadding),
                alignment: Alignment.center,
                child: Text(
                  "About Me",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
