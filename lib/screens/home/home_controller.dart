import 'dart:async';
import 'dart:convert';
import 'package:currencies/data/models/currencies_list.dart';
import 'package:currencies/screens/add_currencies/add_currencies_screen.dart';
import 'package:currencies/utils/config.dart';
import 'package:currencies/widgets/snackbar.dart';
import 'package:dio/dio.dart' show Dio, DioError;
import 'package:get/get.dart';

class HomeController extends GetxController{

  final listItems = <CurrenciesList>[].obs;
  final selectedIndexes = [].obs;
  final listDescriptions = [
    'BitcoinCash','BitcoinCash','BitcoinCash','BitcoinCash','BitcoinCash','BitcoinCash','Bitcoin','Bitcoin','Bitcoin',
    'Bitcoin','Bitcoin','Bitcoin','Bitcoin','Bitcoin Gold','Belarusian ruble','Canadian Dollar','Swiss Franc',
    'Chinese Yuan','Chinese Yuan','Chinese Yuan','Ethereum','Ethereum','Ethereum','Ethereum','Ethereum','Euro',
    'Euro','Euro','Euro','Euro','Euro','Euro','Euro','Euro','Euro','Great Britain Pound','Great Britain Pound',
    'Great Britain Pound','Great Britain Pound','Georgian Lari','Georgian Lari','Indonesian Rupiah','Japanese Yen',
    'Japanese Yen','Japanese Yen','Sri Lankan Rupee','Sri Lankan Rupee','Sri Lankan Rupee','Moldauischer Leu',
    'Moldauischer Leu','Moldauischer Leu','Myanmar Kyat','Myanmar Kyat','Myanmar Kyat','Serbian Dinar','Serbian Dinar',
    'Serbian Dinar','Russian Ruble','Russian Ruble','Russian Ruble','Russian Ruble','Russian Ruble','Russian Ruble',
    'Russian Ruble','Russian Ruble','Russian Ruble','Russian Ruble','Thai Baht','Thai Baht','Thai Baht','US Dollar',
    'US Dollar','US Dollar','US Dollar','US Dollar','US Dollar','US Dollar','US Dollar','US Dollar','US Dollar',
    'US Dollar','US Dollar','US Dollar','US Dollar','US Dollar','US Dollar','Ripple','Ripple','Ripple','Ripple',
    'Ripple','Zcash',
  ];

  var dio = Dio();

  @override
  void onInit() {
    // Запускаем функцию refreshList каждые 10 минут, если список с валютами не пуст
    listItems.listen((p0) {
      if (p0.isNotEmpty) {
        Timer.periodic(const Duration(minutes: 10), (timer) => refreshList());
      }
    });
    super.onInit();
  }

  void addItem() => Get.to(
    () => AddCurrenciesScreen(currenciesList: (Map pairs) {
      List _list = [];
      pairs.forEach((k, v) {
        _list.add(v);
      });
      getPairs(pairs);
    }),
  );

  void deleteItem(int idx) => listItems.removeAt(idx);

  getPairs(Map pairs) async {
    List _list = pairs.entries.map((e) => e.value).toList();
    selectedIndexes.value = pairs.keys.toList();
    try {
      final response = await dio.get(Config.apiUrl + '?get=rates&pairs=${_list.join(',')}&key=${Config.apiKey}');
      // 200 HTTP code
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.data);
        int i = 0;
        jsonData['data'].forEach((k, v) {
          listItems.add(CurrenciesList(id: selectedIndexes[i], pair: k, value: v));
          i++;
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

  Future<void> refreshList() async {
    Map _map = {};
    for (var element in listItems) {
      _map.addAll({element.id: element.pair});
    }
    listItems.clear();
    getPairs(_map);
    _map.clear();
  }
}