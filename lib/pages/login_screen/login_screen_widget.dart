import 'package:device_info_plus/device_info_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_galery/models/currentState.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'login_screen_model.dart';
export 'login_screen_model.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept": "application/json"
};

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late LoginScreenModel _model;
  String username = '';
  String password = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isPasswordVisible = false;
  bool isLoading = false;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late SharedPreferences prefs;

  Future<List<String>> getDeviceModel() async {
    String deviceModel;
    String id;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceModel = androidInfo.model;
      // print('Device Brand: ${androidInfo.brand}');
      id = androidInfo.id;
      //print('OS Version: ${androidInfo.version.release}');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.model;
      //print('Device Name: ${iosInfo.name}');
      id = iosInfo.identifierForVendor ?? '';
      //print('OS Version: ${iosInfo.systemVersion}');
    } else {
      deviceModel = "";
      id = "";
    }
    return [deviceModel, id];
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginScreenModel());

    _model.textController ??= TextEditingController();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  final String message =
      'Hola necesito ayuda para utilizar la aplicación Grain Master';

  void openWhatsApp() async {
    final whatsappUrl = Uri.parse(
        "whatsapp://send?phone=+5493517353739&text=${Uri.encodeComponent(message)}");
    // final whatsappUrl = Uri.parse(
    //     'https://wa.me/5493517353739/?text=${Uri.encodeComponent(message)}');
    print(whatsappUrl);
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'No se pudo abrir WhatsApp.';
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
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60 * fem),
                        child: Image.asset(
                          "assets/images/app_launcher_icon.png",
                          height: 95,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xff15201c),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Grain ',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: 'Master',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            29.5 * fem, 0 * fem, 10.67 * fem, 0 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 80 * fem, 174.83 * fem, 15 * fem),
                              child: Text(
                                'Inicia sesion',
                                style: GoogleFonts.poppins(
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xff181d2d),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 124.83 * fem, 20 * fem),
                              child: Text(
                                'Introduce tus credenciales',
                                style: GoogleFonts.poppins(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.9462193298 * ffem,
                                  color: Color(0xffaaaaaa),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 25 * fem, 18 * fem),
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xffC1C7D0),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      size: 24,
                                    ),
                                    SizedBox(width: 9),
                                    Expanded(
                                      child: Container(
                                        height: 35,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              color: Color(0xffC1C7D0),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(19, 0, 0, 0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'Usuario',
                                              hintStyle: TextStyle(
                                                color: Color(0xffC1C7D0),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                username = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 25 * fem, 20 * fem),
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 0),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xffC1C7D0),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.lock_outline,
                                      size: 24,
                                    ),
                                    SizedBox(width: 9),
                                    Expanded(
                                      child: Container(
                                        height: 35,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              color: Color(0xffC1C7D0),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(19, 0, 0, 0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Contraseña',
                                              hintStyle: TextStyle(
                                                color: Color(0xffC1C7D0),
                                              ),
                                            ),
                                            obscureText: !isPasswordVisible,
                                            onChanged: (value) {
                                              setState(() {
                                                password = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                                        child: Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(16 * fem, 0, 28 * fem, 0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: openWhatsApp,
                                      child: Text(
                                        'Contactar a soporte',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                          letterSpacing: -0.2,
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff324a59),
                                          decorationColor: Color(0xff324a59),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        child: SizedBox(
                                          width: 58 * fem,
                                          height: 58 * fem,
                                          child: TextButton(
                                            onPressed: () async {
                                              try {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                List<String> pr =
                                                    await getDeviceModel();
                                                final body = {
                                                  'user_name': username,
                                                  'password': password,
                                                  "device": {
                                                    "model": pr[0],
                                                    "id": pr[1],
                                                  }
                                                };
                                                final response = await http
                                                    .post(
                                                      Uri.parse(
                                                          'http://168.197.50.162:8880/api/users/login'),
                                                      headers: headers,
                                                      body: json.encode(body),
                                                    )
                                                    .timeout(const Duration(
                                                        seconds: 20));
                                                final decodeResponse =
                                                    jsonDecode(response.body);
                                                print(decodeResponse);
                                                if (decodeResponse["result"]) {
                                                  setState(() {
                                                    isLoading = false;
                                                    idPais = decodeResponse[
                                                            "id_pais"]
                                                        .toString();
                                                  });
                                                  prefs.setString("token",
                                                      decodeResponse["token"]);
                                                  goBack2 = true;
                                                  context.pushNamed(
                                                    'InitialScreen',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        decodeResponse[
                                                            "mensaje"],
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2912193298 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0xffff0e0e),
                                                    ),
                                                  );
                                                }
                                              } catch (e) {
                                                print(e.toString());
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Ha ocurrido un error, intenta de nuevo más tarde.',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 10 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.2912193298 *
                                                            ffem /
                                                            fem,
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xffff0e0e),
                                                  ),
                                                );
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: isLoading
                                                ? Container(
                                                    width: 58,
                                                    height: 58,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Color(
                                                                  0xff57af37)),
                                                      strokeWidth: 5.0,
                                                    ))
                                                : Container(
                                                    width: 58,
                                                    height: 58,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32 * fem),
                                                      color: Color(0xdd57af37),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/Arrow_Right.png",
                                                      scale: 0.8,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ));
    });
  }
}

// child: Row(
//   children: [
//     Expanded(
//       child: IntlPhoneField(
//         decoration: InputDecoration(
//           labelText: 'Telefono',
//           labelStyle:
//               FlutterFlowTheme.of(context).titleLarge,
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           errorBorder: InputBorder
//               .none, // No mostrar el borde de error
//           focusedErrorBorder: InputBorder
//               .none, // No mostrar el borde de error
//           filled: true,
//           fillColor: Colors.white,
//           counterText: '',
//           errorStyle: TextStyle(fontSize: 0),
//         ),
//         initialCountryCode: 'AR', // Initial country code
//         onChanged: (phone) {
//           setState(() {
//             phoneNumber = phone
//                 .number; // Asigna el número de teléfono a la variable
//           });
//         },
//       ),
//     ),
//   ],
// ),
