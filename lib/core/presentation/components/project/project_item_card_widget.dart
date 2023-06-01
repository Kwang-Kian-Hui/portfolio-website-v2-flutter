import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_portfolio_website/core/application/project_class.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ProjectItemCardWidget extends StatefulWidget {
  const ProjectItemCardWidget({Key? key, required this.projectItem}) : super(key: key);
  final Project projectItem;

  @override
  State<ProjectItemCardWidget> createState() => _ProjectItemCardWidgetState();
}

class _ProjectItemCardWidgetState extends State<ProjectItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppStyles.webBorderPadding, vertical: AppStyles.webBorderPadding),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(AppStyles.containerBorderRadius),
            gradient: AppStyles.containerGradient,
            boxShadow: AppStyles.containerShadow
          ),
      ),
    );
  }
}