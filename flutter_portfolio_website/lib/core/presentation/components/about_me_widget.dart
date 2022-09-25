import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? MediaQuery.of(context).size.height * 2 : MediaQuery.of(context).size.height,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppStyles.webBorderPadding),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: CircleAvatar(
                  child: Card(
                    elevation: 2,
                    color: const Color(0xff292929),
                    shadowColor: Colors.white,
                    borderOnForeground: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 2,
                      ),
                      child: Image.asset(
                        'assets/images/my_photo.png',
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppStyles.webBorderPadding),
                // color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
