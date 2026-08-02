import 'package:flutter/material.dart';

void main() {
  runApp(const FoodMenuApp());
}

class FoodMenuApp extends StatelessWidget {
  const FoodMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FoodMenuScreen(),
    );
  }
}

class FoodItem {
  final String name;
  final String price;
  final String imageUrl;

  const FoodItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  // Food Menu Items matching the reference UI
  final List<FoodItem> foodItems = const [
    FoodItem(
      name: 'Cheese Burger',
      price: '₹149',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
    ),
    FoodItem(
      name: 'Veg Pizza',
      price: '₹199',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3595/3595455.png',
    ),
    FoodItem(
      name: 'Pasta',
      price: '₹179',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3480/3480618.png',
    ),
    FoodItem(
      name: 'Sandwich',
      price: '₹99',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2972/2972531.png',
    ),
    FoodItem(
      name: 'Cold Drink',
      price: '₹49',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2405/2405479.png',
    ),
    FoodItem(
      name: 'Ice Cream',
      price: '₹69',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/938/938063.png',
    ),
    FoodItem(
      name: 'Chocolate Cake',
      price: '₹149',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2682/2682411.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'ListView Example',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                leading: Image.network(
                  item.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.fastfood, size: 40, color: Colors.orange),
                ),
                title: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.green,
                    size: 26,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}