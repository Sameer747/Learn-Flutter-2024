import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider_with_mvvm/mvvm_example/data/app_exception.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/base_api_service.dart';

/*
 * The NetworkApiServices class extends the BaseApiServices
 * The class is also uses SOLID principle so that the
 * code is decoupled and can modified without worrying for
 * the current code to be disturbed
*/

class NetworkApiServices extends BaseApiServices {
  // override the getApiService method from the parent class
  @override
  Future getApiService({required String url}) async {
    // declare a dynamic type variable 
    final dynamic responseJson;
    try {
      // declare a final varibale response and intilize it to wait for the response
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      // assign the response to responseJson pass the response to returnResponse funtion
      responseJson = returnResponse(response);
    } on SocketException {
      // if there is an internet error then throw this exception
      throw FetchDataException("No Internet Connection");
    }
    // if all goes well return the resoponse
    return responseJson;
  }

  // override the postApiService method from the parent class
  @override
  Future postApiService({required String url, required data}) async {
    // declare a dynamic type variable
    final dynamic responseJson;
    try {
      // declare a http.response type variable and wait for it to post the data
      http.Response response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      // assign the response to responseJson pass the response to returnResponse funtion
      responseJson = returnResponse(response);
    } on SocketException {
      // if there is an internet connection error then throw this exception
      throw FetchDataException("No Internet Connection");
    }
    // if all goes well return the response
    return responseJson;
  }
}

// a dynamic method to return the repsonse 
dynamic returnResponse(http.Response response) {
  // switch the repsonse based on status code
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
