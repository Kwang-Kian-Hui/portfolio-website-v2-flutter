import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_website/core/presentation/main_app_widget.dart';

void main() {
  runApp(const ProviderScope(child: MainAppWidget()));
}