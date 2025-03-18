import 'package:cached_network_image/cached_network_image.dart';
import 'package:terra_galery/models/category_model.dart';
import 'package:terra_galery/models/currentState.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;
  bool showTipificacion = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    _model = createModel(context, () => HomeScreenModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          "CATÁLOGO DE GRANOS",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff3b7d24),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xff144C27),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                width: 250 * fem,
                height: 40 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffefefef),
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showTipificacion = true;
                        });
                      },
                      child: Container(
                          width: 105 * fem,
                          height: double.infinity,
                          decoration: showTipificacion
                              ? BoxDecoration(
                                  color: showTipificacion
                                      ? Color(0xff57af37)
                                      : Color(0xffefefef),
                                  borderRadius: BorderRadius.circular(20 * fem),
                                )
                              : BoxDecoration(),
                          child: Align(
                            child: Text(
                              'Tipificación',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w600,
                                color: showTipificacion
                                    ? Color(0xffffffff)
                                    : Color(0xff3b7d24),
                              ),
                            ),
                            alignment: Alignment.center,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showTipificacion = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 0 * fem),
                        padding: EdgeInsets.all(2),
                        width: 144 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: showTipificacion
                              ? Color(0xffefefef)
                              : Color(0xff57af37),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Análisis comercial',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w600,
                              color: showTipificacion
                                  ? Color(0xff3b7d24)
                                  : Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 35 * fem, vertical: 10 * fem),
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: showTipificacion
                      ? currentViewCategoryTipificacion.subcategories.length
                      : currentViewCategoryAnalisis.subcategories.length,
                  itemBuilder: (context, index) {
                    CategoryModel subcategory = showTipificacion
                        ? currentViewCategoryTipificacion.subcategories[index]
                        : currentViewCategoryAnalisis.subcategories[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // pastViewCategoryTipificacion.add(currentViewCategoryTipificacion);
                          // currentViewCategoryTipificacion = subcategory;
                          currentViewGalery = [];
                          showTipificacion
                              ? currentViewGalery
                                  .add(currentViewCategoryTipificacion)
                              : currentViewGalery
                                  .add(currentViewCategoryAnalisis);
                          currentViewGalery.add(subcategory);
                          context.pushNamed(
                            'GaleryScreen',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                              ),
                            },
                          );
                        });
                      },
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 150,
                          width: double.infinity,
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
                                  fit: BoxFit.fill,
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//****************Volver categoria
/*                               InkWell(
                                    child: Icon(Icons.chevron_left, size: 30),
                                    onTap: () {
                                      setState(() {
                                        currentViewCategoryTipificacion =
                                            pastViewCategoryTipificacion.last;
                                      });
                                      if (pastViewCategoryTipificacion.length >
                                          1) {
                                        pastViewCategoryTipificacion
                                            .removeLast();
                                      }
                                    },
                                  ),*/
//************************** */ 
/*[
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  if (currentViewCategoryTipificacion
                                          .images.isNotEmpty &&
                                      currentViewCategoryTipificacion
                                          .subcategories.isNotEmpty)
                                    Column(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                currentViewCategoryTipificacion
                                                    .subcategories.length,
                                            itemBuilder: (context, index) {
                                              CategoryModel subcategory =
                                                  currentViewCategoryTipificacion
                                                      .subcategories[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    pastViewCategoryTipificacion
                                                        .add(
                                                            currentViewCategoryTipificacion);
                                                    currentViewCategoryTipificacion =
                                                        subcategory;
                                                  });
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Text(
                                                      subcategory.name
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                currentViewCategoryTipificacion
                                                    .images.length,
                                            itemBuilder: (context, index) {
                                              ImageModel image =
                                                  currentViewCategoryTipificacion
                                                      .images[index];
                                              return GalleryCard(
                                                title: image.title,
                                                description: image.description,
                                                imageUrl: image.url,
                                              );
                                            }),
                                      ],
                                    ),
                                  if (currentViewCategoryTipificacion
                                      .images.isNotEmpty)
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            currentViewCategoryTipificacion
                                                .images.length,
                                        itemBuilder: (context, index) {
                                          ImageModel image =
                                              currentViewCategoryTipificacion
                                                  .images[index];
                                          return GalleryCard(
                                            title: image.title,
                                            description: image.description,
                                            imageUrl: image.url,
                                          );
                                        }),
                                  if (currentViewCategoryTipificacion
                                      .subcategories.isNotEmpty)
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            currentViewCategoryTipificacion
                                                .subcategories.length,
                                        itemBuilder: (context, index) {
                                          CategoryModel subcategory =
                                              currentViewCategoryTipificacion
                                                  .subcategories[index];
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                pastViewCategoryTipificacion.add(
                                                    currentViewCategoryTipificacion);
                                                currentViewCategoryTipificacion =
                                                    subcategory;
                                              });
                                            },
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Text(
                                                  subcategory.name
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  if (currentViewCategoryAnalisis
                                          .images.isNotEmpty &&
                                      currentViewCategoryAnalisis
                                          .subcategories.isNotEmpty)
                                    Column(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                currentViewCategoryAnalisis
                                                    .subcategories.length,
                                            itemBuilder: (context, index) {
                                              CategoryModel subcategory =
                                                  currentViewCategoryAnalisis
                                                      .subcategories[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    pastViewCategoryAnalisis.add(
                                                        currentViewCategoryAnalisis);
                                                    currentViewCategoryAnalisis =
                                                        subcategory;
                                                  });
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Text(
                                                      subcategory.name
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                currentViewCategoryAnalisis
                                                    .images.length,
                                            itemBuilder: (context, index) {
                                              ImageModel image =
                                                  currentViewCategoryAnalisis
                                                      .images[index];
                                              return GalleryCard(
                                                title: image.title,
                                                description: image.description,
                                                imageUrl: image.url,
                                              );
                                            }),
                                      ],
                                    ),
                                  if (currentViewCategoryAnalisis
                                      .images.isNotEmpty)
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: currentViewCategoryAnalisis
                                            .images.length,
                                        itemBuilder: (context, index) {
                                          ImageModel image =
                                              currentViewCategoryAnalisis
                                                  .images[index];
                                          return GalleryCard(
                                            title: image.title,
                                            description: image.description,
                                            imageUrl: image.url,
                                          );
                                        }),
                                  if (currentViewCategoryAnalisis
                                      .subcategories.isNotEmpty)
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: currentViewCategoryAnalisis
                                            .subcategories.length,
                                        itemBuilder: (context, index) {
                                          CategoryModel subcategory =
                                              currentViewCategoryAnalisis
                                                  .subcategories[index];
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                pastViewCategoryAnalisis.add(
                                                    currentViewCategoryAnalisis);
                                                currentViewCategoryAnalisis =
                                                    subcategory;
                                              });
                                            },
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Text(
                                                  subcategory.name
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                ],
                              ),
                            ),
                          ]*/