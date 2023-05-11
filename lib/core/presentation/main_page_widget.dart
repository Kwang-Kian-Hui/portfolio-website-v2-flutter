import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/presentation/app_bar_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/about_me_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/experience_and_education/experiences_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/init_widget.dart';
import 'package:flutter_portfolio_website/core/presentation/components/project/projects_widget.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPageWidget extends ConsumerStatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  MainPageWidgetState createState() => MainPageWidgetState();
}

class MainPageWidgetState extends ConsumerState<MainPageWidget> {
  List<Widget> sectionsList = const [
    InitWidget(),
    AboutMeWidget(),
    ExperiencesWidget(),
    ProjectsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: AppStyles.mainAppColour,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 3,
        child: ScrollablePositionedList.builder(
          itemScrollController: ref.watch(scrollControllerProvider),
          itemCount: sectionsList.length,
          itemBuilder: (context, index) => sectionsList[index],
        ),
      ),
    );
  }
}
