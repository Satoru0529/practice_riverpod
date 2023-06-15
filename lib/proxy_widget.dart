import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_01/proxy.dart';

// ウィジェット
class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proxy = ref.watch(proxyProvider);
    final p1 = ref.watch(p2NotifierProvider);

    final button = FloatingActionButton(
      onPressed: () {
        // P1 を 変更する
        final notifier = ref.read(p1NotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Icon(Icons.refresh),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(proxy),
        button,
        Text(p1),
      ],
    );
  }
}