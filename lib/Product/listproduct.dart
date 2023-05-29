import 'package:flutter/material.dart';
import 'package:praktpm2/Product/detailproduct.dart';
import 'package:praktpm2/Services/datasource.dart';
import 'package:praktpm2/Services/model.dart';


class ListProduct extends StatelessWidget {
  final ApiDataSource _dataSource = ApiDataSource();
  final String username; // Add a username field
  ListProduct({Key? key, required this.username,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Product')),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<ProductData>>(
            future: _dataSource.getData1(),
            builder: (context, dataProducts) {
              if (dataProducts.hasData) {
                return ListView.builder(
                  itemCount: dataProducts.data!.length,
                  itemBuilder: (context, index) {
                    final product = dataProducts.data![index];

                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailProduct(
                              product: product, cart: [],
                            ),
                          ),
                        );

                      },
                      splashColor: Colors.grey.withOpacity(0.2),
                      highlightColor: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      child: ListTile(
                        leading: Image.network(
                          product.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: Text(product.title),
                        subtitle: Text('\$${product.price}'),
                        trailing: Column(
                          children: [
                            Icon(
                                Icons.add_shopping_cart
                            ),
                            Text(product.rating['count'].toString())
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (dataProducts.hasError) {
                return Text('${dataProducts.error}');
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
