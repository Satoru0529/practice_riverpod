import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_01/my_widget2.dart';
import 'package:riverpod_01/my_widget3.dart';
import 'package:riverpod_01/my_widget4.dart';
import 'package:riverpod_01/proxy_widget.dart';

main() {
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}
