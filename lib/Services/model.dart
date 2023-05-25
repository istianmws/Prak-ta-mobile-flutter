class UserData {
  final String createdAt;
  final String name;
  final String avatar;
  final String like;
  final String address;
  final String city;
  final String job;
  final String id;

  UserData({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.like,
    required this.address,
    required this.city,
    required this.job,
    required this.id
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      createdAt : json['createdAt'],
      name : json['name'],
      avatar : json['avatar'],
      like : json['like'],
      address : json['address'],
      city : json['city'],
      job : json['job'],
      id : json['id'],
    );
  }
}
