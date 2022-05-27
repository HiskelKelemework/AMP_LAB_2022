abstract class AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String pass;
  Login({required this.email, required this.pass});
}

class Signup extends AuthEvent {}
