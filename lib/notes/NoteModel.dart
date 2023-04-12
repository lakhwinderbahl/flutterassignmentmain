class NoteModel {
  String? text;

  /**
   * Notes only have one field called text
   */
  NoteModel({this.text});

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      NoteModel(text: json['text']);

  Map<String, dynamic> toJson() => {'text': text};
}
