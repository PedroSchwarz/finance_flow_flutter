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
            body: Stack(
              children: [
                const AnimatedBackground(),
                SafeArea(
                  top: false,
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      CustomScrollView(
                        slivers: [
                          BlocBuilder<RegisterCubit, RegisterState>(
                            bloc: bloc,
                            buildWhen:
                                (previous, current) =>
                                    previous.step != current.step || //
                                    previous.isSubmitting != current.isSubmitting,
                            builder: (context, state) {
                              return AppSliverAppBar(
                                title: 'Register',
                                isLoading: state.isSubmitting,
                                leading: switch (state.step) {
                                  1 => BackButton(onPressed: bloc.previousStep),
                                  _ => const BackButton(),
                                },
                              );
                            },
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(AppSpacing.s),
                              child: Column(
                                spacing: AppSpacing.l,
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
                                          return LiquidGlassCard(
                                            borderRadius: BorderRadius.circular(AppSpacing.xs),
                                            isTransparent: true,
                                            child: AppTextField(
                                              label: 'First Name',
                                              initialValue: firstName,
                                              onChanged: bloc.updateFirstName,
                                              textCapitalization: TextCapitalization.words,
                                            ),
                                          );
                                        },
                                      ),
                                      BlocSelector<RegisterCubit, RegisterState, String>(
                                        bloc: bloc,
                                        selector: (state) => state.lastName,
                                        builder: (context, lastName) {
                                          return LiquidGlassCard(
                                            borderRadius: BorderRadius.circular(AppSpacing.xs),
                                            isTransparent: true,
                                            child: AppTextField(
                                              label: 'Last Name',
                                              initialValue: lastName,
                                              onChanged: bloc.updateLastName,
                                              textCapitalization: TextCapitalization.words,
                                            ),
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
                                            (context, state) => LiquidGlassCard(
                                              borderRadius: BorderRadius.circular(AppSpacing.xs),
                                              isTransparent: true,
                                              child: AppTextField(
                                                label: 'Email',
                                                initialValue: state.email,
                                                onChanged: bloc.updateEmail,
                                                keyboardType: TextInputType.emailAddress,
                                                error: state.emailError ? 'Invalid email.' : null,
                                                textCapitalization: TextCapitalization.none,
                                              ),
                                            ),
                                      ),
                                      BlocBuilder<RegisterCubit, RegisterState>(
                                        bloc: bloc,
                                        builder:
                                            (context, state) => Column(
                                              spacing: AppSpacing.s,
                                              children: [
                                                LiquidGlassCard(
                                                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                                                  isTransparent: true,
                                                  child: AppTextField(
                                                    label: 'Password',
                                                    initialValue: state.password,
                                                    onChanged: bloc.updatePassword,
                                                    obscureText: state.hidePassword,
                                                    error: state.passwordError ? 'Invalid and/or weak password.' : null,
                                                    suffixIcon: TogglePasswordButton(
                                                      onPressed: bloc.togglePasswordVisibility,
                                                      value: state.hidePassword,
                                                    ),
                                                  ),
                                                ),
                                                AnimatedLinearProgressIndicator(value: state.passwordStrength, color: state.passwordStrengthColor),
                                                LiquidGlassCard(
                                                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                                                  isTransparent: true,
                                                  child: AppTextField(
                                                    label: 'Confirm Password',
                                                    initialValue: state.confirmPassword,
                                                    onChanged: bloc.updateConfirmPassword,
                                                    obscureText: state.hidePassword,
                                                    error: state.confirmPasswordError ? 'Passwords do not match.' : null,
                                                    suffixIcon: TogglePasswordButton(
                                                      onPressed: bloc.togglePasswordVisibility,
                                                      value: state.hidePassword,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                            ),
                          ),
                        ],
                      ),
                      // Page 2
                      CustomScrollView(
                        slivers: [
                          BlocBuilder<RegisterCubit, RegisterState>(
                            bloc: bloc,
                            buildWhen:
                                (previous, current) =>
                                    previous.step != current.step || //
                                    previous.isSubmitting != current.isSubmitting,
                            builder: (context, state) {
                              return AppSliverAppBar(
                                title: 'Register',
                                isLoading: state.isSubmitting,
                                leading: switch (state.step) {
                                  1 => BackButton(onPressed: bloc.previousStep),
                                  _ => const BackButton(),
                                },
                              );
                            },
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(AppSpacing.s),
                              child: Column(
                                spacing: AppSpacing.l,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Initial Deposit', style: theme.textTheme.headlineSmall),
                                  Column(
                                    spacing: AppSpacing.s,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      BlocSelector<RegisterCubit, RegisterState, double>(
                                        bloc: bloc,
                                        selector: (state) => state.initialBalance,
                                        builder: (context, initialBalance) {
                                          return
                                          // LiquidGlassCard(
                                          //   borderRadius: BorderRadius.circular(AppSpacing.xs),
                                          //   padding: const EdgeInsets.all(AppSpacing.xs),
                                          //   isTransparent: true,
                                          //   child:
                                          AppTextField(
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
                                            // ),
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
                                ],
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
