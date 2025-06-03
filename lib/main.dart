import 'package:finance_flow/app/dependencies/locators.dart';
import 'package:finance_flow/bootstrap.dart';
import 'package:flutter/material.dart';

void main() async {
  await bootstrap((widget) async {
    await Locators().setup();
    runApp(widget);
  });
}
