import 'package:terra_galery/models/image_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final int parentId;
  final String imageUrl;
  final List<CategoryModel> subcategories;
  final List<ImageModel> images;

  CategoryModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.parentId,
    this.subcategories = const [],
    this.images = const [],
  });
}
