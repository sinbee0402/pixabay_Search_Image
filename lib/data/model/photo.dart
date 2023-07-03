class Photo {
  int id;
  String largeImageURL;
  //String webformatURL

  Photo({
    required this.id,
    required this.largeImageURL,
  });

  Photo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        largeImageURL = json['largeImageURL'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'largeImageURL': largeImageURL,
      };
}
