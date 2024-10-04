import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/data/response/api_response.dart';
import 'package:provider_with_mvvm/mvvm_example/model/movies_model.dart';
import 'package:provider_with_mvvm/mvvm_example/repository/movie_repo_impl.dart';

class HomeViewModel extends ChangeNotifier {
  // instance of movie repository impl
  final _movieRepo = MovieRepoImpl();

  // assign value to api response
  ApiResponse<MoviesModel> moviesListResponse = ApiResponse.loading();

  // function to set movies list 
  setMoviesList({required ApiResponse<MoviesModel> response}) {
    moviesListResponse = response;
    notifyListeners();
  }

  // future funtion to fetch moviesList 
  Future<void> fetchMoviesListApi() async {
    // set the response value
    setMoviesList(response: ApiResponse.loading());
    
    // if completed show completed if error show error
    await _movieRepo.getMoviesList().then((value) {
      setMoviesList(response: ApiResponse.completed(data: value));
    }).onError((error, stackTrace) {
      setMoviesList(response: ApiResponse.error(message: error.toString()));
    });
  }
}
