import 'package:flutter/material.dart';
import 'package:praktpm2/Services/model.dart';

import 'following.dart';

class UserDetail extends StatelessWidget {
  final UserData user;
  final List<UserData> following;
  const UserDetail({required this.user, required this.following});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name + ' desc'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              user.avatar,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user.address,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'follower: ${user.like}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'likes: ${user.address}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_rounded),
                        onPressed: () => _addToFollowing(context),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FollowingPage(following: following, user: user,),
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

  void _addToFollowing(BuildContext context) {
    // Cek apakah produk sudah ada di cart
    bool isUserFollow = following.contains(user);

    if (!isUserFollow) {
      // Tambahkan produk ke dalam cart
      following.add(user);

      // Tampilkan snackbar untuk memberi tahu pengguna bahwa produk berhasil ditambahkan ke dalam cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account ini berhasil anda follow')),
      );
    } else {
      // Tampilkan snackbar jika produk sudah ada di cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account ini sudah anda follow')),
      );
    }
  }
}
