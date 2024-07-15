// presentation/screens/home_screen.dart

import 'package:flutter/material.dart';

import '../../business_layer/entities/product.dart';
import '../../business_layer/use_cases/get_products_usecase.dart';

class HomeScreen extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;

  const HomeScreen({super.key, required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: getProductsUseCase.execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                      leading: CircleAvatar(
                        child: product.image.isNotEmpty
                            ? Image(image: NetworkImage(product.image))
                            : const Placeholder(),
                      ),

                      // SizedBox(
                      //   height: 20,
                      //   width: 20,
                      //   child: product.image.isNotEmpty
                      //       ? Image(image: NetworkImage(product.image))
                      //       : const Placeholder(), // Placeholder for cases where image URL is empty
                      // ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
