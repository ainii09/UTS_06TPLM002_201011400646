import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOKO SEPATU AINI',
      home: ShoeStoreScreen(),
    );
  }
}

class Shoe {
  final String name;
  final String deskripsi;
  final String imageUrl;
  final double price;

  Shoe(
      {required this.name,
      required this.deskripsi,
      required this.imageUrl,
      required this.price});
}

final List<Shoe> shoes = [
  Shoe(
      name: 'Nike Free Run2',
      deskripsi: 'assets/sepatu1.jpeg',
      imageUrl: 'assets/gambar/sepatu1.jpeg',
      price: 150),
  Shoe(
      name: 'Nike Stefan Janoski Max',
      deskripsi: 'assets/sepatu2.jpeg',
      imageUrl: 'assets/gambar/sepatu2.jpeg',
      price: 200),
];

class ShoeStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoes Store Aini'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: shoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final shoe = shoes[index];

          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        shoe.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      shoe.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\$${shoe.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
