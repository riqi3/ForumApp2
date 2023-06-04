const tokenBox = 'NOTEPADTOKEN';

const _base = 'http://10.0.2.2:8000/';
const _user = 'user/user/';
const _tokenUser = _base + _user;
final userUri = Uri.parse(_tokenUser);

 
const _login = 'user/login/';
const _register = 'user/register/';
 
const _logout = 'usera/api-auth/logout/';

const _tokenLogin = _base + _login;
const _tokenRegister = _base + _register;
const _tokenLogout = _base + _logout;

  final registrationUri = Uri.parse(_tokenRegister);
  final loginUri = Uri.parse(_tokenLogin);
  final logoutUri = Uri.parse(_tokenLogout);