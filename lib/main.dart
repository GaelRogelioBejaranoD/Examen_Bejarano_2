import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Membresia {
  final String idMem, idCliente;
  final double costo;
  Membresia(this.idMem, this.idCliente, this.costo);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MembresiasScreen(),
    );
  }
}

class MembresiasScreen extends StatelessWidget {
  final membresias = [
    Membresia('M001', 'C001', 100.0),
    Membresia('M002', 'C002', 150.0),
    Membresia('M003', 'C003', 200.0),
    Membresia('M004', 'C004', 250.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bejarano Examen 1154',
            style: TextStyle(fontSize: 26, color: Colors.white)),
        backgroundColor: Color(0xff4b96db),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: membresias.length,
        itemBuilder: (context, index) {
          final membresia = membresias[index];
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getColor(index),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID Membresía: ${membresia.idMem}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('ID Cliente: ${membresia.idCliente}',
                    style: TextStyle(fontSize: 16)),
                Text('Costo: \$${membresia.costo.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 16),
      ),
    );
  }

  Color _getColor(int index) {
    return [
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.purple.shade100
    ][index % 4];
  }
}
