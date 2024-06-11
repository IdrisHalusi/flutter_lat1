import 'package:flutter/material.dart';

class Tugas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idris Halusi'),
      ),
      body: Column(
        children: <Widget>[
          // Top grid section
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.8),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: List.generate(12, (index) {
                  return Container(
                    color: Color.fromARGB(255, 114, 41, 12),
                  );
                }),
              ),
            ),
          ),
          // Bottom list section
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 186, 23),
                  ),
                  title: Text('Idris Halusi'),
                  subtitle: Text('mahasiswa'),
                  trailing: Icon(Icons.favorite_border),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 186, 23),
                  ),
                  title: Text('Wawan'),
                  subtitle: Text('mahasiswa'),
                  trailing: Icon(Icons.favorite_border),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 186, 23),
                  ),
                  title: Text('Marvin'),
                  subtitle: Text('mahasiswa'),
                  trailing: Icon(Icons.favorite_border),
                ),
                 ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 186, 23),
                  ),
                  title: Text('Marvin'),
                  subtitle: Text('mahasiswa'),
                  trailing: Icon(Icons.favorite_border),
                ),
                 ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 186, 23),
                  ),
                  title: Text('Marvin'),
                  subtitle: Text('mahasiswa'),
                  trailing: Icon(Icons.favorite_border),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 162, 186, 23),
                  ),
                  title: Text('Marvin'),
                  subtitle: Text('mahasiswa'),
                  trailing: Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
