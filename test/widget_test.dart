// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:santa_test/children_notifier.dart';
import 'package:santa_test/model/user_model.dart';

void main() {
  test('Add child to the list', () {
    final container = ProviderContainer();
    final notifier = container.read(childrenProvider.notifier);

    notifier.addChild(Child(name: 'Ronit', country: 'India', isNice: false));

    final children = container.read(childrenProvider);

    expect(children.length, 1);
    expect(children[0].name, 'Ronit');
    expect(children[0].country, 'India');
    expect(children[0].isNice, false);
  });

  test('Update child\'s status', () {
    final container = ProviderContainer();
    final notifier = container.read(childrenProvider.notifier);
    final child = Child(name: 'Ronit', country: 'India', isNice: false);
    notifier.addChild(child);

    notifier.updateNiceStatus(child, true);

    final children = container.read(childrenProvider);

    expect(children[0].isNice, true);
  });
}
