import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/user_model.dart';

class ChildrenNotifier extends StateNotifier<List<Child>> {
  ChildrenNotifier() : super([]);

  void addChild(Child child) {
    state = [...state, child];
  }

  void updateNiceStatus(Child child, bool isNice) {
    final int index = state.indexOf(child);
    if (index != -1) {
      final updatedChild = child.copyWith(isNice: isNice);
      state = List.from(state)..[index] = updatedChild;
    }
  }
}

final childrenProvider = StateNotifierProvider<ChildrenNotifier, List<Child>>(
  (ref) => ChildrenNotifier(),
);
