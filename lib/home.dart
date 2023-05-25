import 'package:flutter/material.dart';
import 'package:praktpm2/Services/datasource.dart';
import 'package:praktpm2/Services/model.dart';
import 'package:praktpm2/searchuser.dart';

import 'userdetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiDataSource _dataSource = ApiDataSource();
  bool isLiked = false;


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
        child: FutureBuilder<List<UserData>>(
            future: _dataSource.getData(),
            builder: (context, dataUsers) {
              if (dataUsers.hasData) {
                return ListView.builder(
                itemCount: dataUsers.data!.length,
                  itemBuilder: (context, index) {
                    final user = dataUsers.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.city),
                      trailing: IconButton(
                        icon: Icon(
                          isLiked ? Icons.thumb_up_alt_outlined : Icons.thumb_up_rounded,
                          color: isLiked ? Colors.blue : null,
                        ),
                        onPressed: () {
                          // Aksi yang ingin dilakukan saat ikon like ditekan
                          setState(() {
                            isLiked = !isLiked;
                          });
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
                );
              } else if (dataUsers.hasError) {
                return Text('${dataUsers.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
