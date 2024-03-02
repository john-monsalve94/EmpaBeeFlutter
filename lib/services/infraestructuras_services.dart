import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:empabee/models/infraestructuras_models.dart';
import 'package:empabee/utils/constants.dart';

class infraestructurasServices extends GetxController {
  Future<List<InfraestructurasModels>?> getInfraestructura() async {
    var client = http.Client();

    var uri = Uri.parse(Constants.infraestructurasUrl);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return infraestructurasModelsFromJson(json);
    }
  }
}
