import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/sign_in_page.dart';
import 'screens/home_page.dart';
import 'utils/app_themes.dart';
import 'utils/localization.dart';
import 'utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: BookBuddyApp(prefs: prefs),
    ),
  );
}

class BookBuddyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const BookBuddyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Consumer<LocaleProvider>(
          builder: (context, localeProvider, child) {
            return MaterialApp(
              title: 'Book Buddy',
              theme: themeProvider.themeData,
              darkTheme: themeProvider.darkThemeData,
              themeMode: themeProvider.themeMode,
              locale: localeProvider.locale,
              supportedLocales: const [Locale('en', ''), Locale('es', '')],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              home: prefs.getString('username') != null
                  ? const HomePage()
                  : const SignInPage(),
            );
          },
        );
      },
    );
  }
}
