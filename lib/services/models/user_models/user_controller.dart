import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation_project/services/models/user_models/user_database.dart';
import 'package:graduation_project/services/models/user_models/user_model.dart';

final userProvider = StateNotifierProvider<UserState, List<UserModel>>((ref) {
  return UserState();
});

class UserState extends StateNotifier<List<UserModel>> {
  UserState() : super([]);

  List State = [];

  void refresh() async {
    final data = await DbHelper.getUser();

    state = data.map((e) => UserModel.fromJson(e)).toList();
    print(state);
    State = state;
  }

  Future<String> getToken() async {
    return State[0]["token"];
  }
}
