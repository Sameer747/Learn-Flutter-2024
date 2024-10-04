import 'package:flutter/foundation.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/base_api_service.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/network_api_service.dart';
import 'package:provider_with_mvvm/mvvm_example/model/movies_model.dart';
import 'package:provider_with_mvvm/mvvm_example/repository/movie_repo.dart';
import 'package:provider_with_mvvm/mvvm_example/data/network/endpoints.dart';

class MovieRepoImpl implements MovieRepo {
  // instance of BaseApiServices class
  final BaseApiServices _apiServices = NetworkApiServices();

  // method to getMoviesList from the _apiService with return type as MoviesModel
  @override
  Future<MoviesModel> getMoviesList() async {
    try {
      dynamic response = await _apiServices.getApiService(url: Endpoints.moviesListApiEndPoint);
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
