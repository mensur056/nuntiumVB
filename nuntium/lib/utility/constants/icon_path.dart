enum SignInIcon { google, facebook, locked, email }

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
