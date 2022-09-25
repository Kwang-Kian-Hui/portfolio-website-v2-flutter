import 'package:flutter/material.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({Key? key}) : super(key: key);

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("Projects", style: TextStyle(fontSize: 72, color: Colors.white))));
  }
}
