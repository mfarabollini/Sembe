import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sembe/models/cultivos.dart';
import 'package:sembe/models/lote.dart';
import 'package:sembe/services/cultivosService.dart';

class LoteDetalle extends StatelessWidget {
  const LoteDetalle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lote _lote = ModalRoute.of(context)?.settings.arguments as Lote;
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    Lote _lote = Provider.of<List<Lote>>(context)[args['id']];

    return Scaffold(
      appBar: AppBar(
        title: Text("Sembe"),
      ),
      body: StreamBuilder(
          stream: CultivoService().getCultivosLote(_lote.id),
          builder: (context, AsyncSnapshot<List<Cultivo>> cultivos) {
            if (cultivos.hasData) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Center(
                      child: Text(
                        _lote.nombre,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    DataTable(
                      showBottomBorder: true,
                      sortAscending: true,
                      columns: [
                        DataColumn(label: Text('Campaña')),
                        DataColumn(label: Text('Cultivo')),
                        DataColumn(label: Text('Variedad')),
                        DataColumn(label: Text('')),
                      ],
                      rows: getRows(cultivos.data),
                    ),
                  ]),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  List<DataRow> getRows(List<Cultivo>? cultivos) => cultivos!
      .map((Cultivo _cultivo) => DataRow(cells: [
            DataCell(Text(_cultivo.camp)),
            DataCell(Text(_cultivo.cultivo)),
            DataCell(Text(_cultivo.variedad)),
            DataCell(Icon(Icons.more_vert))
          ]))
      .toList();
}
