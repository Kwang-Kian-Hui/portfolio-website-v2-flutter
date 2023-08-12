import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/components/init_page/icon_animation_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/init_page/text_display.dart';
import 'package:flutter_portfolio_website/core/shared/const.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({Key? key}) : super(key: key);

  @override
  State<InitWidget> createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  @override
  Widget build(BuildContext context) {
    bool smallerThanMinHeight = MediaQuery.of(context).size.height < 720;
    bool specialCondition =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) &&
            !ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE");
    bool isSmallerThanMobileBp =
        ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE");
    bool isSmallerThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);

    Offset getBeginOffSet() {
      if (ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")) {
        return const Offset(7.0, 0.0);
      }
      if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
        return const Offset(10.0, 0.0);
      }
      return const Offset(15.0, 0.0);
    }

    Offset getEndOffSet() {
      if (ResponsiveWrapper.of(context).isSmallerThan("BP-FOR-MOBILE")) {
        return const Offset(-3.0, 0.0);
      }
      if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
        return const Offset(-3.0, 0.0);
      }
      return const Offset(-3.0, 0.0);
    }

    return Container(
      constraints: const BoxConstraints(
        minWidth: 480,
        minHeight: 720,
      ),
      height: smallerThanMinHeight
          ? specialCondition
              ? 920
              : 720
          : MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Image(
          //     image: const AssetImage(ConstObjects.backgroundImage),
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //     fit: BoxFit.fill,
          //     errorBuilder: (context, index, _) => const SizedBox()),
          IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-flutter-96.png',
            beginOffset: getBeginOffSet(),
            endOffset: getEndOffSet(),
            delayDuration: 0,
            isSmallerThanMobileBP: isSmallerThanMobileBp,
            isSmallerThanDesktop: isSmallerThanDesktop,
          ),
          // IconAnimationWidget(
          //   iconPath: 'assets/images/icons/icons8-react-80.png',
          //   beginOffset: getBeginOffSet(),
          //   endOffset: getEndOffSet(),
          //   delayDuration: 400,
          // isSmallerThanMobileBP: isSmallerThanMobileBp,
          // isSmallerThanDesktop: isSmallerThanDesktop,
          // ),
          IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-js-96.png',
            beginOffset: getBeginOffSet(),
            endOffset: getEndOffSet(),
            delayDuration: 400,
            isSmallerThanMobileBP: isSmallerThanMobileBp,
            isSmallerThanDesktop: isSmallerThanDesktop,
          ),
          IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-python-96.png',
            beginOffset: getBeginOffSet(),
            endOffset: getEndOffSet(),
            delayDuration: 800,
            isSmallerThanMobileBP: isSmallerThanMobileBp,
            isSmallerThanDesktop: isSmallerThanDesktop,
          ),
          IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-postgresql-96.png',
            beginOffset: getBeginOffSet(),
            endOffset: getEndOffSet(),
            delayDuration: 1200,
            isSmallerThanMobileBP: isSmallerThanMobileBp,
            isSmallerThanDesktop: isSmallerThanDesktop,
          ),
          IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-google-cloud-platform-96.png',
            beginOffset: getBeginOffSet(),
            endOffset: getEndOffSet(),
            delayDuration: 1600,
            isSmallerThanMobileBP: isSmallerThanMobileBp,
            isSmallerThanDesktop: isSmallerThanDesktop,
          ),
          IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-azure-96.png',
            beginOffset: getBeginOffSet(),
            endOffset: getEndOffSet(),
            delayDuration: 2000,
            isSmallerThanMobileBP: isSmallerThanMobileBp,
            isSmallerThanDesktop: isSmallerThanDesktop,
          ),
          const TextDisplay(),
        ],
      ),
    );
  }
}
