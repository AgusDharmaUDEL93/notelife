import 'package:flutter/material.dart';

class PomodoroView extends StatelessWidget {
  const PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pomodoro View')),
      body: const Center(child: Text('This is the Pomodoro View')),
    );
  }
}
