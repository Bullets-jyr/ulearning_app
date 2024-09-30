import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/global.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  UserProfile build() {
    return Global.storageService.getUserProfile();
  }
}
