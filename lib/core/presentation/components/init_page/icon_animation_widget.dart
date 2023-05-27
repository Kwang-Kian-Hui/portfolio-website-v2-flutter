import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

class IconAnimationWidget extends StatefulWidget {
  const IconAnimationWidget({super.key, required this.iconPath, required this.beginOffset, required this.endOffset});

  final String iconPath;
  final Offset beginOffset;
  final Offset endOffset;

  @override
  State<IconAnimationWidget> createState() => _IconAnimationWidgetState();
}

class _IconAnimationWidgetState extends State<IconAnimationWidget>
    with SingleTickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 1),
  //   vsync: this,
  // );
  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  //   begin: Offset(2.0, 0.0),
  //   end: Offset.zero,
  // ).animate(CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.elasticIn,
  // ));
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool visibleIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    Future.delayed(const Duration(milliseconds: 5000), () {
      visibleIcon = true;

      _offsetAnimation.addListener(() {
        setState(() {});
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
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: visibleIcon,
          child: Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyles.greyColour,
            ),
            alignment: Alignment.center,
            child: Image.asset(widget.iconPath,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.medium),
          ),
        ),
      ),
    );
  }
}
