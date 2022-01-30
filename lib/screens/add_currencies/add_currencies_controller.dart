import 'dart:convert';
import 'package:currencies/utils/config.dart';
import 'package:currencies/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AddCurrenciesController extends GetxController{

  final listItems = [].obs;
  final isCheckedMap = {}.obs;
  var dio = Dio();

  @override
  void onInit() async {
    getCurrencies();
    super.onInit();
  }

  getCurrencies() async {
    listItems.clear();
    try {
      final response = await dio.get(Config.apiUrl + '?get=currency_list&key=${Config.apiKey}');
      // 200 HTTP code
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.data);
        listItems.addAll(jsonData['data']);
      }
    } catch (e) {
      if (e is DioError) {
        _errorStatus('Возникла ошибка, код: ${e.response?.statusCode}');
      }
    }
    return '';
  }

  void addCurrencyToMap(int idx, String currency){
    isCheckedMap.addAll({idx: currency});
  }

  // Функция возвращает на главный экран список валют для отслеживания
  void returnCurrencies(Function(List) pairs){
    var _list = [];
    isCheckedMap.forEach((k, v) => _list.add(v));
    pairs(_list);
    if (_list.isNotEmpty) Get.back();
  }

  void _errorStatus(String error) {
    Snackbar(title: 'Ошибка', message: error);
  }

  bool selectItem(int idx){
    var it = Map.from(isCheckedMap);
    for (var e in it.entries) {
      if (e.key == idx) {
        return true;
      }
    }
    return false;
  }
}