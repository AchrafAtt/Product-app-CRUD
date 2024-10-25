import 'package:product_app/data/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
   Future<void> addProduct(Product product);
}
