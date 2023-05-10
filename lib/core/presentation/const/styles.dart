import 'package:flutter/material.dart';

class AppStyles {
  static const mainAppColour = Color(0xff222222);
  static const containerColour = Color(0xff292929);

  static const webBorderPadding = 60.0;
  static const mobileBorderPadding = 20.0;

  static final roboto30w500Neon = TextStyle(fontSize: 30.0, fontFamily: "Roboto", fontWeight: FontWeight.w500, color: Colors.white, overflow: TextOverflow.ellipsis, shadows: [for(int i = 0; i < 8; i++)Shadow(color: Colors.white.withOpacity(0.3), blurRadius: 3.0 * i),]);
  static final roboto30Coloredw500Neon = TextStyle(fontSize: 30.0, fontFamily: "Roboto", fontWeight: FontWeight.w500, color: const Color(0xffF58C82), overflow: TextOverflow.ellipsis, shadows: [for(int i = 0; i < 8; i++)Shadow(color: Colors.red.shade300, blurRadius: 3.0 * i),]);
  static const roboto30Coloredw500 = TextStyle(fontSize: 30.0, fontFamily: "Roboto", fontWeight: FontWeight.w500, color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto30w500 = TextStyle(fontSize: 30.0, fontFamily: "Roboto", fontWeight: FontWeight.w500, color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto25ColoredBold = TextStyle(fontSize: 25.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto25Bold = TextStyle(fontSize: 25.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto20 = TextStyle(fontSize: 20.0, fontFamily: "Roboto", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto20Bold = TextStyle(fontSize: 20.0, fontFamily: "Roboto", fontWeight: FontWeight.w700,  color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto20Colored = TextStyle(fontSize: 20.0, fontFamily: "Roboto", color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto20ColoredBold = TextStyle(fontSize: 20.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto18 = TextStyle(fontSize: 18.0, fontFamily: "Roboto", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto18Bold = TextStyle(fontSize: 18.0, fontFamily: "Roboto", fontWeight: FontWeight.w700,  color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto18ColoredBold = TextStyle(fontSize: 18.0, fontFamily: "Roboto", fontWeight: FontWeight.w700,  color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto14 = TextStyle(fontSize: 14.0, fontFamily: "Roboto", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto14Colored = TextStyle(fontSize: 14.0, fontFamily: "Roboto", color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto14Bold = TextStyle(fontSize: 14.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto14ColoredBold = TextStyle(fontSize: 14.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto12 = TextStyle(fontSize: 12.0, fontFamily: "Roboto", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto12ColoredBold = TextStyle(fontSize: 12.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const roboto10 = TextStyle(fontSize: 10.0, fontFamily: "Roboto", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const roboto10Bold = TextStyle(fontSize: 10.0, fontFamily: "Roboto", fontWeight: FontWeight.w700, color: Colors.white, overflow: TextOverflow.ellipsis);

  static const courgette20 = TextStyle(fontSize: 20.0, fontFamily: "Courgette", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const courgette20Colored = TextStyle(fontSize: 20.0, fontFamily: "Courgette", color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);

  static const courgette30 = TextStyle(fontSize: 30.0, fontFamily: "Courgette", color: Colors.white, overflow: TextOverflow.ellipsis);
  static const courgette30Colored = TextStyle(fontSize: 30.0, fontFamily: "Courgette", color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  static const courgette30Bold = TextStyle(fontSize: 30.0, fontFamily: "Courgette", fontWeight: FontWeight.w700, color: Colors.white, overflow: TextOverflow.ellipsis);
  static const courgette30ColoredBold = TextStyle(fontSize: 30.0, fontFamily: "Courgette", fontWeight: FontWeight.w700, color: Color(0xffF58C82), overflow: TextOverflow.ellipsis);
  // static const courgette20 = TextStyle(fontSize: 20.0, fontFamily: "Courgette", color: Colors.white,);
}