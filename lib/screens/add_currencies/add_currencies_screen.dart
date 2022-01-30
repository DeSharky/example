import 'package:currencies/screens/home/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencies/screens/add_currencies/add_currencies_controller.dart';

class AddCurrenciesScreen extends StatelessWidget {

  final controller = Get.put<AddCurrenciesController>(AddCurrenciesController());

  final Function(List) currenciesList;

  AddCurrenciesScreen({required this.currenciesList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить валюты')),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listItems.length,
          itemBuilder: (BuildContext context, int idx) => Obx(
            () => ListItem.currencyList(
              idx: idx,
              currency: controller.listItems[idx],
              onTap: () => controller.addCurrencyToMap(idx, controller.listItems[idx]),
              isChecked: controller.selectItem(idx),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.returnCurrencies((List pairs) => currenciesList(pairs)),
        tooltip: 'Добавить',
        child: const Icon(Icons.add),
      ),
    );
  }

}