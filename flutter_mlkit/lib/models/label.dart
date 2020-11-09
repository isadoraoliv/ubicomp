class Label {
  String text;

  Label({this.text});

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      text: json['text'],
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};

    data['text'] = this.text;
    return data;
  }
}
