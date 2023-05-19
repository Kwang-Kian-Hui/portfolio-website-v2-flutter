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
      "Led a team of junior/intern frontend developers in designing and  building a Flutter web application using MVVM architecture."
      "\n\nCollaborated effectively with cross-functional stakeholders, resulting in a clear understanding of project requirements and smooth delivery of solutions based on Figma designs."
      "\n\nPlayed a pivotal role in test automation efforts, working closely with the senior test engineer to implement comprehensive end-to-end tests(integration_test package) that enhanced overall product quality, achieving 80% code coverage."
      "\n\nPlayed a key role in the release of v1.0, contributing to 66% of the total frontend tasks, demonstrating efficiency and proficiency in meeting project milestones."
      "\n\nDemonstrated commitment to continuous learning and professional growth by attaining the Quantexa Certified Data Engineer certification."
      ),
  ExperienceClass(
      2,
      "Synpulse8",
      "Software Engineer (Frontend), Intern",
      ConstObjects.s8Logo,
      DateTime(2022, 6, 1),
      DateTime(2022, 9, 30),
      false,
      "Involved in SDLC through concept to the development of a responsive web-based dashboard Flutter application."
      "\n\nGuide a small development team of fellow junior/intern developers in developing application using MVVM architecture."
      "\n\nTranslated Figma designs into a responsive and functional application, ensuring alignment with design specifications and providing documentation throughout the development process."
      "\n\nCollaborated closely with the backend team to establish various API endpoints."),
  ExperienceClass(
      3,
      "Abundant Accounting",
      "IT Project Intern",
      ConstObjects.abundantAccountingLogo,
      DateTime(2016, 9, 1),
      DateTime(2017, 3, 30),
      true,
      "Implemented Excel spreadsheets with macros, resulting in a substantial reduction in time spent (from half a day to 1 hour per form) on generating and editing AGM and other forms, significantly improving workflow efficiency."
      "\n\nDelivered engaging meetings and presentations to prospective clients, effectively highlighting the company's services and generating interest, contributing to potential business opportunities."
      "\n\nConducted comprehensive training sessions on macros in spreadsheets, equipping colleagues with valuable skills that improved their effectiveness in handling data and streamlining processes."),
];

List<EducationClass> eduClassList = [
  EducationClass(
      1,
      "Singapore Institute of Management - University of London (SIM-UOL)",
      "BSc (Honours) in Computer Science",
      DateTime(2019, 9, 1),
      DateTime(2022, 9, 30),
      "First Class Honours",
      "Module projects: Traffic Monitoring with OpenCV; Speech Recognition with p5.js (Meyda) and Mozilla DeepSpeech; Web and Mobile Applications; and more."
      "\n\nFinal Year Project: Automatic Time Scheduler (Mobile App)."
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
