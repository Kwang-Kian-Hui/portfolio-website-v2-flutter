import 'package:flutter/material.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget(
      {Key? key, required this.logoImagePath, required this.hasBackground})
      : super(key: key);
  final String logoImagePath;
  final bool hasBackground;

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor:
              widget.hasBackground ? Colors.white : const Color(0xff292929),
          radius: 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(widget.logoImagePath, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
