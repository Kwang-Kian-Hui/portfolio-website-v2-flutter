import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

class TextDisplay extends StatelessWidget {
  const TextDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 214,
      left: 40,
      child: DefaultTextStyle(
        style: AppStyles.montserratAlt210,
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
