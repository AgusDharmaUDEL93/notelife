import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/core/common/constant/const_path.dart';
import 'package:notelife/presentation/pages/register/register_event.dart';
import 'package:notelife/utils/validators.dart';

import '../../widgets/gap/gap.dart';
import 'register_bloc.dart';
import 'register_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _formKey.currentState?.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocListener<RegisterBloc, RegisterState>(
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
              title: const Text("Registration Successful"),
              content: const Text(
                "Your account has been created successfully. Please login to continue.",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop(); // close dialog
                    context.pop(); // go back to login page
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            appBar: AppBar(),
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
                        Image.asset(ConstPath.REGISTER_ILLUSTRATION),
                        Gap.h(20),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            "Register",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        Gap.h(20),
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            return Validators.notEmpty(
                              value,
                              fieldName: "Name",
                            );
                          },
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Gap.h(16),
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
                          obscureText: !state.isPasswordVisible,
                          validator: Validators.password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: InkWell(
                              onTap: () {
                                context.read<RegisterBloc>().add(
                                  OnTogglePasswordVisibility(),
                                );
                              },
                              child: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        Gap.h(16),
                        TextFormField(
                          controller: _confirmPasswordController,
                          validator: (value) {
                            return Validators.confirmPassword(
                              password: _passwordController.text,
                              confirmPassword: value,
                            );
                          },
                          obscureText: !state.isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                            suffixIcon: InkWell(
                              onTap: () {
                                context.read<RegisterBloc>().add(
                                  OnToggleConfirmPasswordVisibility(),
                                );
                              },
                              child: Icon(
                                state.isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
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
                              context.read<RegisterBloc>().add(
                                OnRegisterButtonPressed(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                ),
                              );
                            },
                            child: Text("Register"),
                          ),
                        ),
                        Gap.h(8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    "Sign In",
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
