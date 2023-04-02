enum IconPath {
  logoPath('nunlogo');

  final String value;
  const IconPath(this.value);
  String get toPng => 'assets/icons/ic_$value.png';
}
