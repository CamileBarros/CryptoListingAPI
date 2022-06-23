import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonChangeChart extends ConsumerWidget {
  const ButtonChangeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool show = ref.watch(visible);
    return Padding(
      padding: const EdgeInsets.only(left: 107),
      child: SizedBox(
        height: 35,
        width: 35,
        child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              onPressed: () => ref.read(visible.state).state = !show,
              icon: show
                  ? const Icon(Icons.bar_chart)
                  : const Icon(Icons.show_chart)),
        ),
      ),
    );
  }
}
