import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as Http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_galery/api/api_client.dart';
import 'package:terra_galery/flutter_flow/flutter_flow_util.dart';
import 'package:terra_galery/models/anuncio_model.dart';
import 'package:terra_galery/models/category_model.dart';
import 'package:terra_galery/models/currentState.dart';
import 'package:terra_galery/models/image_model.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept": "application/json"
};

class UserController extends GetxController implements GetxService {
  final _apiClient = ApiClient();

  Future<List<CategoryModel>> fetchCategories() async {
    Http.Response response = (await _apiClient.getData(
        'api/categories?pagination[page]=1&pagination[pageSize]=200&populate=*'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data'];
      late List<CategoryModel> categories =
          List<CategoryModel>.from(jsonData.map((categoryData) => CategoryModel(
                id: categoryData['id'],
                name: categoryData['attributes']['name'],
                parentId: categoryData['attributes']['parent_id'],
                imageUrl: Uri.parse(urlServe +
                        (categoryData['attributes']['categoryImage']['data']
                                ?['attributes']['url'] ??
                            ""))
                    .toString(),
                subcategories: [],
                images: [],
              )));
      // categories.forEach((category) {
      //   print("Nombre: ${category.name}, parent id: ${category.parentId}");
      // });
      // Llenar las subcategorías para cada categoría
      for (var category in categories) {
        final subcategories =
            categories.where((c) => c.parentId == category.id).toList();
        category.subcategories.addAll(subcategories);
      }

      return categories;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<List<ImageModel>> fetchAllImages() async {
    List<ImageModel> allImages = [];
    int page = 1;

    while (true) {
      final images = await fetchImages(page);

      if (images.isEmpty) {
        // No hay más imágenes en la página actual, sal del bucle.
        break;
      }

      allImages.addAll(images);
      page++; // Avanzar a la siguiente página
    }

    return allImages;
  }

  Future<bool> validateToken(String token) async {
    try {
      final body = {
        'token': token,
      };
      final response = await http
          .post(
            Uri.parse('https://institutoterra.ar:8422/api/users/ValidateToken'),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: 30));
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse["result"]) {
        idPais = '9';
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    context.pushReplacementNamed(
      'LoginScreen',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 200),
        ),
      },
    );
  }

  Future<List<ImageModel>> fetchImages(int page) async {
    final response = await _apiClient.getData(
      'api/images?pagination[page]=$page&pagination[pageSize]=100&populate=*',
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data'];
      return jsonData.map((imageData) {
        if (page == 2) print(imageData['attributes']['title'] ?? "");
        return ImageModel(
          categoryId: imageData['attributes']?['category_id'],
          title: imageData['attributes']['title'] ?? "",
          shortTitle: imageData['attributes']['shortTitle'] ?? "",
          description: imageData['attributes']['description'] ?? "",
          url: Uri.parse(urlServe +
                  (imageData['attributes']['image']['data']?['attributes']
                          ['url'] ??
                      ""))
              .toString(),
          thumbnailurl: Uri.parse(urlServe +
                  (imageData['attributes']['image']['data']?['attributes']
                          ['formats']['thumbnail']['url'] ??
                      ""))
              .toString(),
        );
      }).toList();
    } else {
      throw Exception('Failed to fetch images');
    }
  }

  Future<List<AnuncioModel>> fetchAnuncios() async {
    try {
      Http.Response response = (await _apiClient.getData(
          'api/anuncios?pagination[page]=1&pagination[pageSize]=1000&populate=*&filters[id_pais][\$eq]=$idPais'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body)['data'];
        return jsonData
            .map((imageData) => AnuncioModel(
                  imageUrl: Uri.parse(urlServe +
                          (imageData['attributes']['imagen_anuncio']['data']
                                  ?['attributes']['url'] ??
                              ""))
                      .toString(),
                  url: imageData['attributes']['url_anuncio'] ?? "",
                  state: imageData['attributes']['Activo'] ?? "",
                ))
            .toList();
      } else {
        throw Exception('Failed to fetch anuncios');
      }
    } catch (e) {
      print('errorr ${e.toString()}');
      return [];
    }
  }

  Future<List<CategoryModel>> fetchCategoriesWithImages() async {
    final categories = await fetchCategories();
    final images = await fetchAllImages();
    anuncios = await fetchAnuncios();
    for (var category in categories) {
      final categoryImages =
          images.where((image) => image.categoryId == category.id).toList();
      category.images.addAll(categoryImages);
    }

    return categories;
  }
}
