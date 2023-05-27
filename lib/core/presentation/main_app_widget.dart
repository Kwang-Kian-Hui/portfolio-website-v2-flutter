import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/presentation/main_page_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainAppWidget extends StatefulWidget {
  const MainAppWidget({Key? key}) : super(key: key);

  @override
  State<MainAppWidget> createState() => _MainAppWidgetState();
}

class _MainAppWidgetState extends State<MainAppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kwang Kian Hui",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppStyles.mainAppColour,
        fontFamily: 'Montserrat',
      ),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 480,
        defaultScale: true,
        defaultName: "16-INCH",
        breakpoints: [
          // const ResponsiveBreakpoint.resize(480, name: "BP-FOR-SMALL-MOBILE"),
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(660, name: "BP-FOR-MOBILE"),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(900, name: "MINI-DESKTOP"),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1728, name: "16-INCH"),
        ],
      ),
      home: const MainPageWidget(),
    );
  }
}
