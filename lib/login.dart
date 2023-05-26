import 'package:flutter/material.dart';
import 'package:praktpm2/home1.dart';

import 'Services/usermodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isErrorVisible = false;

  void _login() {
    // Ambil nilai dari input username dan password
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Validasi username dan password
    bool isUserValid = false;
    for (User user in userList) {
      if (user.username == username && user.password == password) {
        isUserValid = true;
        break;
      }
    }

    if (isUserValid) {
      // Berhasil login
      setState(() {
        _isErrorVisible = false;
      });
      // Navigasi ke halaman selanjutnya
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage1(),
        ),
      );

    } else {
      // Gagal login
      setState(() {
        _isErrorVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 50.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              Visibility(
                visible: _isErrorVisible,
                child: Text(
                  'Invalid username or password',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
