abstract class LoginEvent {}

class LoginClickedEvent extends LoginEvent{
  final String email;
  final String password;

  LoginClickedEvent({required this.email, required this.password});

}