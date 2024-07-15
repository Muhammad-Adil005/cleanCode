import 'package:clean_code_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'business_layer/use_cases/get_products_usecase.dart';
import 'data_layer/data_sources/product_remote_data_source.dart';
import 'data_layer/repositories/product_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepositoryImpl(ProductRemoteDataSource());
    final getProductsUseCase = GetProductsUseCase(productRepository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: HomeScreen(getProductsUseCase: getProductsUseCase),
    );
  }
}
