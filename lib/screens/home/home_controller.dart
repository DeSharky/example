import 'dart:convert';
import 'package:currencies/models/currencies_list.dart';
import 'package:currencies/screens/add_currencies/add_currencies_screen.dart';
import 'package:currencies/utils/config.dart';
import 'package:currencies/widgets/snackbar.dart';
import 'package:dio/dio.dart' show Dio, DioError;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final TextEditingController pairController = TextEditingController();
  final allFieldFilled = false.obs;
  final listItems = <CurrenciesList>[].obs;
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

  void addItem() => Get.to(() => AddCurrenciesScreen(currenciesList: (List pairs) => getPairs(pairs)));

  void deleteItem(int idx) => listItems.removeAt(idx);

  getPairs(List pairs) async {
    try {
      final response = await dio.get(Config.apiUrl + '?get=rates&pairs=${pairs.join(',')}&key=${Config.apiKey}');
      // 200 HTTP code
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.data);
        jsonData['data'].forEach((k, v) {
          listItems.add(CurrenciesList(pair: k, value: v));
        });
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