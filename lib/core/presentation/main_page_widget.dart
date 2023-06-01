import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/app_bar_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/presentation/app_bar_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/about_me/about_me_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/experiences_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/init_page/init_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/projects_widget.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPageWidget extends ConsumerStatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  MainPageWidgetState createState() => MainPageWidgetState();
}

class MainPageWidgetState extends ConsumerState<MainPageWidget>
    with TickerProviderStateMixin {
  List<Widget> sectionsList = const [
    InitWidget(),
    AboutMeWidget(),
    ExperiencesWidget(),
    ProjectsWidget(),
  ];

  @override
  void initState() {
    // initialise animation controllers for radial menu in "experiences" section to avoid reinitialising controller on resizing
    ref.read(expRadialMenuAnimationController.notifier).change(
        AnimationController(
            duration: const Duration(milliseconds: 900), vsync: this));
    ref.read(eduRadialMenuAnimationController.notifier).change(
        AnimationController(
            duration: const Duration(milliseconds: 900), vsync: this));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: AppStyles.mainAppColour,
      body: Container(
        constraints: const BoxConstraints(
          minWidth: 480,
          minHeight: 2160,
        ),
        height: MediaQuery.of(context).size.height * 3,
        child: Stack(
          children: [
            ScrollablePositionedList.builder(
              itemScrollController: ref.watch(scrollControllerProvider),
              itemCount: sectionsList.length,
              itemBuilder: (context, index) => sectionsList[index],
            ),
            Container(
              height: 107,
              margin: const EdgeInsets.only(top: 27, left: 35, right: 35),
              child: const AppBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
