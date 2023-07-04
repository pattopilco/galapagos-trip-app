class Question {
  final String question;
  final String ask;
  final String imageUrl;
  final String link;

  Question(
      {required this.question,
      required this.ask,
      required this.imageUrl,
      required this.link});

  Question empty() {
    return Question(question: '', ask: '', imageUrl: '', link: '');
  }

  static Question init() {
    return Question(
        question: 'Visa',
        ask:
            'U.S., Canadian and most European citizens do not require a visa to travel to Ecuador unless they are expecting to stay longer than 90 days over the course of 1 year.',
        imageUrl: '',
        link: '');
  }

  static List<Question> listInit() {
    final List<Question> list = [];
    list.add(Question.init());
    return list;
  }

  static List<Question> parseQuestions(List<dynamic> listQuestions) {
    List<Question> empty = [];
    if (listQuestions.isEmpty) return empty;
    return listQuestions
        .map<Question>((json) => Question.fromJson(json))
        .toList();
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        question: json['question'],
        ask: json['ask'],
        imageUrl: json['imageUrl'],
        link: json['link']);
  }
}
