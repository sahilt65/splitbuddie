import 'package:flutter/foundation.dart';
import 'package:splitbuddie/Models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    name: "",
    email: "",
    mob: "",
    password: "",
    token: "",
    groupDetails: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
