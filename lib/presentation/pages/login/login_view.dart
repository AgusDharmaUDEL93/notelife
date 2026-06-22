import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/core/common/constant/const_path.dart';
import 'package:notelife/core/router/app_router.dart';
import 'package:notelife/presentation/pages/login/login_event.dart';
import 'package:notelife/presentation/widgets/gap/gap.dart';
import 'package:notelife/utils/validators.dart';

import 'login_bloc.dart';
import 'login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocListener<LoginBloc, LoginState>(
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
              title: const Text("Login Successful"),
              content: const Text("You have successfully logged in."),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    context.go(Routes.task);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Image.asset(ConstPath.LOGIN_ILLUSTRATION),
                        Gap.h(20),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Gap.h(20),
                        TextFormField(
                          controller: _emailController,
                          validator: Validators.email,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Gap.h(16),
                        TextFormField(
                          controller: _passwordController,
                          validator: Validators.password,
                          obscureText: !state.isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: InkWell(
                              customBorder: CircleBorder(),
                              child: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onTap: () {
                                context.read<LoginBloc>().add(
                                  OnTogglePasswordVisibility(),
                                );
                              },
                            ),
                          ),
                        ),
                        Gap.h(16),
                        SizedBox(
                          width: size.width,
                          child: InkWell(
                            onTap: () {
                              context.push(Routes.forgotPassword);
                            },
                            child: Text("Forgot Password?"),
                          ),
                        ),
                        Gap.h(64),
                        SizedBox(
                          width: size.width,
                          child: FilledButton(
                            onPressed: () {
                              if (!(_formKey.currentState?.validate() ??
                                  false)) {
                                return;
                              }
                              context.read<LoginBloc>().add(
                                OnLoginButtonPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            child: Text("Login"),
                          ),
                        ),
                        Gap.h(8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    context.push(Routes.register);
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
