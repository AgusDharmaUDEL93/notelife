import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/core/common/constant/const_path.dart';
import 'package:notelife/core/router/app_router.dart';
import 'package:notelife/presentation/widgets/gap/gap.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ConstPath.APP_ICON, height: 32),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              context.push(Routes.account);
            },
            child: Icon(Icons.people),
          ),
          Gap.w(16),
        ],
      ),
      body: const Center(child: Text('This is the Task View')),
    );
  }
}
