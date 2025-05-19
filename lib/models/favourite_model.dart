class Favourite {
  final String id;
  final String title;
  final List<String>? authors;
  final String? thumbnail;
  final String? publishedDate;

  Favourite({
    required this.id,
    required this.title,
    this.authors,
    this.thumbnail,
    required this.publishedDate,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json["id"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      authors:
          (json["authors"] as List?)
              ?.map((author) => author.toString())
              .toList(),
      publishedDate: json["publishedDate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "thumbnail": thumbnail,
      "authors": authors,
      "publishedDate": publishedDate
    };
  }
}
