import 'dart:convert';

class User {
  String name;
  String email;
  String pass;

  User({
    required this.name,
    required this.email,
    required this.pass,
  });

  User copyWith({
    String? name,
    String? email,
    String? pass,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      pass: pass ?? this.pass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'pass': pass,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      pass: map['pass'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email, pass: $pass)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.pass == pass;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ pass.hashCode;
}
