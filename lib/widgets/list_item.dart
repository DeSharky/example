import 'package:currencies/utils/colors_set.dart';
import 'package:currencies/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {

  final Widget content;

  const ListItem({required this.content, Key? key}) : super(key: key);

  static var format = NumberFormat("###,###.0#", "en_US");

  factory ListItem.currencyList({
    String currency = '',
    bool isChecked = false,
    VoidCallback? onTap,
  }){
    return ListItem(
      content: GestureDetector(
        onTap: () => onTap?.call(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: ColorsSet.tileColor,
          child: Row(
            children: [
              Text(currency, style: TextStyles.tileStyle),
              const Spacer(),
              if (isChecked)
                Icon(Icons.check, size: 15, color: ColorsSet.isChecked),
            ],
          ),
        ),
      ),
    );
  }

  factory ListItem.home({
    String pair = '',
    String value = '',
    String desc = '',
    VoidCallback? deleteItem,
  } ){
    value = format.format(double.parse(value));
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          color: ColorsSet.tileColor,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pair, style: TextStyles.tileStyle),
                  const SizedBox(height: 5),
                  Text(desc, style: TextStyles.tileDescStyle),
                ],
              ),
              const Spacer(),
              Text(value, style: TextStyles.tileValueStyle),
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