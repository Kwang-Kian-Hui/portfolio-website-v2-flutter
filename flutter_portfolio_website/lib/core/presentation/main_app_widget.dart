import 'package:flutter/material.dart';
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
        primaryColor: const Color(0xff222222),
        fontFamily: 'Roboto',
      ),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: "BP-FOR-SMALL-MOBILE"),
          const ResponsiveBreakpoint.resize(500, name: MOBILE),
          const ResponsiveBreakpoint.resize(550, name: "BP-FOR-MOBILE"),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: "MINI-DESKTOP"),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
      ),
      home: const MainPageWidget(),
    );
  }
}
