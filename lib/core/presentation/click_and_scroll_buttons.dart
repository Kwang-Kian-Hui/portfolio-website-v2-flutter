import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ClickAndScrollButtons extends ConsumerStatefulWidget {
  const ClickAndScrollButtons(
      {Key? key,
      required this.index,
      required this.buttonText,
      required this.state})
      : super(key: key);

  final int index;
  final String buttonText;
  final bool state;

  @override
  ClickAndScrollButtonsState createState() => ClickAndScrollButtonsState();
}

class ClickAndScrollButtonsState extends ConsumerState<ClickAndScrollButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(scrollControllerProvider.notifier).scrollToIndex(widget.index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveWrapper.of(context).isSmallerThan("MINI-DESKTOP")
                ? AppStyles.mobileBorderPadding
                : AppStyles.webBorderPadding),
        alignment: Alignment.center,
        child: Text(
          widget.buttonText,
          style: widget.state
              ? AppStyles.montserrat20Colored
              : AppStyles.montserrat20,
        ),
      ),
    );
  }
}
