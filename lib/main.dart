import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3b/screens/expenses_list.dart';

void main() {
  runApp(const ExpensesTrackerApp());
}

class ExpensesTrackerApp extends StatelessWidget {
  const ExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ExpensesListScreen(),
    );
  }
}
