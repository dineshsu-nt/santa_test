import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for managing 'Nice' or 'Naughty' status
class NaughtyNiceNotifier extends StateNotifier<bool> {
  NaughtyNiceNotifier() : super(true); // true: Nice, false: Naughty

  void setNaughtyNice(bool value) {
    state = value;
  }
}

// Provider for 'NaughtyNiceNotifier'
final naughtyNiceProvider = StateNotifierProvider<NaughtyNiceNotifier, bool>(
  (ref) => NaughtyNiceNotifier(),
);
// Provider for selected country
final selectedCountryProvider = StateProvider<String>((ref) => "India");
