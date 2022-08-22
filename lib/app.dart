import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/global_theme.dart';
import './screens/home/base.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return MaterialApp(
      title: 'Nobu Diary',
      theme: globalTheme,
      home: const MyHomePage(),
    );
  }
}

