import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:file_management_system/Bindings/invitations_bindings.dart';
import 'package:file_management_system/View/screens/invitations_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Bindings/create_groub_bindings.dart';
import 'Bindings/forget_password/forget_password_bindings.dart';
import 'Bindings/forget_password/reset_password_bindings.dart';
import 'Bindings/forget_password/verify_code_bindings.dart';
import 'Bindings/home_bindings.dart';
import 'Bindings/initial_bindings.dart';
import 'Bindings/login_bindings.dart';
import 'Bindings/profile_bindings.dart';
import 'Bindings/register_bindings.dart';
import 'Bindings/report_bindings.dart';
import 'Bindings/splash_bindings.dart';
import 'Bindings/verify_account_bindings.dart';
import 'UI/color.dart';
import 'View/screens/create_groub_screen.dart';
import 'View/screens/forget_password/forget_password_screen.dart';
import 'View/screens/forget_password/reset_password_screen.dart';
import 'View/screens/forget_password/verify_code_screen.dart';
import 'View/screens/home_screen.dart';
import 'View/screens/login_screen.dart';
import 'View/screens/profile_screen.dart';
import 'View/screens/register_screen.dart';
import 'View/screens/report_screen.dart';
import 'View/screens/splash_screen.dart';
import 'View/screens/verify_account_screen.dart';
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
          initialRoute: "/splash",
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
              name: "/invitations",
              page: () => InvitationsScreen(),
              binding: InvitationsBindings(),
            ),
            GetPage(
              name: "/profile",
              page: () => ProfileScreen(),
              binding: ProfileBindings(),
            ),

            GetPage(
                    name: "/create_groub",
                    page: () =>  CreateGroubScreen(),
                    binding: CreateGroubBindings(),
                  ),
                  GetPage(
                    name: "/report",
                    page: () =>  ExportImportReportsScreen(),
                    binding: ReportBindings(),
                  ),
                  GetPage(
                    name: "/verify",
                    page: () => const VerifyCodeScreen(),
                    binding: VerifyCodeBindings(),
                  ),
                  GetPage(
                    name: "/reset_password",
                    page: () => const ResetPasswordScreen(),
                    binding: ResetPasswordBindings(),
                  ),
                  GetPage(
                    name: "/verify_account",
                    page: () => const VerifyAccountScreen(),
                    binding: VerifyAccountBindings(),
                  ),
                  GetPage(
                    name: "/forget_password",
                    page: () => const ForgetPasswordScreen(),
                    binding: ForgetPasswordBindings(),
                  ),


          ]),
    );
  }
}
