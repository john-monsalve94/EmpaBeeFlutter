import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onBackPressed;

  const CustomAppBar({Key? key, required this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height / 12,
        width: width,
        padding: const EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 251, 215, 140), Color.fromARGB(255, 247, 167, 51)]),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackPressed, // Llama a la función de devolución de llamada
            )
          ],
        ),
      ),
    );
  }
}
