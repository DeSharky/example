import 'package:currencies/screens/home/widgets/list_item.dart';
import 'package:currencies/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {

  final controller = Get.put<HomeController>(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список валют')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.listItems.isNotEmpty ? controller.listItems.length : 1,
          itemBuilder: (BuildContext context, int idx) => controller.listItems.isNotEmpty
            ? ListItem.home(
              idx: idx,
              deleteItem: () => controller.deleteItem(idx),
              pair: controller.listItems[idx].pair,
              value: controller.listItems[idx].value,
            )
            : Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(child: Text('Ни одной валютной пары не было добавлено', style: TextStyles.italic)),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addItem,
        tooltip: 'Добавить валюты',
        child: const Icon(Icons.add),
      ),
    );
  }

}