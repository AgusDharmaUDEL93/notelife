import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/core/router/app_router.dart';

class WrapperView extends StatelessWidget {
  final Widget child;

  const WrapperView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location.startsWith(Routes.link)) currentIndex = 1;
    if (location.startsWith(Routes.pomodoro)) currentIndex = 2;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) context.go(Routes.task);
          if (index == 1) context.go(Routes.link);
          if (index == 2) context.go(Routes.pomodoro);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2),
            label: "Task",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.link), label: "Link"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Pomodoro"),
        ],
      ),
    );
  }
}
