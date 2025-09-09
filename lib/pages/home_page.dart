import 'package:flutter/material.dart';
import '../data/pet_data.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredPets = petData.where((pet) {
      final nama = pet['nama'].toString().toLowerCase();
      return nama.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Katalog Hewan"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Cari hewan berdasarkan nama...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),

          // 🐾 List Hewan
          Expanded(
            child: ListView.builder(
              itemCount: filteredPets.length,
              itemBuilder: (context, index) {
                final pet = filteredPets[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(pet['gambar'], width: 60, fit: BoxFit.cover),
                    title: Text(pet['nama']),
                    subtitle: Text(pet['jenis']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(pet: pet),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
