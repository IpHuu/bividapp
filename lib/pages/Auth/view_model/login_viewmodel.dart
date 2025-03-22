import 'package:bividpharma/model/dtos/base/auth_response.dart';
import 'package:bividpharma/model/dtos/setting_app/setting_app.dart';
import 'package:bividpharma/services/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import '../../../services/local/local_auth_service.dart';
import '../../../utils/local_share_preference.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final BiometricAuthService _biometricAuthService = BiometricAuthService();
  bool _isBiometricAvailable = false;

  bool get isBiometricAvailable => _isBiometricAvailable;
  String? _errorMessage;
  bool _loginLoading = false;
  bool _rememberMe = false;

  LoginViewModel() {
    checkBiometricSupport();
    _loadRememberMe();
  }

  bool get isRememberMe => _rememberMe;
  bool get isLoading => _loginLoading;
  String? get errorMessage => _errorMessage;

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  /// Kiểm tra xem thiết bị có hỗ trợ vân tay không
  Future<void> checkBiometricSupport() async {
    _isBiometricAvailable = await _biometricAuthService.isBiometricAvailable();
    notifyListeners();
  }

  /// Đăng nhập bằng vân tay
  Future<bool> loginWithBiometrics() async {
    if (!isBiometricAvailable) {
      _errorMessage = "Bạn chưa thiết lập vân tay hoặc Face ID";
      return false;
    }
    bool isAuthenticated = await _biometricAuthService.authenticate();
    if (isAuthenticated) {
      print("Xác thực vân tay thành công!");

      // // Lấy token đã lưu
      String? tokenId = SharedPreferencesManager.instance.userInfo?.tokenId;
      SharedPreferencesManager.instance.saveIsLogin = true;
      return true;
    } else {
      _errorMessage = "Xác thực thất bại";
      notifyListeners();
      print("Xác thực vân tay thất bại.");
      return false;
    }
  }

  Future<void> _loadRememberMe() async {
    final prefs = SharedPreferencesManager();
    SettingApp settingApp = prefs.getSettingApp(); // Giả sử là async
    _rememberMe = settingApp.rememberMe;
    if (_rememberMe) {
      _loadLoginInfo();
    }
    notifyListeners();
  }

  Future<void> _loadLoginInfo() async {
    final prefs = SharedPreferencesManager();
    SettingApp settingApp = prefs.getSettingApp();
    String? savedUsername = settingApp.cachedUserCode;
    if (savedUsername != null) {
      emailController.text = savedUsername;
    }
  }

  Future<bool> login() async {
    String username = emailController.text;
    String password = passController.text;

    if (username.isEmpty || password.isEmpty) {
      _errorMessage = "Vui lòng nhập thông tin đăng nhập đầy đủ";
      notifyListeners();
      return false;
    }
    _loginLoading = true;
    _errorMessage = null;
    notifyListeners();
    final response = await AuthProvider.login(username, password);
    bool loginSuccess = false;
    response.fold((error) {
      _loginLoading = false;
      _errorMessage = "Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin";
      notifyListeners();
    }, (result) {
      // LoginResponse? authResponse = result;
      AuthResponse? authResponse = result;
      if (authResponse.result != null &&
          authResponse.result!.tokenId.isNotEmpty) {
        _loginLoading = false;
        notifyListeners();

        SharedPreferencesManager.instance.saveAccessToken =
            authResponse.result!.tokenId;
        // MUser? user = authResponse;
        // SharedPreferencesManager.instance.saveUserInfo(user);
        SharedPreferencesManager.instance.saveIsLogin = true;

        handleRememberLogin(username);
        loginSuccess = true;
      } else {
        _loginLoading = false;
        _errorMessage = "Đăng nhập thất bại";
        notifyListeners();
      }
    });
    return loginSuccess;
  }

  void handleRememberLogin(String username) {
    final prefs = SharedPreferencesManager();
    SettingApp settingApp = prefs.getSettingApp();
    SettingApp updateSetting = settingApp.copyWith(
      cachedUserCode: username,
      rememberMe: _rememberMe,
    );
    prefs.saveSettingApp(updateSetting);
  }

  void logout() {
    SharedPreferencesManager.instance.clearUserInfo();
    SharedPreferencesManager.instance.saveIsLogin = false;
  }

  void showDialog(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void closeDialog() {
    _errorMessage = null;
    notifyListeners();
  }
}
