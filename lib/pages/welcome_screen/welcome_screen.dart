import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_galery/controllers/login_controller.dart';
import 'package:terra_galery/flutter_flow/flutter_flow_util.dart';
import 'package:terra_galery/models/currentState.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreenWidget extends StatefulWidget {
  @override
  _WelcomeScreenWidgetState createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget> {
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    currentCategories = await UserController().fetchCategoriesWithImages();
    print(currentCategories[0].name);
    print(currentCategories[0].subcategories.length);
    print(currentCategories[0].name);
    currentViewCategoryAnalisis = currentCategories[0];
    currentViewCategoryTipificacion = currentCategories[1];
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 35 * fem),
                width: 375 * fem,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/app_launcher_icon.png",
                      height: 150,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 33,
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
                  ],
                )),

            // Container(
            //   margin: EdgeInsets.fromLTRB(0 * fem, 30 * fem, 0 * fem, 25 * fem),
            //   width: 375 * fem,
            //   height: 290 * fem,
            //   child: Image.asset(
            //     "assets/images/welcome_image.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Container(
              // feelyourselflikeabarista9vy (1:211)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 39 * fem),
              child: Text(
                'Bienvenido',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 28 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff181d2d),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 0 * fem),
              child: Text(
                '¿Estas listo para iniciar?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.9462193383 * ffem / fem,
                  color: Color(0xffaaaaaa),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 160 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 151 * fem,
                    top: 42 * fem,
                    child: Container(
                      width: 73 * fem,
                      height: 10 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 33 * fem,
                            height: 10 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                              color: Color(0xff57af37),
                            ),
                          ),
                          SizedBox(
                            width: 10 * fem,
                          ),
                          Container(
                            // rectangle2597YLq (1:213)
                            width: 10 * fem,
                            height: 10 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                              color: Color(0x33324a59),
                            ),
                          ),
                          SizedBox(
                            width: 10 * fem,
                          ),
                          Container(
                            // rectangle2598stu (1:214)
                            width: 10 * fem,
                            height: 10 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                              color: Color(0x33324a59),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse18EDf (1:215)
                    left: 280 * fem,
                    top: 80 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 64 * fem,
                        height: 64 * fem,
                        child: TextButton(
                          onPressed: () async {
                            await prefs.setString('firstTime', 'no');
                            context.pushNamed(
                              'LoginScreen',
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
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32 * fem),
                              color: Color(0xff57af37),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
