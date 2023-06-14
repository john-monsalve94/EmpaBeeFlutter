import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senaflutterapp/utils/constants.dart';


Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse(Constants.areaUrl));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al cargar los datos de la API');
  }
}