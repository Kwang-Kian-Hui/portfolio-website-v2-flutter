import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/shared/providers.dart';
import 'package:flutter_portfolio_website/core/shared/widget_builders.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/infrastructure/projects_data.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectDetailWidget extends ConsumerWidget {
  const ProjectDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController textScrollController = ScrollController();

    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Wrap(
              children: buildCategoryWidgetList(
                projectList[ref.watch(selectedProjectIndexProvider)].categories,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: ResponsiveWrapper.of(context)
                      .isSmallerThan("BP-FOR-INIT-PAGE-TEXT-2")
                  ? MediaQuery.of(context).size.height * 0.3
                  : MediaQuery.of(context).size.height * 0.4,
            ),
            child: projectList[ref.watch(selectedProjectIndexProvider)]
                    .listOfImagePaths
                    .isEmpty
                ? const Image(
                    image: AssetImage(
                      "assets/images/img_placeholder.png",
                    ),
                  )
                : CarouselSlider(
                    items: projectList[ref.watch(selectedProjectIndexProvider)]
                        .listOfImagePaths
                        .map((imagePath) {
                      return Builder(builder: (BuildContext context) {
                        return Image(
                          image: AssetImage(imagePath),
                          errorBuilder: (context, index, _) => const Image(
                            image: AssetImage(
                              "assets/images/img_placeholder.png",
                            ),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll:
                          projectList[ref.watch(selectedProjectIndexProvider)]
                                      .listOfImagePaths
                                      .length >
                                  1
                              ? true
                              : false,
                      autoPlay:
                          projectList[ref.watch(selectedProjectIndexProvider)]
                                      .listOfImagePaths
                                      .length >
                                  1
                              ? true
                              : false,
                      enlargeCenterPage: true,
                      aspectRatio: 2,
                    ),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.mobileBorderPadding),
              child: Scrollbar(
                thumbVisibility: true,
                controller: textScrollController,
                child: SingleChildScrollView(
                  controller: textScrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppStyles.wordSpacingPadding,
                        child: SelectableText(
                            "Date: ${DateFormat('MMM yyyy').format(projectList[ref.watch(selectedProjectIndexProvider)].date)}"),
                      ),
                      projectList[ref.watch(selectedProjectIndexProvider)]
                                  .githubLink !=
                              ""
                          ? Padding(
                              padding: AppStyles.wordSpacingPadding,
                              child: SelectableText(
                                  "Github: ${projectList[ref.watch(selectedProjectIndexProvider)].githubLink}"),
                            )
                          : const SizedBox(),
                      projectList[ref.watch(selectedProjectIndexProvider)]
                                  .webLink !=
                              ""
                          ? Padding(
                              padding: AppStyles.wordSpacingPadding,
                              child: SelectableText(
                                  "Link: ${projectList[ref.watch(selectedProjectIndexProvider)].webLink}"),
                            )
                          : const SizedBox(),
                      projectList[ref.watch(selectedProjectIndexProvider)]
                                  .appLink !=
                              ""
                          ? Padding(
                              padding: AppStyles.wordSpacingPadding,
                              child: SelectableText(
                                  "Playstore: ${projectList[ref.watch(selectedProjectIndexProvider)].appLink}"),
                            )
                          : const SizedBox(),
                      projectList[ref.watch(selectedProjectIndexProvider)]
                                  .demoLink !=
                              ""
                          ? Padding(
                              padding: AppStyles.wordSpacingPadding,
                              child: SelectableText(
                                  "Demo: ${projectList[ref.watch(selectedProjectIndexProvider)].demoLink}"),
                            )
                          : const SizedBox(),
                      projectList[ref.watch(selectedProjectIndexProvider)]
                                  .prototypeLink1 !=
                              ""
                          ? Padding(
                              padding: AppStyles.wordSpacingPadding,
                              child: SelectableText(
                                  "Lo-Fi Prototype: ${projectList[ref.watch(selectedProjectIndexProvider)].prototypeLink1}"),
                            )
                          : const SizedBox(),
                      projectList[ref.watch(selectedProjectIndexProvider)]
                                  .prototypeLink2 !=
                              ""
                          ? Padding(
                              padding: AppStyles.wordSpacingPadding,
                              child: SelectableText(
                                  "Hi-Fi Prototype: ${projectList[ref.watch(selectedProjectIndexProvider)].prototypeLink2}"),
                            )
                          : const SizedBox(),
                      SelectableText(
                          projectList[ref.watch(selectedProjectIndexProvider)]
                              .description),
                      SelectableText(
                          projectList[ref.watch(selectedProjectIndexProvider)]
                                  .additionalInfo ??
                              ""),
                      SelectableText(
                          projectList[ref.watch(selectedProjectIndexProvider)]
                                  .futureWork ??
                              ""),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
