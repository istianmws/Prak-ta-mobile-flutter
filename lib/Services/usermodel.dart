class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

// Daftar pengguna
List<User> userList = [
  User(username: 'user1', password: 'password1'),
  User(username: 'user2', password: 'password2'),
  User(username: 'user3', password: 'password3'),
  User(username: 'nvmermind', password: 'nvm123'),
  User(username: 'nagamrain', password: 'rainnagam')
  // Tambahkan pengguna lain sesuai kebutuhan
];
