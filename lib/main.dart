import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Bindings/home_bindings.dart';
import 'Bindings/initial_bindings.dart';
import 'Bindings/login_bindings.dart';
import 'Bindings/pre_version_bindings.dart';
import 'Bindings/profile_bindings.dart';
import 'Bindings/register_bindings.dart';
import 'Bindings/splash_bindings.dart';
import 'Bindings/view_group_bindings.dart';
import 'UI/color.dart';
import 'View/screens/home_screen.dart';
import 'View/screens/login_screen.dart';
import 'View/screens/pre_version_screen.dart';
import 'View/screens/profile_screen.dart';
import 'View/screens/register_screen.dart';
import 'View/screens/splash_screen.dart';
import 'View/screens/view_group_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedThemeMode: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (ThemeData light, ThemeData dark) => GetMaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          initialRoute: "/login",
          initialBinding: InitialBindings(),
          getPages: [
            GetPage(
              name: "/splash",
              page: () => const SplashScreen(),
              binding: SplashBindings(),
            ),
            GetPage(
              name: "/login",
              page: () => const LoginScreen(),
              binding: LoginBindings(),
            ),
            GetPage(
              name: "/signup",
              page: () => const RegisterScreen(),
              binding: RegisterBindings(),
            ),
            GetPage(
              name: "/home",
              page: () => HomeScreen(),
              binding: HomeBindings(),
            ),
            GetPage(
              name: "/profile",
              page: () => ProfileScreen(),
              binding: ProfileBindings(),
            ),
            GetPage(
              name: "/viewGroup",
              page: () =>  ViewGroupScreen(),
              binding: ViewGroupBindings(),
            ),
            GetPage(
              name: "/preVersion",
              page: () =>  const PreVersionScreen(),
              binding: PreVersionBindings(),
            ),
          ]),
    );
  }
}
