import 'dart:convert';
import 'package:currencies/home/widgets/add_dialog.dart';
import 'package:currencies/home/widgets/list_item.dart';
import 'package:currencies/utils/config.dart';
import 'package:currencies/widgets/snackbar.dart';
import 'package:dio/dio.dart' show Dio, DioError;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final TextEditingController pairController = TextEditingController();
  final allFieldFilled = false.obs;
  final listItems = <ListItem>[].obs;
  final listItemValue = ''.obs;
  var dio = Dio();

  @override
  void onInit() async {
    pairController.addListener(() {
      if (pairController.text.isNotEmpty) {
        allFieldFilled.value = true;
      }
    });
    super.onInit();
  }

  void addItem() {
    Get.defaultDialog(
      title: 'Добавить валютную пару',
      titlePadding: const EdgeInsets.symmetric(vertical: 25),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      radius: 5,
      content: Obx(
        () => AddDialog(
          pairController: pairController,
          allFieldFilled: allFieldFilled.value,
          btnAction: () async {
            await getPair(pairController.text);
            listItems.add(ListItem(pair: pairController.text, values: listItemValue.value));
            Get.back();
            pairController.clear();
          },
        ),
      ),
    );
  }

  void deleteItem(int idx) => listItems.removeAt(idx);

  getPair(String pair) async {
    try {
      final response = await dio.get(Config.apiUrl + '?get=rates&pairs=$pair&key=${Config.apiKey}');
      // 200 HTTP code
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.data);
        listItemValue.value = jsonData['data'][pair];
      }
    } catch (e) {
      if (e is DioError) {
        _errorStatus('Возникла ошибка, код: ${e.response?.statusCode}');
      }
    }
    return '';
  }

  void _errorStatus(String error) {
    Snackbar(title: 'Ошибка', message: error);
  }
}