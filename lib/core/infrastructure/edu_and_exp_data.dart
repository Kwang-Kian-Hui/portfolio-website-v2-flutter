import 'package:flutter_portfolio_website/core/application/education_class.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';
import 'package:flutter_portfolio_website/core/shared/const.dart';

List<ExperienceClass> expClassList = [
  ExperienceClass(
      1,
      "Synpulse8",
      "Software Engineer, Analyst",
      ConstObjects.s8Logo,
      DateTime(2022, 10, 1),
      DateTime(0, 0, 0),
      false,
      "Writing end-to-end and unit tests for web-based dashboard Flutter application."
      "\n\nInvolved in the release of v1.0"
      "\n\nQuantexa Data Engineer Certification (In progress, pending Final Assessment review)"
      "\n\nDataCamp - Data Engineer with Python Track(In progress)"
      ),
  ExperienceClass(
      2,
      "Synpulse8",
      "Software Engineer (Frontend), Intern",
      ConstObjects.s8Logo,
      DateTime(2022, 6, 1),
      DateTime(2022, 9, 30),
      false,
      "Involved in part of the life cycle through concept to the development of web-based dashboard Flutter application. "
      "\n\nGuide a small development team of fellow junior/intern developers in developing application using MVVM architecture."
      "\n\nIncorporate Figma designs into responsive functional application and provided documentation through development."
      "\n\nWork closely with backend team to establish various API endpoints to improve app performance when dealing with large volume data requests"),
  ExperienceClass(
      3,
      "Abundant Accounting",
      "IT Project Intern",
      ConstObjects.abundantAccountingLogo,
      DateTime(2016, 9, 1),
      DateTime(2017, 3, 30),
      true,
      "Develop excel spreadsheets with macros to improve efficiency in generating and editing AGM and other forms,"
          " reducing time required from half a day to 1 hour per form."
          "\n\nMeeting and presenting company's services to prospective clients."
          "\n\nConduct training on the usage of macros in spreadsheets for colleagues."),
];

List<EducationClass> eduClassList = [
  EducationClass(
      1,
      "Singapore Institute of Management (SIM-UOL)",
      "BSc (Honours) in Computer Science",
      DateTime(2019, 9, 1),
      DateTime(2022, 9, 30),
      "First Class Honours",
      "Module projects: Traffic Monitoring with OpenCV; Speech Recognition with p5.js (Meyda) and Mozilla DeepSpeech; Web and Mobile Applications; and more."
      "\n\nFinal Year Project: Time Scheduler Bot (Mobile App)."
      "\n\nRead more about my projects in the projects section.",
      ConstObjects.simLogo,
      true),
  EducationClass(
      2,
      "Ngee Ann Polytechnic",
      "Diploma in Financial Informatics",
      DateTime(2014, 4, 1),
      DateTime(2017, 4, 30),
      "Specialized in Financial Analytics",
      "Modules: Spreadsheet Engineering (Excel VBA and macros); Data Analytics with Tableau; Prediction with R; and more.",
      ConstObjects.npLogo,
      true),
];
