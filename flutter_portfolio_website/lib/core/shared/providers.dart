import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final scrollControllerProvider = StateNotifierProvider<ScrollControllerProvider, ItemScrollController>((ref) => ScrollControllerProvider());
final selectedExperienceIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));
final selectedEducationIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));
final selectedProjectIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(3));

final selectedTechStackIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(4));
final selectedLanguagesIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(5));
final selectedProjectTypeIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(4));

final selectedProjectDetailIndexProvider = StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));

final selectedProjectFiltersProvider = StateNotifierProvider<StringListProvider, List<String>>((ref) => StringListProvider([]));

class ScrollControllerProvider extends StateNotifier<ItemScrollController> {
  ScrollControllerProvider() : super(ItemScrollController());
  void scrollToIndex(int index) => state.scrollTo(index: index, duration: const Duration(milliseconds: 800), curve: Curves.decelerate);
}

class IntegerProvider extends StateNotifier<int> {
  IntegerProvider(int initial) : super(initial);
  void change(int index) => state = index;
}

class StringListProvider extends StateNotifier<List<String>> {
  StringListProvider(List<String> initial) : super(initial);
  void addElement(String newElement) => state.add(newElement);
  void removeElement(String removeElement) => state.remove(removeElement);
  void resetList() => state.replaceRange(0, state.length, []);
}