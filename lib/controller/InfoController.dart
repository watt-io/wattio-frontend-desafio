class InfoController {
  late final List<bool> selectedOptions = <bool>[false, false];

  bool validateName = false, validateMoney = false;

  bool verifyFields() {
    if (!validateName) {
      return false;
    }

    if (!validateMoney) {
      return false;
    }

    return true;
  }

  String textRegex(String text) =>
      text.replaceAll("R\$\:", "").split(",").join("").trim();

  bool verifyRange(String text) {
    var value = textRegex(text);

    if (double.parse(value) >= 1000.00 && double.parse(value) <= 100000.00) {
      return true;
    } else {
      return false;
    }
  }
}
