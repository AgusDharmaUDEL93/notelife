import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/core/router/app_router.dart';
import 'package:notelife/presentation/pages/account/account_event.dart';
import 'package:notelife/presentation/pages/account/account_state.dart';
import 'package:notelife/presentation/widgets/gap/gap.dart';

import 'account_bloc.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    super.initState();

    context.read<AccountBloc>().add(OnGetProfileData());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }

        if (state.isSuccessLogout) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Logout Success"),
              content: const Text(
                "You have been success logout, please login again",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.go(Routes.login);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<AccountBloc, AccountState>(
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
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Account",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(radius: 60),
                    ),
                    Gap.h(16),
                    Text(
                      state.profile?.name ?? "-",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(state.profile?.email ?? "-"),
                    Gap.h(32),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Expanded(child: Text("Account Setting")),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 0),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Expanded(child: Text("Change Password")),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                    Gap.h(32),
                    SizedBox(
                      width: size.width,
                      child: FilledButton(
                        onPressed: () {
                          context.read<AccountBloc>().add(OnLogoutAccount());
                        },
                        child: Text("Logout"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
