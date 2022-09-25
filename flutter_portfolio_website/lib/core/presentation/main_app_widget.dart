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
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff222222),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline4: TextStyle(
            fontSize: 20.0, fontFamily: "Courgette", color: Color(0xff89898D),
          ),
          headline5: TextStyle(
              fontSize: 22.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Colors.white),
          headline6: TextStyle(
              fontSize: 20.0, fontFamily: "Courgette", color: Colors.white),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      home: const MainPageWidget(),
    );
  }
}
