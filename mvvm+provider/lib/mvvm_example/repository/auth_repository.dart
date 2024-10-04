import 'package:provider_with_mvvm/mvvm_example/data/network/base_api_service.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/network_api_service.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/endpoints.dart';

/*
 * The repository class is a bridge between
 * data class and repository class  
*/

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi({required dynamic data}) async {
    try {
      dynamic response = await _apiServices.postApiService(url: Endpoints.loginApiEndPoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi({required dynamic data}) async {
    try {
      dynamic response = await _apiServices.postApiService(url: Endpoints.signUpApiEndPoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
