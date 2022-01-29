import 'package:currencies/utils/colors_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatelessWidget {

  final int? idx;
  final String pair;
  final String values;
  final VoidCallback? deleteItem;

  const ListItem({this.idx, this.deleteItem, this.pair = '', this.values = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => deleteItem?.call(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          color: idx!%2 == 0  ? ColorsSet.tileOdd : ColorsSet.tileEven,
          child: Row(
            children: [
              Text(idx.toString()),
              const SizedBox(width: 10),
              Text(pair),
              const SizedBox(width: 10),
              Text(values),
            ],
          ),
        ),
      ),
    );
  }

}