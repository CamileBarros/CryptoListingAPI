import 'package:flutter_riverpod/flutter_riverpod.dart';

final visible = StateProvider<bool>((ref) {
  return true;
});

final valueWallet = StateProvider<int>((ref) {
  return 5000;
});
