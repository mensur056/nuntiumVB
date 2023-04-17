enum SignInIcon { google, facebook, locked, email, save }

extension SignInIconPath on SignInIcon {
  String toPath() {
    return 'assets/icons/ic_$name.png';
  }
}

enum IconSplash { nunlogo }

extension IconSplashPath on IconSplash {
  String toPath() {
    return 'assets/icons/ic_$name.png';
  }
}

enum HomeIcon {
  mic,
  search,
  save,
  profile,
  home,
  apps,
}

extension HomeIconExtension on HomeIcon {
  String toPath() {
    return 'assets/icons/ic_$name.png';
  }
}
