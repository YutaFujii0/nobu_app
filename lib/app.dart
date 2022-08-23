import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '/styles/global_theme.dart';
import './screens/home/base.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(global_theme_provider);

    return MaterialApp(
      title: 'Nobu Diary',
      theme: theme.globalTheme,
      home: const MyHomePage(),
    );
  }
}

