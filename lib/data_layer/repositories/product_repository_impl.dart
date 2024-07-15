// data/repositories/product_repository_impl.dart

import '../../business_layer/entities/product.dart';
import '../../business_layer/repositories/product_repository.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    return remoteDataSource.getProducts();
  }
}
