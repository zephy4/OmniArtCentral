class RequestRegisterModel {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? country;
  final String? role;
  final String? verificationType;
  final String? password;
  final String? confirmPassword;

  const RequestRegisterModel({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.country,
    this.role,
    this.verificationType,
    this.password,
    this.confirmPassword,
  });

  factory RequestRegisterModel.fromJson(Map<String, dynamic> json) => RequestRegisterModel(
        fullName: json['fullName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        country: json['country'] as String?,
        role: json['role'] as String?,
        verificationType: json['isVerifiedType'] as String?,
        password: json['password'] as String?,
        confirmPassword: json['confirmPassword'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'country': country,
        'role': role,
        'isVerifiedType': verificationType,
        'password': password,
        'confirmPassword': confirmPassword,
      }..removeWhere((key, value) => value == null);

  RequestRegisterModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? country,
    String? role,
    String? verificationType,
    String? password,
    String? confirmPassword,
  }) {
    return RequestRegisterModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      role: role ?? this.role,
      verificationType: verificationType ?? this.verificationType,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  String toString() {
    return 'RequestRegisterModel(fullName: $fullName, email: $email, phoneNumber: $phoneNumber, country: $country, role: $role, verificationType: $verificationType, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RequestRegisterModel &&
        other.fullName == fullName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.country == country &&
        other.role == role &&
        other.verificationType == verificationType &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode => Object.hash(
        fullName,
        email,
        phoneNumber,
        country,
        role,
        verificationType,
        password,
        confirmPassword,
      );
}
