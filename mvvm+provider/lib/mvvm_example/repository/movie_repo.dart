import 'package:provider_with_mvvm/mvvm_example/model/movies_model.dart';

abstract class MovieRepo {
  Future<MoviesModel> getMoviesList();
}