import 'dart:math';

import 'package:flutter_portfolio_website/core/application/education_class.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';
import 'package:flutter_portfolio_website/core/infrastructure/edu_and_exp_data.dart';
import 'package:flutter_portfolio_website/core/presentation/components/sub_components/draggable_logo_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:vector_math/vector_math_64.dart' as vector64;

class RadialMenuWidget extends ConsumerStatefulWidget {
  const RadialMenuWidget({
    Key? key,
    required this.controller,
    required this.isExp,
  }) : super(key: key);

  final AnimationController controller;
  final bool isExp;

  @override
  RadialMenuWidgetState createState() => RadialMenuWidgetState();
}

class RadialMenuWidgetState extends ConsumerState<RadialMenuWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late Animation<double> translation;

  @override
  void initState() {
    scale = Tween<double>(
      begin: 1.5,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.fastOutSlowIn),
    );
    translation = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeInOutCubic),
    );
    super.initState();
  }

  _open() {
    if (widget.controller != null) {
      widget.controller.forward();
    }
  }

  _close() {
    if (widget.controller != null) {
      widget.controller.reverse();
    }
  }

  Offset myPointerDragAnchorStrategy(
      Draggable<Object> draggable, BuildContext context, Offset position) {
    return const Offset(0, 0);
  }

  _buildButton(WidgetRef ref, double angle, int index) {
    final double rad = vector.radians(angle);
    return Transform(
      transform: vector64.Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
      child: widget.isExp
          ? Draggable<ExperienceClass>(
              dragAnchorStrategy: (ResponsiveWrapper.of(context).isMobile ||
                          ResponsiveWrapper.of(context)
                              .isSmallerThan(MOBILE)) &&
                      MediaQuery.of(context).size.width <= 450
                  ? myPointerDragAnchorStrategy
                  : null,
              data: expClassList[index],
              feedback: LogoWidget(
                logoImagePath: expClassList[index].imagePath,
                hasBackground: expClassList[index].hasBackground,
                width: 60,
              ),
              childWhenDragging: const SizedBox(),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(selectedExperienceIndexProvider.notifier)
                        .change(index + 1);
                    _close();
                  },
                  child: LogoWidget(
                    logoImagePath: expClassList[index].imagePath,
                    hasBackground: expClassList[index].hasBackground,
                    width: 60,
                  ),
                ),
              ),
            )
          : Draggable<EducationClass>(
              dragAnchorStrategy: (ResponsiveWrapper.of(context).isMobile ||
                          ResponsiveWrapper.of(context)
                              .isSmallerThan(MOBILE)) &&
                      MediaQuery.of(context).size.width <= 450
                  ? myPointerDragAnchorStrategy
                  : null,
              data: eduClassList[index],
              feedback: LogoWidget(
                logoImagePath: eduClassList[index].imagePath,
                hasBackground: eduClassList[index].hasBackground,
                width: 60,
              ),
              childWhenDragging: const SizedBox(),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(selectedEducationIndexProvider.notifier)
                        .change(index + 1);
                    _close();
                  },
                  child: LogoWidget(
                    logoImagePath: eduClassList[index].imagePath,
                    hasBackground: eduClassList[index].hasBackground,
                    width: 60,
                  ),
                ),
              ),
            ),
      // ),
    );
  }

  List<Widget> buildWidgetChildren() {
    List<Widget> listOfWidgets = [];
    // workaround so that GestureDetector works for radial menu
    listOfWidgets.add(Container(
      width: 300,
      height: 300,
      color: Colors.transparent,
    ));

    if (widget.isExp) {
      for (int i = 0; i < expClassList.length; i++) {
        listOfWidgets.add(_buildButton(ref, (i * 45), i));
      }
    } else {
      for (int i = 0; i < eduClassList.length; i++) {
        listOfWidgets.add(_buildButton(ref, 180 - (i * 45), i));
      }
    }

    listOfWidgets.add(Transform.scale(
      scale: scale.value -
          1.5, // subtract the beginning value to run the opposite animation
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _close,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppStyles.buttonGradientColour,
                  AppStyles.mainAppColour,
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: AppStyles.roundedButtonShadow,
            ),
            child: const Icon(Icons.cancel_outlined,
                color: AppStyles.appSubColour),
          ),
        ),
      ),
    ));
    listOfWidgets.add(Transform.scale(
      scale: scale.value,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _open,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff222222),
                  AppStyles.mainAppColour,
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: AppStyles.roundedButtonShadow,
            ),
            child: widget.isExp
                ? const Icon(Icons.work_outline_rounded,
                    color: AppStyles.appSubColour)
                : const Icon(Icons.school_outlined,
                    color: AppStyles.appSubColour),
          ),
        ),
      ),
    ));

    return listOfWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, builder) {
          return Stack(
            alignment: widget.isExp ? Alignment.topLeft : Alignment.topRight,
            children: buildWidgetChildren(),
          );
        });
  }
}
