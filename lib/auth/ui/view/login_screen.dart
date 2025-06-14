import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/app/dependencies/locators.dart';
import 'package:finance_flow/app/design_system/components/app_text_field.dart';
import 'package:finance_flow/app/design_system/theme/app_spacing.dart';
import 'package:finance_flow/auth/data/repository/auth_repository.dart';
import 'package:finance_flow/auth/ui/cubit/login_cubit.dart';
import 'package:finance_flow/auth/ui/view/register_screen.dart';
import 'package:finance_flow/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: bloc,
      listenWhen: (previous, current) => previous.isAuthenticated != current.isAuthenticated,
      listener: _listenNavigationFlow,
      child: GestureDetector(
        onTap: () {
          final scope = FocusScope.of(context);
          if (!scope.hasPrimaryFocus) {
            scope.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            centerTitle: false,
            bottom: PreferredSize(
              preferredSize: const Size(0, AppSpacing.s),
              child: BlocSelector<LoginCubit, LoginState, bool>(
                bloc: bloc,
                selector: (state) => state.isSubmitting,
                builder: (context, isSubmitting) => isSubmitting ? const LinearProgressIndicator() : const SizedBox.shrink(),
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(AppSpacing.s, AppSpacing.s, AppSpacing.s, 0),
                      child: Column(
                        spacing: AppSpacing.s,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(AppSpacing.s),
                          Column(
                            spacing: AppSpacing.s,
                            children: [const AppLogo(size: 80), Text('Finance Flow', style: Theme.of(context).textTheme.headlineLarge)],
                          ),
                          Column(
                            spacing: AppSpacing.s,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppTextField(
                                label: 'Email',
                                onChanged: bloc.updateEmail,
                                keyboardType: TextInputType.emailAddress,
                                textCapitalization: TextCapitalization.none,
                              ),
                              BlocSelector<LoginCubit, LoginState, bool>(
                                bloc: bloc,
                                selector: (state) => state.hidePassword,
                                builder:
                                    (context, hidePassword) => AppTextField(
                                      label: 'Password',
                                      onChanged: bloc.updatePassword,
                                      obscureText: hidePassword,
                                      suffixIcon: TogglePasswordButton(onPressed: bloc.togglePasswordVisibility, value: hidePassword),
                                    ),
                              ),
                              BlocSelector<LoginCubit, LoginState, String?>(
                                bloc: bloc,
                                selector:
                                    (state) => switch (state.error) {
                                      LoginResult.userNotFound => 'User not registered.',
                                      LoginResult.networkError => 'Unable to login.',
                                      _ => null,
                                    },
                                builder:
                                    (context, errorMessage) =>
                                        errorMessage != null ? Text(errorMessage, textAlign: TextAlign.start) : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              BlocSelector<LoginCubit, LoginState, bool>(
                                bloc: bloc,
                                selector: (state) => state.canSubmit,
                                builder: (context, canSubmit) {
                                  return FilledButton(onPressed: canSubmit ? bloc.login : null, child: const Text('Login'));
                                },
                              ),
                              BlocSelector<LoginCubit, LoginState, bool>(
                                bloc: bloc,
                                selector: (state) => state.isSubmitting,
                                builder: (context, isSubmitting) {
                                  return TextButton(
                                    onPressed: isSubmitting ? null : () => context.pushNamed(RegisterScreen.routeName),
                                    child: const Text('Create new Account', textAlign: TextAlign.start),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _listenNavigationFlow(BuildContext context, LoginState state) {
    if (state.isAuthenticated) {
      context.goNamed(DashboardScreen.routeName);
    }
  }
}
