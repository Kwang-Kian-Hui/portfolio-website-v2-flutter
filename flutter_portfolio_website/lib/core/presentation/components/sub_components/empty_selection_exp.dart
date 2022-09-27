import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';

class EmptySelectionExp extends ConsumerStatefulWidget {
  const EmptySelectionExp({Key? key}) : super(key: key);

  @override
  EmptySelectionExpState createState() => EmptySelectionExpState();
}

class EmptySelectionExpState extends ConsumerState<EmptySelectionExp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DragTarget<ExperienceClass>(
          onAccept: (droppedIndex) {
            ref.read(selectedExperienceIndexProvider.notifier).change(droppedIndex.index);
          },
          onWillAccept: (droppedData) {
            if(droppedData != null){
              return true;
            }
            return false;
          },
          builder: (context, candidateData, rejectedData) => DottedBorder(
            borderType: BorderType.Circle,
            color: const Color(0xffF58C82),
            dashPattern: const [10, 3],
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
