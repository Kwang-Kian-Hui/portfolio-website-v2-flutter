import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableIconWidget extends StatefulWidget {
  const ClickableIconWidget(
      {Key? key, required this.urlLink, required this.imagePath})
      : super(key: key);
  final String urlLink;
  final String imagePath;

  @override
  State<ClickableIconWidget> createState() => _ClickableIconWidgetState();
}

class _ClickableIconWidgetState extends State<ClickableIconWidget> {
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(widget.urlLink);

    bool urlError = false;

    double buttonSize = ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
        ? 40
        : ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? 60
            : 80;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          try {
            await launchUrl(_url, mode: LaunchMode.inAppWebView);
          } on Exception {
            urlError = true;
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppStyles.greyColour,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            widget.imagePath,
            height: buttonSize,
            width: buttonSize,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.medium,
          ),
        ),
      ),
    );
  }
}
