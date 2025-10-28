import 'package:flutter/material.dart';
import 'package:product_list_with_provider/cart_list_screen.dart';
import 'package:product_list_with_provider/product.dart';
import 'package:product_list_with_provider/product_list_provider.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List.."),
        centerTitle: true,
        actions: [
          Consumer<ProductListProvider>(
            builder: (context, provider, child) {
              return Badge(
                ///As like notification
                label: Text(provider.cartItemCount.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => CartListScreen()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart, color: Colors.orange,),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductListProvider>(
          builder: (context, productListProvider, child) {
            return GridView.builder(
              itemCount: productListProvider.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final Product product = productListProvider.productList[index];
                final bool alreadyInCart = context
                    .read<ProductListProvider>()
                    .isAlreadyCarted(product.id);

                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(product.imageUrl, height: 75),
                        Text(product.name),
                        Text("\$${product.price}"),
                        FilledButton(
                          onPressed: () {
                            if (alreadyInCart) {
                              context
                                  .read<ProductListProvider>()
                                  .removeFromCart(product.id);
                            } else {
                              context.read<ProductListProvider>().addToCart(
                                product,
                              );
                            }
                          },
                          child: Text(alreadyInCart ? 'Remove' : 'Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
