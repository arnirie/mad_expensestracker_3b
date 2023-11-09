import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3b/components/expenses_entry.dart';
import 'package:mad1_expensestracker_3b/components/expenses_list_view.dart';
import 'package:mad1_expensestracker_3b/models/expenses_item.dart';

class ExpensesListScreen extends StatefulWidget {
  ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  List<ExpensesItem> _expensesList = [
    ExpensesItem(
      description: 'Rental',
      amount: 5000,
      date: DateTime.now(),
    ),
    ExpensesItem(
      description: 'Travel',
      amount: 200,
      date: DateTime.now(),
    ),
    ExpensesItem(
      description: 'Internet',
      amount: 2000,
      date: DateTime.now(),
    ),
  ];

  void addExpensesItem(ExpensesItem expense) {
    _expensesList.add(expense);
    setState(() {});
  }

  void showExpensesEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(
        addItem: addExpensesItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: showExpensesEntry,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesListView(
              expensesList: _expensesList,
            ),
          ),
        ],
      ),
    );
  }
}
