import 'package:flutter/material.dart';

import 'views/rick_morties/rick_morties.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: RickMorties()
    );
  }
}