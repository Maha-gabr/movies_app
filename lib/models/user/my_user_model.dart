class MyUser {
  static const String collectionName = 'Users';
  final String name ;
  final String email ;
  final String id ;
  final String phone ;
  final String avatar;
  final String pass;
  const MyUser({required this.name, required this.id , required this.email, required this.phone, required this.avatar, required this.pass});

  // from json
  // map => object
  MyUser.fromJson(Map <String , dynamic> json):this(
      id: json["id"],
      name: json["name"],
      email: json['email'],
    phone: json['phone'],
    avatar: json['avatar'],
    pass: json['pass']
  );

  // to json
// object => map
  Map<String ,dynamic> toJson(){
    return {
      "name" :name,
      "email": email,
      "id" : id,
      "phone" : phone,
      "avatar": avatar,
      "pass": pass
    };
  }

  MyUser copyWith({
    String? name,
    String? email,
    String? id,
    String? phone,
    String? avatar,
    String? pass,
  }) {
    return MyUser(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      pass: pass ?? this.pass,
    );
  }

}