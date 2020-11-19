import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zap_architecture/zap_architecture.dart';

import 'models.dart';

class APIInterface {
  static const String url = 'http://restcountries.eu/rest/v2/all';

  static Future<Response<List<Country>>> getCountries() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<dynamic> resData = jsonDecode(response.body);
        print(resData);
        List<Country> countries = [];
        resData.forEach((value) {
          countries.add(Country.fromJson(value));
        });
        print(response.statusCode);
        print("COUNTRIES COUNT: ${countries.length}");
        return Response.success(countries);
      } else {
        return Response.error();
      }
    } catch (e, s) {
      print("Services: GetVersions: UnexpectedError: $e: $s");
      return Response.error();
    }
  }
}
