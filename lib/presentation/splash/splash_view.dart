import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/core/common/constant/const_path.dart';
import 'package:notelife/core/router/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    // Delay navigasi
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go(Routes.task);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(ConstPath.APP_ICON, width: 80, height: 80),
          ),
        ),
      ),
    );
  }
}
