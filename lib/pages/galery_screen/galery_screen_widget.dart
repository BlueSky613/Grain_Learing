import 'package:cached_network_image/cached_network_image.dart';
import 'package:terra_galery/components/image_card.dart';
import 'package:terra_galery/models/category_model.dart';
import 'package:terra_galery/models/currentState.dart';
import 'package:terra_galery/models/image_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class GaleryScreenWidget extends StatefulWidget {
  const GaleryScreenWidget({Key? key}) : super(key: key);

  @override
  _GaleryScreenWidgetState createState() => _GaleryScreenWidgetState();
}

class _GaleryScreenWidgetState extends State<GaleryScreenWidget> {
  bool showTipificacion = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String concatenatedNames;
  @override
  void initState() {
    // FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    getAppName();
    print(concatenatedNames);
    super.initState();
  }

  void getAppName() {
    List<String> categoryNames =
        currentViewGalery.map((category) => category.name).toList();
    setState(() {
      concatenatedNames = categoryNames.join(' - ');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          concatenatedNames,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff3b7d24),
          ),
          maxLines: 2,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xff144C27),
          ),
          onPressed: () {
            if (currentViewGalery.length > 2) {
              setState(() {
                currentViewGalery.removeLast();
                getAppName();
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (currentViewGalery.last.images.isNotEmpty)
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10 * fem),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.56 * fem,
                      ),
                      itemCount: currentViewGalery.last.images.length,
                      itemBuilder: (context, index) {
                        ImageModel image = currentViewGalery.last.images[index];
                        return GalleryCard(
                          curImage: image,
                        );
                      },
                    )),
              if (currentViewGalery.last.subcategories.isNotEmpty)
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 6 * fem),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: currentViewGalery.last.subcategories.length,
                    itemBuilder: (context, index) {
                      CategoryModel subcategory =
                          currentViewGalery.last.subcategories[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // pastViewCategoryTipificacion.add(currentViewCategoryTipificacion);
                            // currentViewCategoryTipificacion = subcategory;
                            currentViewGalery.add(subcategory);
                            getAppName();
                          });
                        },
                        child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              // padding: const EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: subcategory.imageUrl,
                                      width: double.infinity,
                                      fit: BoxFit
                                          .fill, // Cambiado a BoxFit.cover
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                        color: Color.fromARGB(255, 24, 65, 0),
                                      )),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        "assets/images/category_placeholder.jpg",
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      subcategory.name.toUpperCase(),
                                      style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ),
              if (currentViewGalery.last.images.isEmpty &&
                  currentViewGalery.last.subcategories.isEmpty)
                Center(
                  child: Text(
                    'No hay datos disponibles',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
