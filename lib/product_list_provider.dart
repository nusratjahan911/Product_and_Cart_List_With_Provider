import 'package:flutter/cupertino.dart';
import 'package:product_list_with_provider/product.dart';

class ProductListProvider extends ChangeNotifier {
  final List<Product> _productList = [
    Product(
      id: 1,
      name: 'IPhone 17',
      price: 250000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 2,
      name: 'IPhone 17 pro',
      price: 270000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 3,
      name: 'IPhone 17 max',
      price: 350000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 4,
      name: 'IPhone 17 small',
      price: 150000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 5,
      name: 'IPhone 17 ss',
      price: 220000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 6,
      name: 'IPhone 17 air',
      price: 2000000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 7,
      name: 'IPhone 17 nano',
      price: 100000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
    Product(
      id: 8,
      name: 'IPhone 17 nano',
      price: 100000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlv9V5xVUi60F9bcSW-j2sL6FOei1Is8FCOA&s',
    ),
  ];

  final List<Product> _cartProductList = [];



  List<Product> get productList => _productList;
  List<Product> get cartProductList => _cartProductList;

  int get cartItemCount => _cartProductList.length;  /// cart er length return krbe

  void addToCart(Product p){
    for (Product product in _cartProductList) {
      if(product.id == p.id) {
        return;
      }
    }

    ///Product? p = _cartProductList.firstWhere((p) => p.id == product.id);
    _cartProductList.add(p);
    notifyListeners();
    
}



   void removeFromCart(int id){
    _cartProductList.removeWhere((e) => e.id == id);
    notifyListeners();
   }

  bool isAlreadyCarted(int id) {
    return _cartProductList.where((e) => e.id == id).isNotEmpty;
}


}
