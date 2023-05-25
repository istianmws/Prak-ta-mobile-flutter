import 'package:flutter/material.dart';
import 'package:praktpm2/Services/datasource.dart';
import 'package:praktpm2/Services/model.dart';
import 'package:praktpm2/searchuser.dart';
import 'userdetail.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final ApiDataSource _dataSource = ApiDataSource();
  List<UserData> dataUsers = [];
  List<bool> isLikedList = [];
  List<UserData> following = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final users = await _dataSource.getData();
    setState(() {
      dataUsers = users;
      isLikedList = List.generate(users.length, (index) => false);
    });
  }

  void toggleLikeStatus(int index) {
    setState(() {
      isLikedList[index] = !isLikedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dataUsers.length,
          itemBuilder: (context, index) {
            final user = dataUsers[index];
            final isLiked = isLikedList[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
              title: Text(user.name),
              subtitle: Text(user.city),
              trailing: IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : null,
                ),
                onPressed: () {
                  _addToFollowing(user: user);
                  toggleLikeStatus(index);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetail(
                      user: user,
                      following: [],
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
  void _addToFollowing({required UserData user}) {
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
