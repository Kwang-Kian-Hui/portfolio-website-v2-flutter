import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/components/about_me/clickable_icon_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/const.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  @override
  Widget build(BuildContext context) {
    bool smallerThanMinHeight = MediaQuery.of(context).size.height < 720;
    bool smallerThanMiniDesktop =
        ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP");
    bool smallerThanCustomBp =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT");

    List<ResponsiveRowColumnItem> responsiveRowColumnWidgetList = [
      ResponsiveRowColumnItem(
        child: Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            padding: const EdgeInsets.only(bottom: AppStyles.webBorderPadding),
            decoration: BoxDecoration(
              color: AppStyles.containerColour,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffDCDCDC)),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/my_photo.png',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
      ),
      ResponsiveRowColumnItem(
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HI MY NAME IS KIAN HUI, I AM A SOFTWARE ENGINEER.",
                    style: smallerThanMiniDesktop
                        ? AppStyles.montserrat20
                        : smallerThanCustomBp
                            ? AppStyles.montserrat25
                            : AppStyles.montserrat32),
                const SizedBox(height: 30),
                Text(ConstObjects.aboutMeDescription2,
                    style: smallerThanMiniDesktop
                        ? AppStyles.montserrat12
                        : smallerThanCustomBp
                            ? AppStyles.montserrat18
                            : AppStyles.montserrat20),
              ],
            ),
          ),
        ),
      ),
    ];

    return SizedBox(
      height: smallerThanMinHeight && smallerThanMiniDesktop
          ? 1440
          : smallerThanMinHeight
              ? 720
              : MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          ResponsiveRowColumn(
            layout: smallerThanMiniDesktop
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              responsiveRowColumnWidgetList[smallerThanMiniDesktop ? 0 : 1],
              responsiveRowColumnWidgetList[smallerThanMiniDesktop ? 1 : 0],
              smallerThanMiniDesktop
                  ? ResponsiveRowColumnItem(
                      child: Container(
                          height: ResponsiveWrapper.of(context)
                                  .isSmallerThan(DESKTOP)
                              ? 120
                              : 180),
                    )
                  : const ResponsiveRowColumnItem(child: SizedBox())
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                bottom: smallerThanMinHeight
                    ? AppStyles.mobileBorderPadding
                    : AppStyles.webBorderPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Spacer(flex: 3),
                  ClickableIconWidget(
                      urlLink: "https://www.linkedin.com/in/kwang-kian-hui/",
                      imagePath: "assets/images/icons/icons8-linkedin-96.png"),
                  Spacer(flex: 1),
                  ClickableIconWidget(
                      urlLink: "https://github.com/Kwang-Kian-Hui",
                      imagePath: "assets/images/icons/icons8-github-90.png"),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
