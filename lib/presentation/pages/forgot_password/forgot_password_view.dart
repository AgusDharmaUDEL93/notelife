import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_bloc.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_event.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_state.dart';
import 'package:notelife/presentation/widgets/gap/gap.dart';

import '../../../utils/validators.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _formKey.currentState?.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
        if (state.isSuccess) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Forgot Password Successful Sended"),
              content: const Text(
                "We have been seen forgot password to the email",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    context.pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Text(
                      "Forgot Password",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Gap.h(4),
                  SizedBox(
                    width: size.width,
                    child: Text(
                      "Kindly input your email to initiate the password reset. We'll promptly send you a link to facilitate the reset process.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Gap.h(20),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      return Validators.email(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap.h(40),
                  SizedBox(
                    width: size.width,
                    child: FilledButton(
                      onPressed: () {
                        if (!(_formKey.currentState?.validate() ?? false)) {
                          return;
                        }
                        context.read<ForgotPasswordBloc>().add(
                          OnSendForgotPasswordConfirmation(
                            email: _emailController.text,
                          ),
                        );
                      },
                      child: Text("Send"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
