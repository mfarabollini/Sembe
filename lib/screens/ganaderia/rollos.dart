import 'package:flutter/material.dart';

class RollosList extends StatelessWidget {
  const RollosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sembe"),
      ),
      body: Container(
        child: Center(
          child: Text('Lista de Rollos'),
        ),
      ),
    );
  }
}
