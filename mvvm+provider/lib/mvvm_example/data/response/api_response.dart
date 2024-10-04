import 'package:provider_with_mvvm/mvvm_example/data/response/status.dart';

/*
 * The ApiResponse class is responsible for the response based on response
*/

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed({required this.data}) : status = Status.completed;
  ApiResponse.error({required this.message}) : status = Status.error;

  @override
  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}
