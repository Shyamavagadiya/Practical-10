class Note {
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
  });

  // Convert a Note object to a Map for saving in local storage or Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }

  // Convert a Map to a Note object
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
    );
  }
}
