import 'package:flutter/foundation.dart';

class TuyenDungPageModel with ChangeNotifier, DiagnosticableTreeMixin {
  late bool _loadingKHCV = false;

  bool get loadingKHCV => _loadingKHCV;
  set loadingKHCV(value) => _loadingKHCV = value;
}
