import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembe/models/lote.dart';

class BadgeLote extends StatelessWidget {
  const BadgeLote({
    Key? key,
    required PageController controller,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    List<Lote> lotesList = Provider.of<List<Lote>>(context, listen: true);

    return Positioned(
        key: key,
        right: 0,
        top: 0,
        left: 0,
        height: MediaQuery.of(context).size.height * 0.2,
        child: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lotesList.length,
          itemBuilder: (context, index) {
            final item = lotesList[index];
            return _LoteInfo(lote: item, index: index);
          },
        ));
  }
}

class _LoteInfo extends StatelessWidget {
  const _LoteInfo({Key? key, required Lote lote, required int index})
      : _lote = lote,
        _index = index,
        super(key: key);

  final Lote _lote;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        border: Border.all(color: Colors.black87, width: 0.5),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 81,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/' + _lote.cultivo.cultivo + '.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.black26,
                    width: 1.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _lote.cultivo.cultivo,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      _lote.cultivo.camp,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      _lote.cultivo.variedad,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      _lote.cultivo.status,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _lote.nombre,
                      style: TextStyle(
                        fontSize: 21.0,
                      ),
                    ),
                    Text(
                      _lote.campo,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      _lote.hectareas.round().toString() + " Has",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cultivo');
                  },
                  tooltip: "Ver Cultivo",
                  icon: Icon(
                    Icons.spa,
                    size: 22.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/lote', arguments: {'id': _index});
                  },
                  tooltip: "Ver Lote",
                  icon: Icon(
                    Icons.layers_outlined,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
