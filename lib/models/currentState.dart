import 'package:terra_galery/models/anuncio_model.dart';
import 'package:terra_galery/models/category_model.dart';

String idPais = '';
List<CategoryModel> currentCategories = [
  CategoryModel(
      id: 1,
      name: "Analisis comercial",
      imageUrl:
          "https://thefoodtech.com/wp-content/uploads/2021/12/semillas-resistentes-scaled.jpg",
      parentId: 0,
      subcategories: [],
      images: [])
];
CategoryModel currentViewCategoryAnalisis = new CategoryModel(
    id: 0,
    name: "analisis",
    parentId: 0,
    imageUrl:
        "https://thefoodtech.com/wp-content/uploads/2021/12/semillas-resistentes-scaled.jpg");
List<CategoryModel> pastViewCategoryAnalisis = [];
List<CategoryModel> pastViewCategoryTipificacion = [];

List<CategoryModel> currentViewGalery = [];

CategoryModel currentViewCategoryTipificacion = new CategoryModel(
    id: 0,
    name: "tipi",
    parentId: 0,
    imageUrl:
        "https://thefoodtech.com/wp-content/uploads/2021/12/semillas-resistentes-scaled.jpg");

String phoneNumber = "";

String urlServe = 'http://44.217.132.127:1337';

bool isTokenValid = false;
bool isTokenSaved = false;
bool isFirstTime = true;
bool goBack2 = false;

List<AnuncioModel> anuncios = [];
