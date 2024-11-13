// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:auth_app/network/network_api_service.dart';
import 'package:auth_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../urls.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;
  final apiService = NetworkApiService();

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<dynamic> signUpApi(dynamic data, BuildContext context) async {
    try {
      dynamic res = await apiService.getPostApiResponse(Urls.signUpUrl, data);
      print(res.toString());
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
}
