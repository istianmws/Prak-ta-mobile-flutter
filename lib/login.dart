import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:praktpm2/container_page.dart';
import 'package:praktpm2/listaccount.dart';
import 'package:praktpm2/register.dart';
import 'Services/user_hive.dart';
import 'Services/enkripsian.dart';

class LoginPage extends StatefulWidget {

  final Function()? onTap;

  const LoginPage({Key? key, this.onTap}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isErrorVisible = false;
  bool _isPasswordHidden = true;


  Future<void> _login() async {
    // Ambil nilai dari input username dan password
    String username = _usernameController.text;
    String password = _passwordController.text;
    String temppass = '';//EncryptionUtils.encryptString(password);
    // Buka box Hive 'users'
    var box = await Hive.openBox<UserHive>('users');

    // Cek apakah user valid
    bool isUserValid = false;
    for (var i = 0; i < box.length; i++) {
      UserHive user = box.getAt(i)!;
      temppass = EncryptionUtils.decryptString(user.password);
      if (user.username == username && password == temppass) {
        isUserValid = true;
        break;
      }
    }

    if (isUserValid) {
      // Berhasil login
      setState(() {
        _isErrorVisible = false;
      });

      // Tampilkan Snackbar dengan pesan berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login berhasil!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigasi ke halaman selanjutnya
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ContainerPage(),
        ),
      );
    } else {
      // Gagal login
      setState(() {
        _isErrorVisible = true;
      });
      // Tampilkan Snackbar dengan pesan gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login gagal!'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    // Mengatur ulang nilai controller _passwordController
    _passwordController = TextEditingController.fromValue(
      TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height:50),
              //logo
              const Icon(
                Icons.ac_unit_rounded,
                size: 100,
              ),

              const SizedBox(height:50),
              //welcome
              Center(
                child: Text(
                  'Selamat Datang, Silahkan Login!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              TextField(
                controller: _usernameController,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  labelText: 'Username',
                ),

              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                    child: Icon(
                      _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
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
                child: const Center(
                  child: Text(
                    'Perika kembali username & password Anda',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height:50),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
