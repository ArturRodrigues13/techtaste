import 'package:flutter/material.dart';
import 'package:imersao_mobile_alura/_util/app_theme.dart';
import 'package:imersao_mobile_alura/ui/splash/splash_screen.dart';
import 'package:imersao_mobile_alura/_util/desktop_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante a inicialização do Flutter
  await initDesktop();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen());
  }
}
