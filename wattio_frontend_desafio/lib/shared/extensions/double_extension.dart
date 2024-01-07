extension PercentageFormatting on double {
  String formatAsPercentage() {
    String formattedPercentage = '${(this * 100).toStringAsFixed(2)}%';
    return formattedPercentage;
  }
}
