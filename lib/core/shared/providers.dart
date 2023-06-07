import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final scrollControllerProvider =
    StateNotifierProvider<ScrollControllerProvider, ItemScrollController>(
        (ref) => ScrollControllerProvider());
final selectedExperienceIndexProvider =
    StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));
final selectedEducationIndexProvider =
    StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));
final viewingProjectIndex =
    StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));    
final selectedProjectIndexProvider =
    StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(-1));

final selectedProjectFilterProvider =
    StateNotifierProvider<StringProvider, String>((ref) => StringProvider("All"));

// final selectedTechStackIndexProvider =
//     StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(-1));
// final selectedLanguagesIndexProvider =
//     StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(-1));
// final selectedProjectTypeIndexProvider =
//     StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(-1));

final expRadialMenuAnimationController =
    StateNotifierProvider<AnimationControllerProvider, AnimationController?>(
        (ref) => AnimationControllerProvider());

final eduRadialMenuAnimationController =
    StateNotifierProvider<AnimationControllerProvider, AnimationController?>(
        (ref) => AnimationControllerProvider());

final selectedProjectDetailIndexProvider =
    StateNotifierProvider<IntegerProvider, int>((ref) => IntegerProvider(0));

final selectedProjectFiltersProvider =
    StateNotifierProvider<StringListProvider, List<String>>(
        (ref) => StringListProvider([]));

class ScrollControllerProvider extends StateNotifier<ItemScrollController> {
  ScrollControllerProvider() : super(ItemScrollController());
  void scrollToIndex(int index) => state.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.decelerate);
}

class IntegerProvider extends StateNotifier<int> {
  IntegerProvider(int initial) : super(initial);
  void change(int index) => state = index;
}

class StringProvider extends StateNotifier<String> {
  StringProvider(String initial) : super(initial);
  void change(String newString) => state = newString;
}

class AnimationControllerProvider extends StateNotifier<AnimationController?> {
  AnimationControllerProvider() : super(null);
  void forward() {
    if(state != null){
      state!.forward();
    }
  }
  void reverse() {
    if(state != null){
      state!.reverse();
    }
  }
  void change(AnimationController controller) => state = controller;
}

class StringListProvider extends StateNotifier<List<String>> {
  StringListProvider(List<String> initial) : super(initial);
  void addElement(String newElement) {
    state = [newElement];
  }

  void resetList() {
    state = [];
  }
}
