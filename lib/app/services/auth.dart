import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jethi_tech/app/data/user.dart';

enum AuthState { uninit, authenticated, unauthenticated }

class AuthService extends GetxService {
  final _authState = AuthState.uninit.obs;
  AuthState get authState => _authState.value;
  final currentUser = Rx<User?>(null);
  late Box _userBox;

  @override
  void onReady() {
    init();
  }

  Future<void> init() async {
    _userBox = await Hive.openBox<List<User>>('users');
    final appState = await Hive.openBox('app_state');
    String? loggedInId = appState.get('loggedIn');
    if (loggedInId == null) {
      _authState.value = AuthState.unauthenticated;
      return;
    } else {
      currentUser.value = _userBox.get(loggedInId);
      _authState.value = AuthState.authenticated;
    }
  }

  Future<void> onLoginClicked(String id, Function() onFirstTimeLogin) async {
    final User? userData = await _userBox.get(id);
    if (userData == null) {
      onFirstTimeLogin();
    } else {
      currentUser.value = userData;
    }
  }

  void saveAdditionalUserData(User user) async {
    currentUser.value?.age = user.age;
    currentUser.value?.gender = user.gender;
    currentUser.value?.save();
  }
}
