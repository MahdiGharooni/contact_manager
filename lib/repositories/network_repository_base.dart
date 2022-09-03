import 'package:http/http.dart' as http;

class NetworkRepositoryBase {
  Future<http.Response> getJSON<T>({required String path}) async {
    final res = await http.get(
      Uri.parse('https://stdevtask3-0510.restdb.io/rest' + path),
      headers: {'APIKEY': 'a5b39dedacbffd95e1421020dae7c8b5ac3cc'},
    );

    return res;
  }

  Future<http.Response> deleteJSON<T>({
    required String path,

  }) async {
    final res = await http.delete(
      Uri.parse('https://stdevtask3-0510.restdb.io/rest' + path),
      headers: {'APIKEY': 'a5b39dedacbffd95e1421020dae7c8b5ac3cc'},
    );

    return res;
  }

  Future<dynamic> postJSON<T>({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    // final res = await dio.Dio().post(
    //   'https://stdevtask3-0510.restdb.io/rest' + path,
    //   options: dio.Options(
    //     headers: {
    //       'APIKEY': 'a5b39dedacbffd95e1421020dae7c8b5ac3cc',
    //     },
    //     contentType: dio.Headers.acceptHeader,
    //   ),
    //   // encoding: Encoding.getByName('utf-8'),
    //   data: body,
    // );

    final res = await http.post(
      Uri.parse('https://stdevtask3-0510.restdb.io/rest' + path),
      body: body,
      headers: {
        'APIKEY': 'a5b39dedacbffd95e1421020dae7c8b5ac3cc',
      },
    );

    return res;
  }
}
