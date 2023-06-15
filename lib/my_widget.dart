

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_01/s1.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1 = ref.watch(s1NotifierProvider);

    // S1 listen
    ref.listen(
      s1NotifierProvider,
          (oldState, newState) {
        // スナックバーを表示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('S1データが変更されました'),
          ),
        );
      },
    );

    final Button = ElevatedButton(
      onPressed: () {
        // S1 ノティファイアを呼ぶ
        final notifier = ref.read(s1NotifierProvider.notifier);
        // S1 データを変更
        notifier.updateState();
      },
      child: const Text('+1'),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("$s1"),
        Button,
      ],
    );
  }
}
