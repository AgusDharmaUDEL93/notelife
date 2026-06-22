import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:notelife/core/common/constant/const_path.dart';
import 'package:notelife/core/router/app_router.dart';
import 'package:notelife/core/theme/basic_theme.dart';
import 'package:notelife/di/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/common/constant/constant.dart';

void main() async {
  injection();

  await dotenv.load(fileName: ConstPath.ENV_PATH);

  await Supabase.initialize(
    url: Constant.SUPABASE_URL,
    anonKey: Constant.SUPABASE_ANON_KEY,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: BasicTheme(TextTheme()).light(),
      darkTheme: BasicTheme(TextTheme()).dark(),
    );
  }
}
