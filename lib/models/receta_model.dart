class RecetaModel {
  String title;
  String recipe;
  String urlImage;
  String type;
  bool withPapa;
  bool withCamote;

  RecetaModel({
    required this.title,
    required this.recipe,
    required this.urlImage,
    required this.type,
    required this.withPapa,
    required this.withCamote,
  });
}
