class About {
  final String title;
  final List<Copyright> copyrights;

  About({this.title, this.copyrights});

  static About get defaultAbout {
    return About(
        title:
            "Made by Rabiu Aliyu\n\nCopyright©2020 Nigeria. All Rights Reserved",
    );
  }
}

class Copyright {
  final String title;
  final String license;

  Copyright({this.title, this.license});
}

