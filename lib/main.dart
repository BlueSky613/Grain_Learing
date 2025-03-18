import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:terra_galery/controllers/login_controller.dart';
import 'package:terra_galery/models/currentState.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/shrinkage_calculator/providers/grano_provider.dart';

bool isExpirationValid(String expirationDateTimeString) {
  DateTime expirationDateTime = DateTime.parse(expirationDateTimeString);
  DateTime now = DateTime.now();

  return expirationDateTime.isAfter(now);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  String? token = prefs.getString('token');
  print(token);
  // isTokenValid = await UserController().validateToken(token ?? "");
  await prefs.remove('firstTime');
  // print(isTokenValid);
  isFirstTime = prefs.getString('firstTime') == "si" ||
          prefs.getString('firstTime') == null
      ? true
      : false;
  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

    Future.delayed(Duration(seconds: 1),
        () => setState(() => _appStateNotifier.stopShowingSplashImage()));
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    MaterialColor customGreen = const MaterialColor(
      0xFF3B7D24,
      <int, Color>{
        50: Color(0xFFE0F7EF),
        100: Color(0xFFB3E1C9),
        200: Color(0xFF80CEA1),
        300: Color(0xFF4DBB79),
        400: Color(0xFF26AC5E),
        500: Color(0xFF3B7D24),
        600: Color(0xFF346E1E),
        700: Color(0xFF2B5E17),
        800: Color(0xFF234F11),
        900: Color(0xFF1A3F0B),
      },
    );

    return Builder(builder: (context) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => GranoProvider()),
            ],
            child: MaterialApp.router(
              title: 'Grain Master',
              localizationsDelegates: [
                FFLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: _locale,
              debugShowCheckedModeBanner: false,
              supportedLocales: const [Locale('en', '')],
              theme: ThemeData(
                primarySwatch: Colors.green,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: customGreen,
                  backgroundColor: Colors.white,
                  cardColor: Colors.white,
                ),
                useMaterial3: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              darkTheme: ThemeData(
                  primaryColor: Colors.white, brightness: Brightness.light),
              themeMode: _themeMode,
              routerConfig: _router,
            ),
          ));
    });
  }
}
