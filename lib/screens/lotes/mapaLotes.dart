import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sembe/models/lote.dart';
import 'package:sembe/utils/utils.dart';
import 'package:sembe/utils/widgets/bagdeLote.dart';

class MapaLotes extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  final _pageController = PageController();

  static final CameraPosition _kLote = CameraPosition(
    target: LatLng(-32.250455, -61.599090),
    zoom: 15.8,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<Lote> lotesList = Provider.of<List<Lote>>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text("Sembe"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              GoogleMap(
                  mapType: MapType.satellite,
                  //markers: _marker.toSet(),
                  initialCameraPosition: _kLote,
                  polygons: myPolygon(lotesList),
                  onMapCreated: (GoogleMapController controller) {
                    if (!_controller.isCompleted) {
                      _controller.complete(controller);
                    }
                  }),
              BadgeLote(controller: _pageController)
            ],
          ),
        ));
  }

  Set<Polygon> myPolygon(List<Lote> lotes) {
    Set<Polygon> polygonSet = new Set();

    for (int i = 0; i < lotes.length; i++) {
      List<LatLng> polygonCoords = [];

      for (var coord in lotes[i].poligono) {
        polygonCoords.add(coord);
      }

      polygonSet.add(Polygon(
        polygonId: PolygonId(lotes[i].id),
        points: polygonCoords,
        strokeColor: MyColors().getColorCultivo(lotes[i].cultivo.cultivo),
        strokeWidth: 4,
        fillColor: MyColors()
            .getColorCultivo(lotes[i].cultivo.cultivo)
            .withOpacity(0.3),
        consumeTapEvents: true,
        onTap: () => {
          _center(lotes[i].coord),
          _pageController.animateToPage(i,
              duration: const Duration(seconds: 1), curve: Curves.easeIn)
        },
      ));
    }

    return polygonSet;
  }

  Future<void> _center(LatLng coord) async {
    final CameraPosition _kLoteCenter = CameraPosition(
      target: coord,
      zoom: 15.8,
    );
    print(coord);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLoteCenter));
  }
}
