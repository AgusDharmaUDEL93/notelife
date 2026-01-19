import 'package:flutter/material.dart';
import 'package:notelife/core/router/app_router.dart';
import 'package:notelife/di/injection.dart';

void main() {
  injection();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRouter().router);
  }
}
