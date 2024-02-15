class UserInfo {
  String name;
  String email;

  UserInfo({required this.name, required this.email});

    // Define the toJson method as required by Get Storage
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      UserInfo(name: json['name'], email: json['email']);
}

