import 'dart:io';
import 'package:currencies/utils/config.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = Config.apiUrl;
    httpClient.userAgent = Platform.operatingSystem;


  }
}