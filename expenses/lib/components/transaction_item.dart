import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {

  final Transaction tr;
  final void Function(String) onRemove;

  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${tr.value}'),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
        ? TextButton.icon(
        onPressed: () => onRemove(tr.id),
        icon: Icon(Icons.delete),
        label: Text('Excluir'),
        style: TextButton.styleFrom(
              primary: Theme.of(context).errorColor,
            ),
        )
        :IconButton(
        icon: Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: () => onRemove(tr.id),
        ),
      ),
    );
  }
}