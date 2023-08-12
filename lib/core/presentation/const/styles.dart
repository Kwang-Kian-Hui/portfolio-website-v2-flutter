import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AppStyles {
  // static const mainAppColour = Color(0xff1A191A);
  // static const containerColour = Color(0xff202020);
  // static const buttonGradientColour = Color(0xff222222);
  static const mainAppColour = Color(0xff111111);
  static const containerColour = Color(0xff222222);
  static const buttonGradientColour = Color(0xff232323);
  static const greyColour = Color(0xffDCDCDC);
  static const appSubColour = greyColour;
  static const wordSpacingPadding = EdgeInsets.symmetric(vertical: 8.0);

  static const lightShadowColour = Color(0xff515151);
  static const darkShadowColour = Color(0xff151515);

  static const Map<String, List<Color>> categoriesColorMapping = {
    "Spark": [Color(0xff000000), Color(0xffffffff)],
    "Scala": [Color(0xff000000), Color(0xffffffff)],
    "HTML":  [Color(0xff000000), Color(0xffffffff)],
    "CSS":  [Color(0xff000000), Color(0xffffffff)],
    "JS": [Color(0xff000000), Color(0xffffffff)],
    "C++": [Color(0xff000000), Color(0xffffffff)],
    "Dart": [Color(0xff000000), Color(0xffffffff)],
    "Python": [Color(0xff000000), Color(0xffffffff)],
    "Data Engineering":  [Color(0xff000000), Color(0xffffffff)],
    "Flutter": [Color(0xff000000), Color(0xffffffff)],
    "Django": [Color(0xff000000), Color(0xffffffff)],
    "p5.js": [Color(0xff000000), Color(0xffffffff)],
    "Web": [Color(0xff000000), Color(0xffffffff)],
    "Mobile": [Color(0xff000000), Color(0xffffffff)],
    "Github Actions": [Color(0xff000000), Color(0xffffffff)],
    "CI/CD": [Color(0xff000000), Color(0xffffffff)],
    "Google Firebase": [Color(0xff000000), Color(0xffffffff)],
    "Google Firestore": [Color(0xff000000), Color(0xffffffff)],
    "NoSQL": [Color(0xff000000), Color(0xffffffff)],
    "PostgreSQL": [Color(0xff000000), Color(0xffffffff)],
    "SQLite": [Color(0xff000000), Color(0xffffffff)],
    "AI/ML": [Color(0xff000000), Color(0xffffffff)],
    "Google Cloud Platform": [Color(0xff000000), Color(0xffffffff)],
  };

  static const containerShadow = [
    BoxShadow(
      offset: Offset(-1, -1),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppStyles.lightShadowColour,
      inset: false,
    ),
    BoxShadow(
      offset: Offset(3, 3),
      blurRadius: 30,
      spreadRadius: 0,
      color: AppStyles.darkShadowColour,
      inset: false,
    ),
  ];
  static const roundedButtonShadow = [
    BoxShadow(
      offset: Offset(-3, -3),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppStyles.lightShadowColour,
      inset: false,
    ),
    BoxShadow(
      offset: Offset(5, 5),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppStyles.darkShadowColour,
      inset: false,
    ),
  ];

  static const invertedRoundedButtonShadow = [
    BoxShadow(
      offset: Offset(3, 3),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppStyles.lightShadowColour,
      inset: false,
    ),
    BoxShadow(
      offset: Offset(-3, -3),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppStyles.darkShadowColour,
      inset: false,
    ),
  ];

  static const containerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppStyles.buttonGradientColour,
      AppStyles.mainAppColour,
    ],
  );

  static const invertedContainerGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      AppStyles.buttonGradientColour,
      AppStyles.mainAppColour,
    ],
  );

  static const containerBorderRadius = 15.0;
  static const webBorderPadding = 60.0;
  static const mobileBorderPadding = 20.0;
  static const horizontalPadding10 = EdgeInsets.symmetric(horizontal: 10);

  static const montserratAlt210 = TextStyle(
      fontSize: 210,
      fontFamily: "Montserrat_Alternates",
      fontWeight: FontWeight.w400,
      color: Color(0xffffffff));
  static const montserratAlt150 = TextStyle(
      fontSize: 150,
      fontFamily: "Montserrat_Alternates",
      fontWeight: FontWeight.w400,
      color: Color(0xffffffff));
  static const montserratAlt125 = TextStyle(
      fontSize: 125,
      fontFamily: "Montserrat_Alternates",
      fontWeight: FontWeight.w400,
      color: Color(0xffffffff));
  static const montserratAlt90 = TextStyle(
      fontSize: 90,
      fontFamily: "Montserrat_Alternates",
      fontWeight: FontWeight.w400,
      color: Color(0xffffffff));

  static const montserrat32 = TextStyle(
      fontSize: 32.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static final montserrat30w500Neon = TextStyle(
      fontSize: 30.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
      shadows: [
        for (int i = 0; i < 8; i++)
          Shadow(color: Colors.white.withOpacity(0.3), blurRadius: 3.0 * i),
      ]);
  static final montserrat30Coloredw500Neon = TextStyle(
      fontSize: 30.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      color: appSubColour,
      overflow: TextOverflow.ellipsis,
      shadows: [
        for (int i = 0; i < 8; i++)
          Shadow(color: Colors.red.shade300, blurRadius: 3.0 * i),
      ]);
  static const montserrat30Coloredw500 = TextStyle(
      fontSize: 30.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat30w500 = TextStyle(
      fontSize: 30.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat25ColoredBold = TextStyle(
      fontSize: 25.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat25Bold = TextStyle(
      fontSize: 25.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat25 = TextStyle(
      fontSize: 25.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const montserrat25GreyBold = TextStyle(
      fontSize: 25.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat20 =
      TextStyle(fontSize: 20.0, fontFamily: "Montserrat", color: Colors.white);
  static const montserrat20Bold = TextStyle(
      fontSize: 20.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat20Grey = TextStyle(
      fontSize: 20.0,
      fontFamily: "Montserrat",
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat20GreyBold = TextStyle(
      fontSize: 20.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat20Colored = TextStyle(
      fontSize: 20.0,
      fontFamily: "Montserrat",
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat20ColoredBold = TextStyle(
      fontSize: 20.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat18 =
      TextStyle(fontSize: 18.0, fontFamily: "Montserrat", color: Colors.white);
  static const montserrat18Grey = TextStyle(
      fontSize: 18.0,
      fontFamily: "Montserrat",
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat18Bold = TextStyle(
      fontSize: 18.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat18GreyBold = TextStyle(
      fontSize: 18.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat18ColoredBold = TextStyle(
      fontSize: 18.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat14 = TextStyle(
      fontSize: 14.0,
      fontFamily: "Montserrat",
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat14Grey = TextStyle(
      fontSize: 14.0,
      fontFamily: "Montserrat",
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat14Colored = TextStyle(
      fontSize: 14.0,
      fontFamily: "Montserrat",
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat14Bold = TextStyle(
      fontSize: 14.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat14GreyBold = TextStyle(
      fontSize: 14.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat14ColoredBold = TextStyle(
      fontSize: 14.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat12 =
      TextStyle(fontSize: 12.0, fontFamily: "Montserrat", color: Colors.white);
  static const montserrat12Grey = TextStyle(
      fontSize: 12.0,
      fontFamily: "Montserrat",
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat12GreyBold = TextStyle(
      fontSize: 12.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat12ColoredBold = TextStyle(
      fontSize: 12.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat10 = TextStyle(
      fontSize: 10.0,
      fontFamily: "Montserrat",
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const montserrat10Grey = TextStyle(
      fontSize: 10.0,
      fontFamily: "Montserrat",
      color: greyColour,
      overflow: TextOverflow.ellipsis);
  static const montserrat10Bold = TextStyle(
      fontSize: 10.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);

  static const courgette20 = TextStyle(
      fontSize: 20.0,
      fontFamily: "Courgette",
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const courgette20Colored = TextStyle(
      fontSize: 20.0,
      fontFamily: "Courgette",
      color: appSubColour,
      overflow: TextOverflow.ellipsis);

  static const courgette30 = TextStyle(
      fontSize: 30.0,
      fontFamily: "Courgette",
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const courgette30Colored = TextStyle(
      fontSize: 30.0,
      fontFamily: "Courgette",
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  static const courgette30Bold = TextStyle(
      fontSize: 30.0,
      fontFamily: "Courgette",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow: TextOverflow.ellipsis);
  static const courgette30ColoredBold = TextStyle(
      fontSize: 30.0,
      fontFamily: "Courgette",
      fontWeight: FontWeight.w700,
      color: appSubColour,
      overflow: TextOverflow.ellipsis);
  // static const courgette20 = TextStyle(fontSize: 20.0, fontFamily: "Courgette", color: Colors.white,);
}
