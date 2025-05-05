import 'package:flutter/material.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({super.key});

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  // -- MOCKS START --
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Book Name...',
      'author': 'Author Name...',
      'price': 30.00,
      'quantity': 1,
      'image': null, // Здесь может быть путь к изображению
    },
    {
      'name': 'Another Book',
      'author': 'Second Author',
      'price': 30.00,
      'quantity': 1,
      'image': null,
    },
  ];
  // -- MOCKS END --

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header
            Container(
              height: 94,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Your Cart (${cartItems.length} items)',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Cart Items
            Expanded(
              child: ListView(
                children: cartItems.map((item) => _buildCartItem(item)).toList(),
              ),
            ),
            const Divider(),
            // Subtotal and Pay Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '\$${subtotal.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/payment");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Pay with stripe',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Image or placeholder
          Container(
            width: 60,
            height: 80,
            color: Colors.grey[300],
            child: item['image'] == null
                ? const Icon(Icons.book, size: 40)
                : Image.asset(item['image'], fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${item['price'].toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item['author'],
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Quantity controls and delete
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (item['quantity'] > 1) item['quantity']--;
                      });
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text('${item['quantity']}', style: const TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        item['quantity']++;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    cartItems.remove(item);
                  });
                },
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
