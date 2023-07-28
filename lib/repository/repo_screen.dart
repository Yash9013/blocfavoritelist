import 'dart:convert';
import 'dart:developer';
import 'package:blocproject/utils/api_url.dart';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<UserModel>> fetchUsers() async {
    List<UserModel> userData = [];
    final response = await http.get(Uri.parse(ApiUrls.userUrl));

    if (response.statusCode == 200) {
      try {
        List result = jsonDecode(response.body) as List;

        List<UserModel> userList =
            result.map((user) => UserModel.fromJson(user)).toList();
        userData = userList;

        return userList;
      } catch (error) {
        log('Failed to fetch user data');
      }
    } else {
      log('something went wrong ${response.reasonPhrase}');
    }
    return userData;
  }
}
