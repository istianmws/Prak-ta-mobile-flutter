import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:praktpm2/Account/listaccount.dart';
import 'package:praktpm2/about.dart';
import 'package:praktpm2/Product/listproduct.dart';
import 'package:praktpm2/login.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  void signUserOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  int _pageindex = 0;

  List<Widget> _pages = [
    HomePage1(),
    ListProduct(username: 'User!'),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white12,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.purple[100],
        index: _pageindex,
        items: <Widget>[
          Icon(Icons.people_rounded, size: 30),
          Icon(Icons.shopping_bag_rounded, size: 30),
          Icon(Icons.settings, size: 30,),
          Icon(Icons.logout_rounded, size: 30),
        ],
        onTap: (index) {
          if (index == 3) {
            signUserOut();
          } else {
            setState(() {
              _pageindex = index;
            });
          }
        },
      ),
      body: _pages[_pageindex],
    );
  }
}

