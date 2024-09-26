import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider_with_mvvm/mvvm_example/data/app_exception.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/base_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiService({required String url}) async {
    final dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future postApiService({required String url, required data}) async {
    final dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
}
dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw UnauthorisedException(response.body.toString());
    default:
      throw FetchDataException(
          "Error occured while communicating with server: ${response.statusCode.toString()}");
  }
}
