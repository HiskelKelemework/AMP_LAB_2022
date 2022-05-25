abstract class AuthState {}

class Idle extends AuthState {}

class LogingIn extends AuthState {}

class LoginFailed extends AuthState {}

class LoginSuccessful extends AuthState {}
