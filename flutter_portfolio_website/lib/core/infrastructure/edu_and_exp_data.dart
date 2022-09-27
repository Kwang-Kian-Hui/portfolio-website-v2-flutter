import 'package:flutter_portfolio_website/core/application/education_class.dart';
import 'package:flutter_portfolio_website/core/application/experience_class.dart';

List<ExperienceClass> expClassList = [
  ExperienceClass(
      1,
      "Synpulse8",
      "Software Engineer Intern (Frontend Intern)\nOfficially (Data Intern)",
      'assets/images/synpulse8_logo.png',
      DateTime(2022, 6, 1),
      DateTime(2022, 9, 30),
      false,
      ''' 
        - Involved in entire life cycle through concept to the development of web-based dashboard Flutter application
        (Still in development).
        \n- Guide a small development team of junior/intern developers to develop application using MVVM 
        architecture.\n- Incorporate Figma designs into responsive functional application and provided documentation 
        through development.
      '''),
  ExperienceClass(
      2,
      "Abundant Accounting Pte Ltd",
      "IT Project Intern",
      'assets/images/abundant_accounting_logo.png',
      DateTime(2016, 9, 1),
      DateTime(2017, 3, 30),
      true,
      '''
        - Develop excel spreadsheets with macros to improve efficiency in generating and editing AGM and other forms, 
        reducing time required from half a day to 1 hour per form\n- Meeting and presenting company's services 
        to prospective clients\n- Conduct training on using macros of various spreadsheets for colleagues
      '''),
];

List<EducationClass> eduClassList = [
  EducationClass(1, "Singapore Institute of Management (SIM-UOL)",
      "BSc (Honours) in Computer Science", 'assets/images/sim_logo.png', true),
  EducationClass(2, "Ngee Ann Polytechnic", "Diploma in Financial Informatics",
      'assets/images/np_logo.png', true),
];
