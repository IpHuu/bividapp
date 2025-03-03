import 'package:local_auth/local_auth.dart';

class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Kiểm tra thiết bị có hỗ trợ vân tay/FaceID không
  Future<bool> isBiometricAvailable() async {
    print(await _localAuth.isDeviceSupported());
    print(await _localAuth.canCheckBiometrics);
    return await _localAuth.canCheckBiometrics ||
        await _localAuth.isDeviceSupported();
  }

  /// Lấy danh sách các phương thức sinh trắc học có sẵn
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await _localAuth.getAvailableBiometrics();
  }

  /// Hiển thị popup xác thực bằng vân tay/FaceID
  Future<bool> authenticate() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: "Xác thực sinh trắc học để đăng nhập",
        options: const AuthenticationOptions(
            biometricOnly: true, // Chỉ dùng sinh trắc học
            stickyAuth: true, // Giữ trạng thái xác thực khi mở lại app
            useErrorDialogs: true // Hiển thị thông báo lỗi
            ),
      );
    } catch (e) {
      print("Lỗi xác thực: $e");
      return false;
    }
  }
}
