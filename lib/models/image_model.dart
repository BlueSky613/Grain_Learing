class ImageModel {
  final int categoryId;
  final String title;
  final String description;
  final String url;
  final String thumbnailurl;
  final String shortTitle;

  ImageModel({
    required this.categoryId,
    required this.title,
    required this.shortTitle,
    required this.thumbnailurl,
    required this.description,
    this.url = "",
  });
}
