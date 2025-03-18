import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terra_galery/controllers/login_controller.dart';
import 'package:terra_galery/flutter_flow/flutter_flow_util.dart';
import 'package:terra_galery/models/anuncio_model.dart';
import 'package:terra_galery/models/currentState.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialScreenWidget extends StatefulWidget {
  final bool goBack;

  InitialScreenWidget({this.goBack = false});
  @override
  _InitialScreenWidgetState createState() => _InitialScreenWidgetState();
}

class _InitialScreenWidgetState extends State<InitialScreenWidget> {
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    init();
  }

  void init() async {
    try {
      currentCategories = await UserController().fetchCategoriesWithImages();
      currentViewCategoryAnalisis = currentCategories[0];
      currentViewCategoryTipificacion = currentCategories[1];
      anuncios = anuncios.where((anuncio) => anuncio.state == true).toList();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'Hubo un error al cargar los datos. ¿Deseas volver a intentar?'),
            actions: <Widget>[
              // TextButton(
              //   child: Text('Cancelar'),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              TextButton(
                child: Text('Volver a intentar'),
                onPressed: () {
                  Navigator.of(context).pop();
                  init(); // Vuelve a intentar la inicialización.
                },
              ),
            ],
          );
        },
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void launchURL2(String url) async {
    Uri urlP = Uri.parse(url);
    if (!await launchUrl(
      urlP,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $urlP');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Builder(builder: (context) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                "HERRAMIENTAS DISPONIBLES",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3b7d24),
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 32,
                    color: Color(0xff144C27),
                  ),
                  onPressed: () {
                    UserController().logOut(context);
                    setState(() {
                      idPais = '';
                    });
                  },
                ),
              ],
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black87),
                        strokeWidth: 5.0,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: 10, left: 20 * fem, right: 20 * fem),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                  'HomeScreen',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20 * fem),
                                constraints: BoxConstraints(
                                  minHeight: 100 * fem,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30 * fem),
                                    topRight: Radius.circular(9.3524227142),
                                    bottomRight:
                                        Radius.circular(9.3524227142 * fem),
                                    bottomLeft:
                                        Radius.circular(9.3524227142 * fem),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x33000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 4.6762113571 * fem,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 64 * fem,
                                        height: 64 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32 * fem),
                                          color: Color(0xff57af37),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/catalogo.svg',
                                            width: 42 * fem,
                                            height: 42 * fem,
                                            fit: BoxFit.fill,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Catálogo de Granos',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff3b7d24),
                                              ),
                                            ),
                                            Text(
                                              'Un recurso escencial para identificar, clasificar y evaluar granos con precisión técnica, crucial para su uso comercial.',
                                              style: GoogleFonts.poppins(
                                                fontSize: 11 * ffem,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff3b7d24),
                                              ),
                                              maxLines: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                  'MermasScreen',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20 * fem),
                                constraints: BoxConstraints(
                                  minHeight: 100 * fem,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30 * fem),
                                    topRight: Radius.circular(9.3524227142),
                                    bottomRight:
                                        Radius.circular(9.3524227142 * fem),
                                    bottomLeft:
                                        Radius.circular(9.3524227142 * fem),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x33000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 4.6762113571 * fem,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 64 * fem,
                                        height: 64 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32 * fem),
                                          color: Color(0xff57af37),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/calculadora.svg',
                                            width: 42 * fem,
                                            height: 42 * fem,
                                            fit: BoxFit.fill,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Calculadora de mermas',
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff3b7d24),
                                              ),
                                            ),
                                            Text(
                                              'Descubre cuánto puedes optimizar en tu poscosecha con esta herramienta: diseñada para estimar pérdidas en peso y planificar la comercialización de granos con precisión profesional.',
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 11 * ffem,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff3b7d24),
                                              ),
                                              maxLines: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                  'DryingScreen',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20 * fem),
                                constraints: BoxConstraints(
                                  minHeight: 100 * fem,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30 * fem),
                                    topRight: Radius.circular(9.3524227142),
                                    bottomRight:
                                        Radius.circular(9.3524227142 * fem),
                                    bottomLeft:
                                        Radius.circular(9.3524227142 * fem),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x33000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 4.6762113571 * fem,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 64 * fem,
                                        height: 64 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32 * fem),
                                          color: Color(0xff57af37),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/calculadora.svg',
                                            width: 42 * fem,
                                            height: 42 * fem,
                                            fit: BoxFit.fill,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Calculadora de secado',
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff3b7d24),
                                              ),
                                            ),
                                            Text(
                                              'Optimiza la planificación de tu poscosecha con esta herramienta: calcula la pérdida de peso por secado y evalúa la capacidad real de tu secadora según las condiciones actuales.',
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 11 * ffem,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff3b7d24),
                                              ),
                                              maxLines: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                  'TasScreen',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20 * fem),
                                constraints: BoxConstraints(
                                  minHeight: 100 * fem,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30 * fem),
                                    topRight: Radius.circular(9.3524227142),
                                    bottomRight:
                                        Radius.circular(9.3524227142 * fem),
                                    bottomLeft:
                                        Radius.circular(9.3524227142 * fem),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x33000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 4.6762113571 * fem,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 64 * fem,
                                        height: 64 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32 * fem),
                                          color: Color(0xff57af37),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/calculadora.svg',
                                            width: 42 * fem,
                                            height: 42 * fem,
                                            fit: BoxFit.fill,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Calculadora de tiempo de almacenamiento seguro',
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff3b7d24),
                                              ),
                                            ),
                                            Text(
                                              'Planifica el almacenamiento de tus granos de forma segura con esta herramienta: estima el tiempo óptimo en silos y bolsas según las condiciones de humedad y temperatura actuales.',
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 11 * ffem,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff3b7d24),
                                              ),
                                              maxLines: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //   ...anuncios.map(
                            //     (anuncio) => GestureDetector(
                            //       onTap: () => launchURL2(anuncio.url),
                            //       child: Container(
                            //         margin: EdgeInsets.fromLTRB(0, 0, 0, 20 * fem),
                            //         height: 171 * fem,
                            //         child: Container(
                            //           width: double.infinity,
                            //           decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(17 * fem),
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 color: Color(0x33000000),
                            //                 offset: Offset(0 * fem, 0 * fem),
                            //                 blurRadius: 4 * fem,
                            //               ),
                            //             ],
                            //           ),
                            //           child: ClipRRect(
                            //             borderRadius: BorderRadius.circular(17 * fem),
                            //             child: CachedNetworkImage(
                            //               imageUrl: anuncio.imageUrl,
                            //               height: 171 * fem,
                            //               fit: BoxFit.fill,
                            //               placeholder: (context, url) => Center(
                            //                   child: CircularProgressIndicator(
                            //                 color: Color.fromARGB(255, 24, 65, 0),
                            //               )),
                            //               errorWidget: (context, url, error) {
                            //                 return Image.asset(
                            //                   "assets/images/coming_soon.png",
                            //                   height: 171 * fem,
                            //                   fit: BoxFit.fill,
                            //                 );
                            //               },
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                    ),
            ),
          ));
    });
  }
}

Future<void> _showExitConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Cerrar Aplicación'),
        content: Text('¿Estás seguro que deseas cerrar la aplicación?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Salir'),
            onPressed: () {
              Navigator.of(context).pop();
              SystemNavigator.pop(); // Pop para salir de la pantalla actual
            },
          ),
        ],
      );
    },
  );
}
