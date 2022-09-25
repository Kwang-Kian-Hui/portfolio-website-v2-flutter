import 'package:flutter/material.dart';

class ExperiencesWidget extends StatefulWidget {
  const ExperiencesWidget({Key? key}) : super(key: key);

  @override
  State<ExperiencesWidget> createState() => _ExperiencesWidgetState();
}

class _ExperiencesWidgetState extends State<ExperiencesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("EXPERIENCES", style: TextStyle(fontSize: 72, color: Colors.white))));
  }
}
