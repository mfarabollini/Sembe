import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sembe/models/cultivos.dart';
import 'package:sembe/models/lote.dart';
import 'package:sembe/screens/ganaderia/rollos.dart';
import 'package:sembe/screens/home.dart';
import 'package:sembe/screens/lotes/lote_detalle.dart';
import 'package:sembe/screens/lotes/mapaLotes.dart';
import 'package:sembe/services/cultivosService.dart';
import 'package:sembe/services/lotesService.dart';

import 'screens/cultivo/cultivo_detalle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
//MyApp is our root widget.
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<List<Lote>>.value(
            value: LotesService().getLotesList(),
            initialData: [],
          ),
          // StreamProvider<List<Cultivo>>.value(
          //   value: CultivoService().getCultivos(),
          //   initialData: [],
          // )
        ],
        child: MaterialApp(
          title: 'Sembë',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Colors.blue,
          ),
          home: Home(),
          routes: <String, WidgetBuilder>{
            '/lote': (BuildContext context) => LoteDetalle(),
            '/cultivo': (BuildContext context) => CultivoDetalle(),
            '/mapalotes': (BuildContext context) => MapaLotes(),
            '/rollos': (BuildContext context) => RollosList()
          },
        ));
  }
}
