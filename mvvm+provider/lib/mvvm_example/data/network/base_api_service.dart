/*
 * The BaseApiServices is using a SOLID so that the code
 * is written once and can be used to many other places
 * so that the code are decoupled and not tightly packed
*/

abstract class BaseApiServices {
  Future<dynamic> getApiService({required String url});
  Future<dynamic> postApiService({required String url, required data});
}
