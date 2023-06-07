import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TextDisplay extends StatelessWidget {
  const TextDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 214,
      left: 40,
      child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? DefaultTextStyle(
              style: ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")
                  ? AppStyles.montserratAlt90
                  : AppStyles.montserratAlt125,
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    "Design.\nCreate.\nInnovate.",
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            )
          : DefaultTextStyle(
              style: ResponsiveWrapper.of(context)
                      .isSmallerThan("BP-FOR-INIT-PAGE-TEXT")
                  ? AppStyles.montserratAlt125
                  : ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")
                      ? AppStyles.montserratAlt150
                      : AppStyles.montserratAlt210,
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    "Design. Create.\nInnovate.",
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
    );
  }
}
