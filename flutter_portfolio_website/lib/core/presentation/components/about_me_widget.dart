import 'package:flutter/material.dart';

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("ABOUT ME", style: TextStyle(fontSize: 72, color: Colors.white))));
  }
}
