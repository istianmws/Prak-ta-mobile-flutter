import 'package:flutter/material.dart';
import 'package:praktpm2/Services/model.dart';

import 'Services/datasource.dart';
import 'userdetail.dart';

class SearchUser extends SearchDelegate {

  final ApiDataSource _dataSource= ApiDataSource();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Expanded(
      child: FutureBuilder<List<UserData>>(
          future: _dataSource.getData(query: query),
          builder: (context, dataUsers){
            if (dataUsers.hasData){
              final List<UserData> users = dataUsers.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: ( context,  index) {
                  final user = users[index];
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetail(
                            user: user, following: [],
                          ),
                        ),
                      );

                    },
                    splashColor: Colors.grey.withOpacity(0.2),
                    highlightColor: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.city),
                      onTap: () {
                        // Aksi yang ingin dilakukan ketika tile diklik
                      },
                    ),
                  );
                },
              );
            }else if(dataUsers.hasError){
              return Text('${dataUsers.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(
      child: Text('Search User'),
    );
  }
}
