import 'package:currencies/home/widgets/list_item.dart';
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
          itemCount: controller.listItems.length,
          itemBuilder: (BuildContext context, int idx) => ListItem(
            idx: idx,
            deleteItem: () => controller.deleteItem(idx),
            pair: controller.listItems[idx].pair,
            values: controller.listItems[idx].values,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addItem,
        tooltip: 'Add currencies',
        child: const Icon(Icons.add),
      ),
    );
  }

}