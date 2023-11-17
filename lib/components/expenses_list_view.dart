import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3b/models/expenses_item.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView(
      {super.key, required this.expensesList, required this.removeItem});

  List<ExpensesItem> expensesList;
  Function(ExpensesItem item) removeItem;

  @override
  Widget build(BuildContext context) {
    var date_formatter = DateFormat.yMd();
    var amount_formatter = NumberFormat.currency(
      symbol: '₱',
      decimalDigits: 2,
    );
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (_, index) {
        return Dismissible(
          key: ValueKey(expensesList[index].id),
          onDismissed: (direction) {
            print(direction);
            if (direction == DismissDirection.endToStart) {
              //remove
            } else {
              //archive
            }
            removeItem(expensesList[index]);
          },
          background: Container(
            padding: const EdgeInsets.only(right: 8),
            alignment: Alignment.centerRight,
            color: Colors.green.shade100,
            child: Icon(
              Icons.delete,
              color: Colors.red.shade400,
            ),
          ),
          // secondaryBackground: Container(
          //   color: Colors.indigo,
          // ),
          direction: DismissDirection.endToStart,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('${expensesList[index].description}'),
                  const Gap(8),
                  Row(
                    children: [
                      Text(
                          '${amount_formatter.format(expensesList[index].amount)}'),
                      const Spacer(),
                      Text(
                          '${date_formatter.format(expensesList[index].date)}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
