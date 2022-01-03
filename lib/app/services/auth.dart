import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jethi_tech/app/data/user.dart';

enum AuthState { uninit, authenticated, unauthenticated }

class AuthService extends GetxService {
  final _authState = AuthState.uninit.obs;
  bool get isInitialised => _authState.value != AuthState.uninit;
  AuthState get authState => _authState.value;
  final _currentUser = Rx<User?>(null);
  User? get currentUser => _currentUser.value;
  bool get loggedIn => _currentUser.value != null;
  late Box<User> _userBox;
  Box? _appState;
  @override
  void onReady() {
    _currentUser.listen((user) async {
      if (user == null) {
        return;
      }
      _appState?.put("loggedIn", user.id);
    });
    init();
  }

  Future<void> init() async {
    _userBox = await Hive.openBox<User>('users');
    _appState = await Hive.openBox('app_state');
    String? loggedInId = _appState?.get('loggedIn');
    if (loggedInId == null) {
      _authState.value = AuthState.unauthenticated;
      return;
    } else {
      _currentUser.value = _userBox.get(loggedInId);
      _authState.value = AuthState.authenticated;
    }
  }

  Future<void> onLoginClicked(User user, Function() onFirstTimeLogin) async {
    final User? userData = _userBox.get(user.id);
    if (userData == null) {
      _currentUser.value = user;
      onFirstTimeLogin();
    } else {
      _currentUser.value = userData;
    }
  }

  void saveAdditionalUserData(User user) async {
    _currentUser.value?.age = user.age;
    _currentUser.value?.gender = user.gender;
    _userBox.put(user.id, user);
    _currentUser.value?.save();
  }

  void logout() {
    _currentUser.value = null;
  }
}
