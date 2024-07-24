import 'package:flutter/material.dart';

class HomeScreenList extends StatefulWidget {
  const HomeScreenList({super.key});

  @override
  _HomeScreenListState createState() => _HomeScreenListState();
}

class _HomeScreenListState extends State<HomeScreenList> {
  final List<Map<String, String>> _allProducts = [
    {
      'image': 'https://example.com/images/product1.jpg',
      'name': 'Fresh Tomatoes',
      'price': 'KSh 150.00'
    },
    {
      'image': 'https://example.com/images/product2.jpg',
      'name': 'Organic Potatoes',
      'price': 'KSh 200.00'
    },
    {
      'image': 'https://example.com/images/product3.jpg',
      'name': 'Green Lettuce',
      'price': 'KSh 120.00'
    },
  ];

  List<Map<String, String>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) =>
              product['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: _filterProducts,
                ),
                const SizedBox(height: 16.0),
                // Add additional filters here if needed, e.g., dropdown
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ProductListItem(
                  image: product['image']!,
                  name: product['name']!,
                  price: product['price']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductListItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.error, color: Colors.red),
              );
            },
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          price,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
