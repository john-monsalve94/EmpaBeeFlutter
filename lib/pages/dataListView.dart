import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senaflutterapp/constants/constants.dart';
import 'package:senaflutterapp/models/area_models.dart';
import 'package:senaflutterapp/services/areas_services.dart';

class DataListView extends StatefulWidget {
  const DataListView({super.key});

  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {
  List<dynamic> data = []; //

  @override
  void initState() {
    super.initState();
    fetchData().then((result) {
      setState(() {
        data = result;
      });
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Error al cargar los datos de la API'),
            actions: [
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data List'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = data[index];
          return ListTile(
            title: Text(item['nombreArea'] ?? 'vacío'),
            subtitle: Text('ID: ${item['id'] ?? 'vació'}'),
          );
        },
      ),
    );
  }
}


// class DataListView extends StatefulWidget {
//   const DataListView({Key? key}) : super(key: key);

//   @override
//   _DataListViewState createState() => _DataListViewState();
// }

// class _DataListViewState extends State<DataListView> {
//   List<dynamic> data = [];
//   String selectedArea = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchData().then((result) {
//       setState(() {
//         data = result;
//       });
//     }).catchError((error) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Error'),
//             content: const Text('Error al cargar los datos de la API'),
//             actions: [
//               TextButton(
//                 child: const Text('Cerrar'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     });
//   }

//   void showInfraestructuraDialog(String infraestructura) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Infraestructura'),
//           content: Text(infraestructura),
//           actions: [
//             TextButton(
//               child: const Text('Cerrar'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data List'),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) {
//           final area = data[index];
//           final infraestructuras = area['infraestructuras'] ?? [];
//           final nombreArea = area['nombreArea'] ?? 'vacío';

//           return ListTile(
//             title: Text(nombreArea),
//             subtitle: Text('ID: ${area['id'] ?? 'vacío'}'),
//             onTap: () {
//               setState(() {
//                 selectedArea = nombreArea;
//               });
//               final infraestructura = infraestructuras.isNotEmpty
//                   ? infraestructuras[0]['nombreInfraestructura']
//                   : 'No hay infraestructuras';
//               showInfraestructuraDialog(infraestructura);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
