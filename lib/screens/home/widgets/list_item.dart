import 'package:currencies/utils/colors_set.dart';
import 'package:currencies/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatelessWidget {

  final Widget content;

  const ListItem({required this.content, Key? key}) : super(key: key);

  factory ListItem.currencyList({
    int? idx,
    String currency = '',
    bool isChecked = false,
    VoidCallback? onTap,
  }){
    return ListItem(
      content: GestureDetector(
        onTap: () => onTap?.call(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          color: idx!%2 == 0  ? ColorsSet.tileEven : ColorsSet.tileOdd,
          child: Row(
            children: [
              Text(idx.toString()),
              const SizedBox(width: 10),
              Text(currency, style: TextStyles.defaultStyle),
              const Spacer(),
              if (isChecked)
                const Icon(Icons.check, size: 15),
            ],
          ),
        ),
      ),
    );
  }

  factory ListItem.home({
    int? idx,
    String pair = '',
    String value = '',
    VoidCallback? deleteItem,
  } ){
    return ListItem(content: Slidable(
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
              Text(value),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }

}