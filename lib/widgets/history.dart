import 'package:easy_pay/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  String getDate(String date) {
    final todaysDate = DateTime.now();
    final yesterdaysDate = DateTime.now().subtract(const Duration(days: 1));
    if (date == DateFormat('yyyy/MM/dd').format(todaysDate)) {
      return 'Today';
    } else if (date == DateFormat('yyyy/MM/dd').format(yesterdaysDate)) {
      return 'Yesterday';
    } else {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.4,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      // minChildSize: 0,
      expand: true,
      snap: true,
      snapSizes: const [0.7],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                blurRadius: 8,
                blurStyle: BlurStyle.outer,
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                const HistoryTitle(),
                Consumer<Transactions>(
                  builder: (context, transactions, _) =>
                      historyList(transactions),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SliverList historyList(Transactions transactions) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var tnx = transactions.transactionsList[index];
          var sign = (tnx.isCredit) ? '+' : '-';
          var amountInt = tnx.amount.toInt();
          var decimal =
              (tnx.amount + 0.001).toString().split('.')[1].substring(0, 2);
          var date = DateFormat('yyyy/MM/dd').format(tnx.time);
          var time = DateFormat('hh:mm a').format(tnx.time);
          return ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: tnx.image,
            title: Text(
              tnx.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              '${getDate(date)}, at $time',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color.fromRGBO(158, 158, 158, 1),
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: sign == '+'
                    ? const Color.fromRGBO(53, 201, 90, 0.1)
                    : const Color.fromRGBO(255, 59, 48, 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$sign \$$amountInt',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: sign == '+'
                          ? const Color.fromRGBO(53, 201, 90, 1)
                          : const Color.fromRGBO(255, 59, 48, 1),
                    ),
                  ),
                  Text(
                    '.$decimal',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: sign == '+'
                          ? const Color.fromRGBO(53, 201, 90, 0.5)
                          : const Color.fromRGBO(255, 59, 48, 0.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: transactions.itemCount(),
      ),
    );
  }
}

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Theme.of(context).colorScheme.primary,
                backgroundColor: const Color.fromRGBO(241, 245, 249, 1),
              ),
              icon: const Text(
                'Sort',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              label: const Icon(Icons.menu_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
