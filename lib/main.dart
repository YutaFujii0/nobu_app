import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/app.dart';
import '/models/global_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GlobalTheme>(
          create: (context) => GlobalTheme(),
        )
      ],
      child: const MyApp(),
    )
  );
}
