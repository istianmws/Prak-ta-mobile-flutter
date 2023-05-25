import 'package:flutter/material.dart';
import 'package:praktpm2/Services/model.dart';

class FollowingPage extends StatefulWidget {
  final List<UserData> following;
  final UserData user;
  const FollowingPage({required this.following, required this.user});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
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
              itemCount: widget.following.length,
              itemBuilder: (context, index) {
                final datafollowing = widget.following[index];
                return ListTile(
                  leading: Image.network(
                    datafollowing.avatar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(datafollowing.job),
                  subtitle: Text('${datafollowing.address}'),
                );
              },
            ),
            // Tombol pilih negara
            ElevatedButton(
              onPressed: (){},
              child: Text('Pilih Negara'),
            ),

            // Tombol checkout
            ElevatedButton(
              onPressed: () => {},
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
