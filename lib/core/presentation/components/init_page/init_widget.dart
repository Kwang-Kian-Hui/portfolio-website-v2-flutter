// import 'package:animated_background/animated_background.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// class InitWidget extends StatefulWidget {
//   const InitWidget({Key? key}) : super(key: key);

//   @override
//   State<InitWidget> createState() => _InitWidgetState();

//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// class _InitWidgetState extends State<InitWidget>
//     with SingleTickerProviderStateMixin {
//   int particleTypeIndex = 0;

//   static ParticleOptions particles = const ParticleOptions(
//     baseColor: AppStyles.appSubColour,
//     spawnOpacity: 0.0,
//     opacityChangeRate: 0.25,
//     minOpacity: 0.1,
//     maxOpacity: 0.4,
//     particleCount: 50,
//     spawnMaxRadius: 15.0,
//     spawnMinRadius: 7.0,
//     spawnMaxSpeed: 100.0,
//     spawnMinSpeed: 30,
//   );

//   static ParticleOptions hoverParticles = const ParticleOptions(
//     baseColor: AppStyles.appSubColour,
//     spawnOpacity: 0.0,
//     opacityChangeRate: 0.25,
//     minOpacity: 0.5,
//     maxOpacity: 0.7,
//     particleCount: 50,
//     spawnMaxRadius: 30.0,
//     spawnMinRadius: 14.0,
//     spawnMaxSpeed: 10.0,
//     spawnMinSpeed: 1.0,
//   );

//   static List<ParticleOptions> particleList = [
//     particles,
//     hoverParticles,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height - widget.preferredSize.height,
//       width: MediaQuery.of(context).size.width,
//       child: AnimatedBackground(
//         vsync: this,
//         behaviour:
//             RandomParticleBehaviour(options: particleList[particleTypeIndex]),
//         child: Container(
//           alignment: Alignment.center,
//           child: MouseRegion(
//             cursor: SystemMouseCursors.click,
//             onEnter: (pointerEvent) {
//               particleTypeIndex = 1;
//               setState(() {});
//             },
//             onExit: (pointerEvent) {
//               particleTypeIndex = 0;
//               setState(() {});
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                   width: 2,
//                   color: Colors.white30,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: particleTypeIndex == 1
//                         ? Colors.white
//                         : Colors.white.withOpacity(0.2),
//                     blurRadius: particleTypeIndex == 1 ? 25 : 5,
//                     spreadRadius: -5,
//                     blurStyle: particleTypeIndex == 1
//                         ? BlurStyle.outer
//                         : BlurStyle.inner,
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 child: ResponsiveRowColumn(
//                   rowMainAxisAlignment: MainAxisAlignment.center,
//                   columnMainAxisAlignment: MainAxisAlignment.center,
//                   rowMainAxisSize: MainAxisSize.min,
//                   columnMainAxisSize: MainAxisSize.min,
//                   layout: ResponsiveWrapper.of(context)
//                           .isSmallerThan("MINI-DESKTOP")
//                       ? ResponsiveRowColumnType.COLUMN
//                       : ResponsiveRowColumnType.ROW,
//                   children: [
//                     ResponsiveRowColumnItem(
//                         child: SelectableText("Welcome to my ",
//                             style: particleTypeIndex == 1
//                                 ? AppStyles.montserrat30w500Neon
//                                 : AppStyles.montserrat30w500)),
//                     ResponsiveRowColumnItem(
//                         child: SelectableText("Portfolio Website",
//                             style: particleTypeIndex == 1
//                                 ? AppStyles.montserrat30Coloredw500Neon
//                                 : AppStyles.montserrat30Coloredw500)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/components/init_page/icon_animation_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/init_page/text_display.dart';
import 'package:flutter_portfolio_website/core/shared/const.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({Key? key}) : super(key: key);

  @override
  State<InitWidget> createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image(
              image: const AssetImage(ConstObjects.backgroundImage),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              errorBuilder: (context, index, _) => const SizedBox()),
          const TextDisplay(),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-flutter-96.png',
            beginOffset: Offset(1.0, 9.0),
            endOffset: Offset(1.0, 6.3),
          ),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-js-96.png',
            beginOffset: Offset(2.5, 9.0),
            endOffset: Offset(2.5, 6.3),
          ),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-python-96.png',
            beginOffset: Offset(4.0, 9.0),
            endOffset: Offset(4.0, 6.3),
          ),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-postgresql-96.png',
            beginOffset: Offset(5.5, 9.0),
            endOffset: Offset(5.5, 6.3),
          ),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-firebase-96.png',
            beginOffset: Offset(7.0, 9.0),
            endOffset: Offset(7.0, 6.3),
          ),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-google-cloud-platform-96.png',
            beginOffset: Offset(8.5, 9.0),
            endOffset: Offset(8.5, 6.3),
          ),
          const IconAnimationWidget(
            iconPath: 'assets/images/icons/icons8-azure-96.png',
            beginOffset: Offset(10.0, 9.0),
            endOffset: Offset(10.0, 6.3),
          ),
        ],
      ),
    );
  }
}
