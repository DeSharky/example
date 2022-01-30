import 'package:currencies/utils/colors_set.dart';
import 'package:currencies/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencies/screens/add_currencies/add_currencies_controller.dart';

class AddCurrenciesScreen extends StatelessWidget {

  final controller = Get.put<AddCurrenciesController>(AddCurrenciesController());

  final Function(Map) currenciesList;

  AddCurrenciesScreen({required this.currenciesList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsSet.appBg,
      appBar: AppBar(
        title: const Text('Добавить валюту'),
        backgroundColor: ColorsSet.appBar,
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          itemCount: controller.listItems.length,
          itemBuilder: (BuildContext context, int idx) => Obx(
            () => ListItem.currencyList(
              currency: controller.listItems[idx],
              onTap: () => controller.addCurrencyToMap(idx, controller.listItems[idx]),
              isChecked: controller.selectItem(idx),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => Divider(color: ColorsSet.dividerColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsSet.addButton,
        onPressed: () => controller.returnCurrencies((Map pairs) => currenciesList(pairs)),
        tooltip: 'Добавить',
        child: const Text('ОК'),
      ),
    );
  }

}