import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3b/models/expenses_item.dart';

class ExpensesEntry extends StatefulWidget {
  ExpensesEntry({super.key, required this.addItem});

  Function(ExpensesItem expense) addItem;

  @override
  State<ExpensesEntry> createState() => _ExpensesEntryState();
}

class _ExpensesEntryState extends State<ExpensesEntry> {
  TextEditingController descController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  DateTime? selectedDate;

  void selectDate() async {
    var now = DateTime.now();
    var date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, 1, 1),
      lastDate: DateTime(now.year, 12, 31),
    ); //.then((value) => print)
    selectedDate = date;
    setState(() {});
  }

  void dismissEntry() {
    // Navigator.pop(context);
    Navigator.of(context).pop();
  }

  void insertItem() {
    //validate input
    var errorMessage = '';
    if (descController.text == '') {
      errorMessage = 'Description is required.';
      showAlert(errorMessage);
      return;
    }
    var amount = double.tryParse(amountController.text);
    if (amount == null || amount <= 0) {
      errorMessage = 'Amount should be greater than zero';
      showAlert(errorMessage);
      return;
    }
    if (selectedDate == null) {
      errorMessage = 'Please select a date';
      showAlert(errorMessage);
      return;
    }

    //add list
    widget.addItem(
      ExpensesItem(
          description: descController.text,
          amount: amount ?? 0,
          date: selectedDate!),
    );
    dismissEntry();
  }

  void showAlert(String errorMessage) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            controller: descController,
            decoration: InputDecoration(
              label: Text('Description'),
            ),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('Amount'),
            ),
          ),
          Row(
            children: [
              Text(selectedDate == null
                  ? 'Date'
                  : '${DateFormat.yMd().format(selectedDate!)}'),
              Gap(8),
              IconButton(
                onPressed: selectDate,
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: dismissEntry,
                child: const Text('Cancel'),
              ),
              Gap(8),
              ElevatedButton(
                onPressed: insertItem,
                child: const Text('ADD'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
