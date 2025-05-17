class Favourite {
  final String id;
  final String title;
  final List<String>? authors;
  final String thumbnail;

  Favourite({
    required this.id,
    required this.title,
    this.authors,
    required this.thumbnail,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json["id"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      authors: json["authors"],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "thumbnail": thumbnail,
      "authors": authors
    };
  }
}
