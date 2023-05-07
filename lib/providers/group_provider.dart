import 'package:flutter/foundation.dart';
import 'package:splitbuddie/Models/main_group_model.dart';
import 'package:splitbuddie/Models/user.dart';

class GroupProvider extends ChangeNotifier {
  Group _group = Group(
    adminUserId: "",
    groupId: "",
    groupName: "",
    groupType: "",
    groupMembers: [],
  );

  Group get group => _group;

  void setUser(String user) {
    print(user);
    _group = Group.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(Group group) {
    _group = group;
    notifyListeners();
  }
}
