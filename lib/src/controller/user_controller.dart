import 'package:get/get.dart';
import 'package:truck_ease/src/model/user_model.dart';

var currentUser = UserModel(
  uid: "1",
  name: 'John Doe',
  email: 'test@mail.com',
  phoneNumber: '000 123 456',
);

class UserController extends GetxController {
  Future<void> updateUser(UserModel userModel) {
    currentUser = userModel;
    return Future.delayed(const Duration(seconds: 2));
  }
}
