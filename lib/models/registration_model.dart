class UserRegistrationModel {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  UserRegistrationModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  // Empty constructor
  UserRegistrationModel.empty()
    : username = '',
      email = '',
      password = '',
      confirmPassword = '';

  // Copy with method
  UserRegistrationModel copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return UserRegistrationModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  // Validation methods
  bool get isUsernameValid => username.length >= 3;
  bool get isEmailValid =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  bool get isPasswordValid => password.length >= 6;
  bool get doPasswordsMatch => password == confirmPassword;
  bool get isFormValid =>
      isUsernameValid && isEmailValid && isPasswordValid && doPasswordsMatch;

  // Error messages
  String? get usernameError {
    if (username.isEmpty) return null;
    return isUsernameValid ? null : 'Username must be at least 3 characters';
  }

  String? get emailError {
    if (email.isEmpty) return null;
    return isEmailValid ? null : 'Please enter a valid email';
  }

  String? get passwordError {
    if (password.isEmpty) return null;
    return isPasswordValid ? null : 'Password must be at least 6 characters';
  }

  String? get confirmPasswordError {
    if (confirmPassword.isEmpty) return null;
    return doPasswordsMatch ? null : 'Passwords do not match';
  }

  // Convert to JSON for API request (without confirmPassword)
  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'password': password,
  };
}
