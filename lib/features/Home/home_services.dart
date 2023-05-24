import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitbuddie/Models/get_user_model.dart';
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/logger.dart';

class HomeServices {
  Future<UserModel?> getUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString("id");
    http.Response res = await http.get(Uri.parse("$uri/api/get-user/$userId"));
    print("----------------------------------------");
    if (res.statusCode == 200) {
      UserModel user = userModelFromJson(res.body);
      logger.i("Get user Api $res");
      return user;
    }
  }
}
