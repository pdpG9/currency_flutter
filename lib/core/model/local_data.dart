
class LocalModel{
  final String title;
  final String image;

//<editor-fold desc="Data Methods">
  const LocalModel({
    required this.title,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          image == other.image);

  @override
  int get hashCode => title.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'LocalModel{ title: $title, image: $image,}';
  }

  LocalModel copyWith({
    String? title,
    String? image,
  }) {
    return LocalModel(
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'image': this.image,
    };
  }

  factory LocalModel.fromMap(Map<String, dynamic> map) {
    return LocalModel(
      title: map['title'] as String,
      image: map['image'] as String,
    );
  }
//</editor-fold>
}
List<LocalModel> languages = [
  const LocalModel(title: "Uz", image: 'https://countryflagsapi.com/png/uz'),
  const LocalModel(title: "UZc", image: 'https://countryflagsapi.com/png/uz'),
  const LocalModel(title: "Ru", image: 'https://countryflagsapi.com/png/ru'),
  const LocalModel(title: "En", image: 'https://countryflagsapi.com/png/gbr'),
];