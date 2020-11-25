import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/mapa/mapa_bloc.dart';
import 'bloc/busqueda/busqueda_bloc.dart';
import 'bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

import 'pages/maps_page.dart';
import 'pages/loading_page.dart';
import 'pages/access_gps_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MapaBloc()),
        BlocProvider(create: (_) => MiUbicacionBloc()),
        BlocProvider(create: (_) => BusquedaBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maps App',
        home: LoadingPage(),
        routes: {
          'maps': (_) => MapsPage(),
          'loading': (_) => LoadingPage(),
          'access_gps': (_) => AccessGpsPage(),
        },
      ),
    );
  }
}
