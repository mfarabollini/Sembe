import 'package:flutter/material.dart';

class CultivoDetalle extends StatelessWidget {
  const CultivoDetalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sembe"),
      ),
      body: Container(
        child: Center(
          child: Text('Detalle Cultivo'),
        ),
      ),
    );
  }
}
