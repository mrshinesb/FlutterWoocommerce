class WordPressLoginModel {
  String email;
  String password;

  WordPressLoginModel({required this.email, required this.password});

  // Empty constructor
  WordPressLoginModel.empty() : email = '', password = '';

  // Copy with method
  WordPressLoginModel copyWith({String? email, String? password}) {
    return WordPressLoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  // Validation methods
  bool get isEmailValid =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  bool get isPasswordValid => password.length >= 6;

  bool get isFormValid => isEmailValid && isPasswordValid;

  // Error messages
  String? get emailError {
    if (email.isEmpty) return null;
    return isEmailValid ? null : 'Please enter a valid email';
  }

  String? get passwordError {
    if (password.isEmpty) return null;
    return isPasswordValid ? null : 'Password must be at least 6 characters';
  }

  // Convert to JSON for API request
  Map<String, dynamic> toJson() => {
    'username': email, // WordPress accepts email as username
    'password': password,
  };
}
