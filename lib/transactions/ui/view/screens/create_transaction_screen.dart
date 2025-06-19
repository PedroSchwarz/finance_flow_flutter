import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateTransactionScreen extends StatefulWidget {
  const CreateTransactionScreen({super.key});

  static const String routeName = 'create';

  @override
  State<CreateTransactionScreen> createState() => _CreateTransactionScreenState();
}

class _CreateTransactionScreenState extends State<CreateTransactionScreen> {
  final bloc = getIt<CreateTransactionCubit>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<CreateTransactionCubit, CreateTransactionState>(
      bloc: bloc,
      listenWhen: (previous, current) => previous.shouldGoBack != current.shouldGoBack,
      listener: _listenNavigationFlow,
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
                child: CustomScrollView(
                  slivers: [
                    BlocSelector<CreateTransactionCubit, CreateTransactionState, bool>(
                      bloc: bloc,
                      selector: (state) => state.isLoading || state.isSubmitting,
                      builder: (context, isLoading) {
                        return AppSliverAppBar(title: 'Create Transaction', isLoading: isLoading);
                      },
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.s),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: AppSpacing.s,
                          children: [
                            BlocSelector<CreateTransactionCubit, CreateTransactionState, TransactionType>(
                              bloc: bloc,
                              selector: (state) => state.type,
                              builder: (context, type) {
                                return SegmentedButton(
                                  segments:
                                      TransactionType.values.map((item) {
                                        return ButtonSegment(
                                          value: item,
                                          label: Text(switch (item) {
                                            TransactionType.income => 'Income',
                                            TransactionType.expense => 'Expense',
                                          }),
                                        );
                                      }).toList(),
                                  selected: {type},
                                  onSelectionChanged: (values) {
                                    bloc.updateType(values.first);
                                  },
                                );
                              },
                            ),
                            BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
                              bloc: bloc,
                              buildWhen:
                                  (previous, current) =>
                                      previous.title != current.title || //
                                      previous.isLoading != current.isLoading,
                              builder: (context, state) {
                                return AppSkeleton(
                                  isLoading: state.isLoading,
                                  child: LiquidGlassCard(
                                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                                    isTransparent: true,
                                    child: AppTextField(
                                      label: 'Title',
                                      initialValue: state.title,
                                      onChanged: bloc.updateTitle,
                                      textCapitalization: TextCapitalization.words,
                                    ),
                                  ),
                                );
                              },
                            ),
                            BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
                              bloc: bloc,
                              buildWhen:
                                  (previous, current) =>
                                      previous.description != current.description || //
                                      previous.isLoading != current.isLoading,
                              builder: (context, state) {
                                return AppSkeleton(
                                  isLoading: state.isLoading,
                                  child: LiquidGlassCard(
                                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                                    isTransparent: true,
                                    child: AppTextField(
                                      label: 'Description',
                                      maxLines: 5,
                                      initialValue: state.description,
                                      onChanged: bloc.updateDescription,
                                      textCapitalization: TextCapitalization.sentences,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Gap(AppSpacing.s),
                            BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
                              bloc: bloc,
                              buildWhen:
                                  (previous, current) =>
                                      previous.description != current.description || //
                                      previous.isLoading != current.isLoading,
                              builder: (context, state) {
                                return AppSkeleton(
                                  isLoading: state.isLoading,
                                  child: AppTextField(
                                    label: 'Amount',
                                    currencyValue: state.amount,
                                    onChanged: (value) {
                                      bloc.updateAmount(CurrencyInputFormatter.parseFormatted(value));
                                    },
                                    labelStyle: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.secondary),
                                    textStyle: theme.textTheme.displayMedium,
                                    fillColor: Colors.transparent,
                                    border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.primary)),
                                    inputFormatters: [CurrencyInputFormatter()],
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: BlocSelector<CreateTransactionCubit, CreateTransactionState, bool>(
                                bloc: bloc,
                                selector: (state) => state.canSubmit,
                                builder: (context, canSubmit) {
                                  return FilledButton(onPressed: canSubmit ? bloc.createTransaction : null, child: const Text('Create'));
                                },
                              ),
                            ),
                          ],
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
    );
  }

  void _listenNavigationFlow(BuildContext context, CreateTransactionState state) {
    if (state.shouldGoBack) {
      context.pop(true);
    }
  }
}
