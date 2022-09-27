import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';

class ExperienceDetailWidget extends ConsumerStatefulWidget {
  const ExperienceDetailWidget(
      {Key? key, required this.currentSelection})
      : super(key: key);
  final ExperienceClass currentSelection;

  @override
  ExperienceDetailWidgetState createState() => ExperienceDetailWidgetState();
}

class ExperienceDetailWidgetState
    extends ConsumerState<ExperienceDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            DragTarget<ExperienceClass>(
              onAccept: (droppedIndex) {
                ref
                    .read(selectedExperienceIndexProvider.notifier)
                    .change(droppedIndex.index);
              },
              onWillAccept: (droppedData) {
                if (droppedData != null) {
                  return true;
                }
                return false;
              },
              builder: (context, candidateData, rejectedData) => LogoWidget(
                logoImagePath: widget.currentSelection.imagePath,
                hasBackground: widget.currentSelection.hasBackground,
              ),
            ),
            Container(
              child: Text(widget.currentSelection.expTitle, style: TextStyle())
            ),
          ],
        ),
      ],
    );
  }
}
