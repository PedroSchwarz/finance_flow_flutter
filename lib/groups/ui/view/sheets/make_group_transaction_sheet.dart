import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MakeGroupTransactionSheet extends StatelessWidget {
  const MakeGroupTransactionSheet({
    required this.transactionType,
    required this.onTransactionTypeChanged,
    required this.depositAmount,
    required this.onDepositAmountChanged,
    required this.memberDeposit,
    required this.userBalance,
    required this.canSubmit,
    required this.onSubmit,
    super.key,
  });

  final TransactionType transactionType;
  final ValueChanged<TransactionType> onTransactionTypeChanged;
  final double depositAmount;
  final ValueChanged<double> onDepositAmountChanged;
  final double memberDeposit;
  final double userBalance;
  final bool canSubmit;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        final scope = FocusScope.of(context);
        if (!scope.hasPrimaryFocus) {
          scope.unfocus();
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Make a movement', style: theme.textTheme.titleLarge),
                      const Gap(AppSpacing.m),
                      SegmentedButton(
                        segments:
                            TransactionType.values.map((type) {
                              return ButtonSegment(
                                value: type,
                                label: Text(switch (type) {
                                  TransactionType.expense => 'Withdraw',
                                  TransactionType.income => 'Deposit',
                                }),
                              );
                            }).toList(),
                        onSelectionChanged: (selection) {
                          onTransactionTypeChanged(selection.first);
                        },
                        selected: {transactionType},
                      ),
                      const Gap(AppSpacing.m),
                      AppTextField(
                        label: 'Amount',
                        currencyValue: depositAmount,
                        onChanged: (value) {
                          onDepositAmountChanged(CurrencyInputFormatter.parseFormatted(value));
                        },
                        labelStyle: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.secondary),
                        textStyle: theme.textTheme.displayMedium,
                        helper: switch (transactionType) {
                          TransactionType.expense => 'Available withdrawal amount: ${CurrencyInputFormatter.getFormatted(memberDeposit)}',
                          TransactionType.income => 'Available deposit amount: ${CurrencyInputFormatter.getFormatted(userBalance)}',
                        },
                        fillColor: Colors.transparent,
                        error: canSubmit ? null : 'Amount exceeds available balance',
                        border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.primary)),
                        inputFormatters: [CurrencyInputFormatter()],
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(AppSpacing.s),
              FilledButton(onPressed: depositAmount > 0 && canSubmit ? onSubmit : null, child: const Text('Submit')),
              FilledButton.tonal(onPressed: context.pop, child: const Text('Close')),
            ],
          ),
        ),
      ),
    );
  }
}
