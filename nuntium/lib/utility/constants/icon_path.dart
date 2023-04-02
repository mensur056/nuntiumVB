enum IconPath {
  logoPath('nunLogo');

  final String value;
  const IconPath(this.value);
  String get toPng => 'assets/icon/ic_$value.png';
}
