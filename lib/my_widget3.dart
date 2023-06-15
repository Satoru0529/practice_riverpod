
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_01/s3.dart';

class MyWidget3 extends ConsumerWidget {
  const MyWidget3({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // S3 watch
    final s3 = ref.watch(s3NotifierProvider);
    // S3 AsyncValue
    final Text s3Text = s3.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (String d) => Text(d),
    );
    // S3 ボタン
    final s3Button = ElevatedButton(
      onPressed: () {
        // S3 ノティファイアを呼ぶ
        final notifier = ref.read(s3NotifierProvider.notifier);
        // S3 データを変更
        notifier.updateState();
      },
      child: const Text('変更'),
    );

    // 縦に並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        s3Text,
        s3Button,
      ],
    );
  }
}