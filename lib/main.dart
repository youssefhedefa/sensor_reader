import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sensor_reader/theme/theme_constants.dart';
import 'package:sensor_reader/theme/theme_manager.dart';
import 'package:sensor_reader/utilies/routing.dart';
import 'package:sensor_reader/widgets/dash_board/dashboard_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        // fallbackLocale: Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeManager themeManager = ThemeManager();
  late RoutingManager routingManager;

  @override
  void initState() {
    themeManager.addListener(themeListner);
    routingManager = RoutingManager(themeManager: themeManager);
    super.initState();
  }

  themeListner() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeManager.currentTheme,
      onGenerateRoute: routingManager.onGenerateRoute,
      initialRoute: routingManager.checkStartPoint(),
      home: DashboardView(
        themeManager: themeManager,
      ),
    );
  }
}
