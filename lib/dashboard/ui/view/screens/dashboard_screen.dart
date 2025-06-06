import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/dashboard/ui/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String routeName = 'dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final bloc = getIt<DashboardCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [const Text('Dash', textAlign: TextAlign.center), ElevatedButton(onPressed: bloc.signOut, child: const Text('Sign Out'))],
      ),
    );
  }
}
