import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget(
      {Key? key, required this.logoImagePath, required this.hasBackground, required this.width})
      : super(key: key);
  final String logoImagePath;
  final bool hasBackground;
  final double width;

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.width/2),
      ),
      child: Container(
        height: widget.width,
        width: widget.width,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: widget.hasBackground
              ? AppStyles.appSubColour
              : AppStyles.mainAppColour,
          radius: widget.width / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.width),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(widget.logoImagePath,
                  fit: BoxFit.fitHeight, filterQuality: FilterQuality.medium),
            ),
          ),
        ),
      ),
    );
  }
}
