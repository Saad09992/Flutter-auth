import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../network/app_exceptions.dart';
import '../network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      // response from get request
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      // calls returnResponse method and passes response from the get req to it as param and after processing the raw response stores it in responseJson
      responseJson = returnResponse(response);
    } on SocketException {
      // no internet connection
      throw FetchDataException("No internet connection");
    }
    // return processed response
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      // response from post request
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      // calls returnResponse method and passes response from the post req to it as param and after processing the raw response stores it in responseJson
      responseJson = returnResponse(response);
    } on SocketException {
      // No internet connection
      throw FetchDataException("No internet connection");
    }
    // return processed response
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    // add cases as required
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadReqException(response.body.toString());
      case 404:
        throw UnAuthException(response.body.toString());
      case 409:
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code ${response.statusCode.toString()}");
    }
  }
}
