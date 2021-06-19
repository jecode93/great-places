import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/places_list_screen.dart';
import './providers/great_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: PlacesListScreen(), // Comment this line to prevent error
      ),
    );
  }
}
