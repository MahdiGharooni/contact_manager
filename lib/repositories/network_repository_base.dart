import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/helpers/urls.dart';
import 'package:http/http.dart' as http;

class NetworkRepositoryBase {
  Future<http.Response> getJSON<T>({required String path}) async {
    final res = await http.get(
      Uri.parse(baseUrl + path),
      headers: {'APIKEY': apiKey},
    );

    return res;
  }

  Future<http.Response> deleteJSON<T>({
    required String path,
  }) async {
    final res = await http.delete(
      Uri.parse(baseUrl + path),
      headers: {'APIKEY': apiKey},
    );

    return res;
  }

  Future<http.Response> putJSON<T>({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    final res = await http.put(
      Uri.parse(baseUrl + path),
      headers: {'APIKEY': apiKey},
      body: body,
    );

    return res;
  }

  Future<dynamic> postJSON<T>({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    final res = await http.post(
      Uri.parse(baseUrl + path),
      body: body,
      headers: {
        'APIKEY': apiKey,
      },
    );

    return res;
  }
}
