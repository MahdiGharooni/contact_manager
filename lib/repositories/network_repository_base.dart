import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkRepositoryBase {
  Future<Response> getJSON<T>({required String path}) async {
    final res = await http.get(
      Uri.parse('https://stdevtask3-0510.restdb.io/rest' + path),
      headers: {'APIKEY': 'a5b39dedacbffd95e1421020dae7c8b5ac3cc'},
    );

    return res;
  }
}
