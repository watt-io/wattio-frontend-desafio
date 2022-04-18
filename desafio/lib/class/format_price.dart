mixin FormatPrice {
  String formatWithDecimal(value) {
    String temp = value.toStringAsFixed(2);
    temp = temp.replaceAll('.', ',');
    if (temp.length >= 7) {
      temp = temp.substring(0, temp.length - 6) + '.' + temp.substring(temp.length - 6, temp.length);
    }
    return temp;
  }

  String formatWithoutDecimal(value) {
    String temp = value.toStringAsFixed(0);
    if (temp.length >= 4) {
      temp = temp.substring(0, temp.length - 3) + '.' + temp.substring(temp.length - 3, temp.length);
    }
    return temp;
  }
}
