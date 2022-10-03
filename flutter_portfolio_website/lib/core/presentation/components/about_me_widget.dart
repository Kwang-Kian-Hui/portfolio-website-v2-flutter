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
      height: ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
          ? MediaQuery.of(context).size.height * 1.4
          : ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
              ? MediaQuery.of(context).size.height * 1.25
              : MediaQuery.of(context).size.height,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Expanded(
              flex: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
                  ? 1
                  : 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.webBorderPadding),
                height: double.infinity,
                width: double.infinity,
                child: CircleAvatar(
                  backgroundColor: const Color(0xff292929),
                  child: Card(
                    elevation: 2,
                    color: const Color(0xff292929),
                    shadowColor: Colors.transparent,
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
              flex: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
                  ? 4
                  : 5,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.webBorderPadding),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 90,
                      left: ResponsiveWrapper.of(context)
                              .isSmallerThan("MINI-DESKTOP")
                          ? 50
                          : 100,
                      right: ResponsiveWrapper.of(context)
                              .isSmallerThan("MINI-DESKTOP")
                          ? 50
                          : 100,
                      child: SizedBox(
                        height: 10.0,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 1.0, end: 1.0),
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: ResponsiveWrapper.of(context)
                              .isSmallerThan("MINI-DESKTOP")
                          ? 50
                          : 100,
                      right: ResponsiveWrapper.of(context)
                              .isSmallerThan("MINI-DESKTOP")
                          ? 50
                          : 100,
                      child: SizedBox(
                        height: 10.0,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 1.0, end: 1.0),
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        height: 190,
                        alignment: Alignment.center,
                        color: const Color(0xff222222),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Who", style: AppStyles.roboto25ColoredBold),
                            Text(" Am I", style: AppStyles.roboto25Bold),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                          ? 30
                          : 130,
                      top: 150,
                      right: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                          ? 30
                          : 100,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff292929),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // height: getWidgetHeight(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                Text(
                                  "My name is Kian Hui and I am a software engineer. I enjoy learning new technologies and applying them "
                                  "to various projects to reinforce my knowledge in their respective areas."
                                  "\n\nI have experience in frontend development using Flutter for web/mobile applications utilizing tools from "
                                  "cloud platforms such as Google Cloud and Microsoft Azure. However, that does not limit my learning to frontend "
                                  "technologies as I look for opportunities to expand my knowledge towards other fields."
                                  "\n\nRead more about my experiences and skills below.",
                                  maxLines: 35,
                                  style: AppStyles.roboto14,
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  "\n\nPersonal Trivia:\n",
                                  style: AppStyles.roboto18Bold,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Things I do to relieve stress: gaming, running/hiking/cycling and gardening(just me and my 3 indoor plants)",
                                    maxLines: 35,
                                    style: AppStyles.roboto14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
