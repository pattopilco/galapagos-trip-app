class Content {
  final String subtitle;
  final String textContent;
  final String imageTitle;

  Content(
      {required this.subtitle,
      required this.textContent,
      required this.imageTitle});

  Content empty() {
    return Content(subtitle: '', textContent: '', imageTitle: '');
  }

  static Content init() {
    return Content(
        subtitle: '',
        textContent:
            'The archipelago is a group of 19 islands: 13 large and 6 small along with dozens of islets. Its closest point to the mainland of Ecuador is 600 miles from the western coast.\n\nThe Galapagos features some of the world’s most unique and endemic species and beautiful beaches that rank among the world’s best. ...And this is why it’s renowned as an iconic tourist destination.',
        imageTitle: 'assets/images/galapagos/description/gps_map.png');
  }

  static List<Content> listInit() {
    final List<Content> list = [];
    list.add(Content.init());
    return list;
  }

  static List<Content> parseContents(List<dynamic> listContents) {
    List<Content> empty = [];
    if (listContents.isEmpty) return empty;
    return listContents.map<Content>((json) => Content.fromJson(json)).toList();
  }

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
        subtitle: json['subtitle'],
        textContent: json['textContent'],
        imageTitle: json['imageTitle']);
  }
}
