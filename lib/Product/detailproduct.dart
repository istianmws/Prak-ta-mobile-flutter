import 'package:flutter/material.dart';
import 'package:praktpm2/Product/cart.dart';
import 'package:praktpm2/Services/model.dart';

class DetailProduct extends StatelessWidget {
  final ProductData product;
  final List<ProductData> cart;

  const DetailProduct({required this.product, required this.cart});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.image,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price: \$${product.price}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rating: ${product.rating['rate']} (${product.rating['count']} reviews)',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () => _addToCart(context),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(cart: cart, product: product,),
                            ),
                          );
                        },
                        child: Text('Checkout'),
                      ),
                    ],
                  ),
                  // Tombol checkout

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    // Cek apakah produk sudah ada di cart
    bool isProductInCart = cart.contains(product);

    if (!isProductInCart) {
      // Tambahkan produk ke dalam cart
      cart.add(product);

      // Tampilkan snackbar untuk memberi tahu pengguna bahwa produk berhasil ditambahkan ke dalam cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produk berhasil ditambahkan ke dalam cart')),
      );
    } else {
      // Tampilkan snackbar jika produk sudah ada di cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produk sudah ada di dalam cart')),
      );
    }
  }

}


