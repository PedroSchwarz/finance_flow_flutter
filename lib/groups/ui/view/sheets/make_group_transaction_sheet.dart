import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MakeGroupTransactionSheet extends StatefulWidget {
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
  State<MakeGroupTransactionSheet> createState() => _MakeGroupTransactionSheetState();
}

class _MakeGroupTransactionSheetState extends State<MakeGroupTransactionSheet> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

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
      child: BottomSheet(
        onClosing: () {},
        showDragHandle: true,
        animationController: _controller,
        builder: (context) {
          return SafeArea(
            top: false,
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
                              widget.onTransactionTypeChanged(selection.first);
                            },
                            selected: {widget.transactionType},
                          ),
                          const Gap(AppSpacing.m),
                          AppTextField(
                            label: 'Amount',
                            currencyValue: widget.depositAmount,
                            onChanged: (value) {
                              widget.onDepositAmountChanged(CurrencyInputFormatter.parseFormatted(value));
                            },
                            labelStyle: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.secondary),
                            textStyle: theme.textTheme.displayMedium,
                            helper: switch (widget.transactionType) {
                              TransactionType.expense => 'Available withdrawal amount: ${CurrencyInputFormatter.getFormatted(widget.memberDeposit)}',
                              TransactionType.income => 'Available deposit amount: ${CurrencyInputFormatter.getFormatted(widget.userBalance)}',
                            },
                            fillColor: Colors.transparent,
                            error: widget.canSubmit ? null : 'Amount exceeds available balance',
                            border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.primary)),
                            inputFormatters: [CurrencyInputFormatter()],
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(AppSpacing.s),
                  FilledButton(onPressed: widget.depositAmount > 0 && widget.canSubmit ? widget.onSubmit : null, child: const Text('Submit')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
