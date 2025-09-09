import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const PetCatalogApp());
}

class PetCatalogApp extends StatelessWidget {
  const PetCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Hewan Peliharaan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
