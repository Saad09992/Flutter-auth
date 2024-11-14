// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:auth_app/network/network_api_service.dart';
import 'package:auth_app/utils/secure_storage.dart';
import 'package:auth_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../utils/urls.dart';

class AuthController extends GetxController {
  RxBool _isLoading = false.obs;
  RxBool _isLoggedIn = false.obs;
  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;

  final apiService = NetworkApiService();
  final SecureStorage secureStorage = SecureStorage();

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  void setLoggedIn(bool loggedIn) {
    _isLoggedIn.value = loggedIn;
  }

  Future<dynamic> signUpApi(dynamic data, BuildContext context) async {
    try {
      dynamic res = await apiService.getPostApiResponse(Urls.signUpUrl, data);
      if (res['status'] == 'error') {
        Utils.errorMessage(res['msg'], context);
      } else {
        Utils.successMessage(res['msg'], context);
      }
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    try {
      setLoading(true);
      dynamic res = await apiService.getPostApiResponse(Urls.loginUrl, data);
      if (res['status'] == 'error') {
        setLoading(false);
        print(res);
        Utils.errorMessage(res['msg'], context);
      } else {
        setLoading(false);
        Utils.successMessage(res['msg'], context);
        String token = res['token'].toString();
        await secureStorage.writeStorageData('token', token);
        setLoggedIn(true);
      }
      return res;
    } catch (e) {
      setLoading(false);
      rethrow;
    }
  }

  void logout() {
    secureStorage.removeStorageData('token');
    setLoggedIn(false);
  }
}
