import 'package:currencies/utils/colors_set.dart';
import 'package:currencies/utils/widgets.dart';
import 'package:currencies/widgets/add_button.dart';
import 'package:currencies/widgets/list_item.dart';
import 'package:currencies/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencies/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {

  final controller = Get.put<HomeController>(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsSet.appBg,
      appBar: AppBar(
        title: const Text('Список валют'),
        backgroundColor: ColorsSet.appBar,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.refreshList,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.listItems.isNotEmpty ? controller.listItems.length : 1,
                itemBuilder: (BuildContext context, int idx) => controller.listItems.isNotEmpty
                  ? ListItem.home(
                      deleteItem: () => controller.deleteItem(idx),
                      pair: controller.listItems[idx].pair,
                      value: controller.listItems[idx].value,
                      desc: controller.listDescriptions[controller.listItems[idx].id!],
                    )
                  : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: Text('Ни одной валютной пары не было добавлено', style: TextStyles.italic)),
                  ),
                separatorBuilder: (BuildContext context, int index) => Widgets.divider,
              ),
              Widgets.divider,
              AddButton(onTap: controller.addItem, padding: const EdgeInsets.all(15)),
            ],
          ),
        ),
      ),
    );
  }
}
