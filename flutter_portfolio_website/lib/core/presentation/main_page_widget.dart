import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/app_bar_widget.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        backgroundColor: Color(0xff222222),
      );
  }
}