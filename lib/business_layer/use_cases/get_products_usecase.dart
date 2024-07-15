// domain/usecases/get_products_usecase.dart

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> execute() async {
    return repository.getProducts();
  }
}
