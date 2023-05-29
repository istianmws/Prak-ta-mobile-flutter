import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:praktpm2/Services/model.dart';

class Region {
  final String name;
  final double currency;
  final int time;
  final String sym;

  Region({required this.time,required this.sym, required this.name, required this.currency});
}

class CartPage extends StatefulWidget {
  final List<ProductData> cart;
  final ProductData product;

  CartPage({required this.cart, required this.product});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Region> regions = [
    Region(name: 'Jakarta', currency: 14874.25, time: 7,sym: 'IDR'),
    Region(name: 'Bali', currency: 14874.25, time: 8, sym: 'IDR'),
    Region(name: 'Maluku', currency: 14874.25, time: 9, sym: 'IDR'),
    Region(name: 'Jepang', currency: 137.89, time: 9, sym: 'JPY'),
    Region(name: 'London', currency: 0.8, time: 0, sym: 'GBP'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tampilkan daftar produk dalam cart
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final product = widget.cart[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
            // Tombol pilih negara
            ElevatedButton(
              onPressed: () => _showCountryPicker(context),
              child: Text('Pilih Negara'),
            ),

            // Tombol checkout
            ElevatedButton(
              onPressed: () => _checkout(context),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView.builder(
            itemCount: regions.length,
            itemBuilder: (context, index) {
              final country = regions[index];
              return ListTile(
                title: Text(country.name),
                onTap: () => _selectCountry(context, country),
              );
            },
          ),
        );
      },
    );
  }

  void _selectCountry(BuildContext context, Region regions) {
    // Mendapatkan waktu saat ini dalam zona waktu yang sesuai
    String currentTime = DateFormat('HH:mm', 'en_US').format(DateTime.now().toUtc().add(Duration(hours: regions.time)));

    // Mengubah harga jual menjadi mata uang negara yang dipilih
    double convertedPrice =  widget.product.price * regions.currency;

    String formattedPrice = convertedPrice.toStringAsFixed(0);

    // Memformat angka ribuan dengan pembulatan ke atas
    final formatter = NumberFormat('#,###');
    String formattedPriceWithCommas = formatter.format(double.parse(formattedPrice));

    // Tampilkan harga yang telah diubah
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Harga dalam ${regions.sym} : $formattedPriceWithCommas | Waktu: $currentTime')),
    );

    Navigator.pop(context);
  }

  void _checkout(BuildContext context) {
    // Lakukan logika checkout di sini
    // Misalnya, melakukan pembayaran, mengosongkan cart, atau mengirim pesanan ke server

    // Tampilkan snackbar atau dialog untuk memberi tahu pengguna bahwa checkout berhasil dilakukan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Checkout berhasil dilakukan')),
    );

    // Kosongkan cart setelah checkout
    widget.cart.clear();

    // Kembali ke halaman sebelumnya (misalnya, halaman produk)
    Navigator.pop(context);
  }
}


