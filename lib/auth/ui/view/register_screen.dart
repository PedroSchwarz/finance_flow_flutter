import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/auth/data/repository/auth_repository.dart';
import 'package:finance_flow/auth/ui/cubit/register_cubit.dart';
import 'package:finance_flow/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final bloc = getIt<RegisterCubit>();
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<RegisterCubit, RegisterState>(
      bloc: bloc,
      listenWhen: (previous, current) => previous.isAuthenticated != current.isAuthenticated,
      listener: _listenNavigationFlow,
      child: BlocListener<RegisterCubit, RegisterState>(
        bloc: bloc,
        listenWhen: (previous, current) => previous.step != current.step,
        listener: _listenRegisterStep,
        child: GestureDetector(
          onTap: () {
            final scope = FocusScope.of(context);
            if (!scope.hasPrimaryFocus) {
              scope.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
              leading: BlocSelector<RegisterCubit, RegisterState, int>(
                bloc: bloc,
                selector: (state) => state.step,
                builder: (context, step) {
                  if (step == 1) {
                    return BackButton(onPressed: bloc.previousStep);
                  }
                  return const BackButton();
                },
              ),
              centerTitle: false,
              bottom: PreferredSize(
                preferredSize: const Size(0, AppSpacing.s),
                child: BlocSelector<RegisterCubit, RegisterState, bool>(
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
                  return PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(AppSpacing.s, AppSpacing.s, AppSpacing.s, 0),
                            child: Column(
                              spacing: AppSpacing.s,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Personal Details', style: theme.textTheme.headlineSmall),
                                Column(
                                  spacing: AppSpacing.s,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    BlocSelector<RegisterCubit, RegisterState, String>(
                                      bloc: bloc,
                                      selector: (state) => state.firstName,
                                      builder: (context, firstName) {
                                        return AppTextField(
                                          label: 'First Name',
                                          initialValue: firstName,
                                          onChanged: bloc.updateFirstName,
                                          textCapitalization: TextCapitalization.words,
                                        );
                                      },
                                    ),
                                    BlocSelector<RegisterCubit, RegisterState, String>(
                                      bloc: bloc,
                                      selector: (state) => state.lastName,
                                      builder: (context, lastName) {
                                        return AppTextField(
                                          label: 'Last Name',
                                          initialValue: lastName,
                                          onChanged: bloc.updateLastName,
                                          textCapitalization: TextCapitalization.words,
                                        );
                                      },
                                    ),
                                    BlocBuilder<RegisterCubit, RegisterState>(
                                      bloc: bloc,
                                      buildWhen:
                                          (previous, current) =>
                                              previous.emailError != current.emailError || //
                                              previous.email != current.email,
                                      builder:
                                          (context, state) => AppTextField(
                                            label: 'Email',
                                            initialValue: state.email,
                                            onChanged: bloc.updateEmail,
                                            keyboardType: TextInputType.emailAddress,
                                            error: state.emailError ? 'Invalid email.' : null,
                                            textCapitalization: TextCapitalization.none,
                                          ),
                                    ),
                                    BlocBuilder<RegisterCubit, RegisterState>(
                                      bloc: bloc,
                                      builder:
                                          (context, state) => Column(
                                            spacing: AppSpacing.s,
                                            children: [
                                              AppTextField(
                                                label: 'Password',
                                                initialValue: state.password,
                                                onChanged: bloc.updatePassword,
                                                obscureText: state.hidePassword,
                                                error: state.passwordError ? 'Invalid and/or weak password.' : null,
                                                suffixIcon: TogglePasswordButton(onPressed: bloc.togglePasswordVisibility, value: state.hidePassword),
                                              ),
                                              AnimatedLinearProgressIndicator(value: state.passwordStrength, color: state.passwordStrengthColor),
                                              AppTextField(
                                                label: 'Confirm Password',
                                                initialValue: state.confirmPassword,
                                                onChanged: bloc.updateConfirmPassword,
                                                obscureText: state.hidePassword,
                                                error: state.confirmPasswordError ? 'Passwords do not match.' : null,
                                                suffixIcon: TogglePasswordButton(onPressed: bloc.togglePasswordVisibility, value: state.hidePassword),
                                              ),
                                            ],
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    BlocSelector<RegisterCubit, RegisterState, bool>(
                                      bloc: bloc,
                                      selector: (state) => state.canSubmit,
                                      builder: (context, canSubmit) {
                                        return FilledButton(onPressed: canSubmit ? bloc.nextStep : null, child: const Text('Next'));
                                      },
                                    ),
                                    BlocSelector<RegisterCubit, RegisterState, bool>(
                                      bloc: bloc,
                                      selector: (state) => state.isSubmitting,
                                      builder: (context, isSubmitting) {
                                        return TextButton(
                                          onPressed: isSubmitting ? null : context.pop,
                                          child: const Text('Access Account', textAlign: TextAlign.start),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Page 2
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(AppSpacing.s, AppSpacing.s, AppSpacing.s, 0),
                            child: Column(
                              spacing: AppSpacing.s,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Financial Details', style: theme.textTheme.headlineSmall),
                                Column(
                                  spacing: AppSpacing.s,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    BlocSelector<RegisterCubit, RegisterState, double>(
                                      bloc: bloc,
                                      selector: (state) => state.initialBalance,
                                      builder: (context, initialBalance) {
                                        return AppTextField(
                                          label: 'Initial Balance',
                                          currencyValue: initialBalance,
                                          textStyle: theme.textTheme.displaySmall,
                                          labelStyle: theme.textTheme.headlineLarge,
                                          inputFormatters: [CurrencyInputFormatter()],
                                          fillColor: Colors.transparent,
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: theme.colorScheme.primary),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(AppSpacing.xs),
                                              topRight: Radius.circular(AppSpacing.xs),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            bloc.updateInitialBalance(CurrencyInputFormatter.parseFormatted(value));
                                          },
                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                        );
                                      },
                                    ),
                                    BlocSelector<RegisterCubit, RegisterState, String?>(
                                      bloc: bloc,
                                      selector:
                                          (state) => switch (state.error) {
                                            RegisterResult.emailConflict => 'Email already in use.',
                                            RegisterResult.networkError => 'Unable to create account.',
                                            _ => null,
                                          },
                                      builder: (context, errorMessage) => errorMessage != null ? Text(errorMessage) : const SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                                BlocSelector<RegisterCubit, RegisterState, bool>(
                                  bloc: bloc,
                                  selector: (state) => state.canSubmit,
                                  builder: (context, canSubmit) {
                                    return FilledButton(onPressed: canSubmit ? bloc.register : null, child: const Text('Register'));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenNavigationFlow(BuildContext context, RegisterState state) {
    if (state.isAuthenticated) {
      context.goNamed(DashboardScreen.routeName);
    }
  }

  void _listenRegisterStep(BuildContext context, RegisterState state) {
    _pageController.animateToPage(state.step, duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
  }
}
