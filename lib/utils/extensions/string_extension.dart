extension DoubleParsing on String {
  double toDoubleSafe() {
    try {
      return double.parse(this);
    } catch (e) {
      return 0.0; // Giá trị mặc định nếu không thể chuyển đổi
    }
  }
}
