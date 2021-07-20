class LoginModel {
  String _name;
  String _passord;

  LoginModel();

  String get name => _name;

  String get passord => _passord;

  set passord(String value) {
    _passord = value;
  }

  set name(String value) {
    _name = value;
  }
}
