class SignupModel {
  final String name;
  final String email;
  final String password;

  SignupModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
  