import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class IconAnimationWidget extends StatefulWidget {
  const IconAnimationWidget(
      {super.key,
      required this.iconPath,
      required this.beginOffset,
      required this.endOffset,
      required this.delayDuration,
      required this.isSmallerThanMobileBP,
      required this.isSmallerThanDesktop});

  final String iconPath;
  final Offset beginOffset;
  final Offset endOffset;
  final int delayDuration;
  final bool isSmallerThanMobileBP;
  final bool isSmallerThanDesktop;

  @override
  State<IconAnimationWidget> createState() => _IconAnimationWidgetState();
}

class _IconAnimationWidgetState extends State<IconAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool visibleIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.isSmallerThanMobileBP
          ? const Duration(seconds: 3)
          : widget.isSmallerThanDesktop
              ? const Duration(seconds: 3, milliseconds: 600)
              : const Duration(seconds: 4, milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    Future.delayed(Duration(milliseconds: 4500 + widget.delayDuration), () {
      visibleIcon = true;

      _offsetAnimation.addListener(() {
        setState(() {});
        _controller.repeat();
      });

      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool smallerThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool smallerThanBp =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT");
    return Positioned(
      bottom: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: visibleIcon,
            child: Container(
              height: smallerThanDesktop
                  ? 80
                  : smallerThanBp
                      ? 100
                      : 120,
              width: smallerThanDesktop
                  ? 80
                  : smallerThanBp
                      ? 100
                      : 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppStyles.greyColour,
              ),
              alignment: Alignment.center,
              child: Image.asset(widget.iconPath,
                  height: smallerThanDesktop
                      ? 60
                      : smallerThanBp
                          ? 80
                          : 100,
                  width: smallerThanDesktop
                      ? 60
                      : smallerThanBp
                          ? 80
                          : 100,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.medium),
            ),
          ),
        ),
      ),
    );
  }
}
