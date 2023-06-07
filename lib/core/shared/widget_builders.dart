import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/presentation/const/styles.dart';

List<Widget> buildCategoryWidgetList(List<String> categories) {
    List<Widget> widgetList = [];
    for (String category in categories) {
      var colorList = AppStyles.categoriesColorMapping[category];
      widgetList.add(Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: colorList != null ? colorList[0] : const Color(0xff000000),
          borderRadius: BorderRadius.circular(AppStyles.containerBorderRadius),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: colorList != null ? colorList[1] : const Color(0xffffffff),
          ),
        ),
      ));
    }
    return widgetList;
  }