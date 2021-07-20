class SignUpModel {
  String _name;
  String _passord;
  String _email;
  String _phoneNo;
  String _profession;

  SignUpModel();

  String get passord => _passord;

  String get name => _name;

  String get email => _email;

  String get phoneNo => _phoneNo;

  set passord(String value) {
    _passord = value;
  }

  set name(String value) {
    _name = value;
  }

  String get profession => _profession;

  set profession(String value) {
    _profession = value;
  }

  set phoneNo(String value) {
    _phoneNo = value;
  }

  set email(String value) {
    _email = value;
  }
}
