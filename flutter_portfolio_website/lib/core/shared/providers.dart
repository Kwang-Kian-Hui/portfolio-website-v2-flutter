import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final scrollControllerProvider = StateNotifierProvider<ScrollControllerProvider, ItemScrollController>((ref) => ScrollControllerProvider());

class ScrollControllerProvider extends StateNotifier<ItemScrollController> {
  ScrollControllerProvider() : super(ItemScrollController());
  void scrollToIndex(int index) => state.scrollTo(index: index, duration: const Duration(milliseconds: 800), curve: Curves.decelerate);
}