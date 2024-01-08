import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/utility/keybord_lisenter.dart';
import 'package:flutter_base/utility/un_focus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base/helpers/shared_helper.dart';
import 'package:flutter_base/helpers/translation/all_translation.dart';
import 'package:flutter_base/helpers/translation/translations.dart';
import 'package:flutter_base/bloc/main_app_bloc.dart';
import 'features/login/bloc/login_bloc.dart';
import 'features/splah/splash_bloc.dart';
import 'helpers/styles.dart';
import 'bloc/user_bloc.dart';
import 'navigation/custom_navigation.dart';
import 'navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  await allTranslations.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    mainAppBloc.getShared();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (_) => SplashBloc()),
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<UserBloc>(create: (_) => UserBloc()),
        BlocProvider<KeyBordBloc>(create: (_) => KeyBordBloc()),
      ],
      child: StreamBuilder<String>(
        stream: mainAppBloc.langStream,
        builder: (context, lang) {
          return lang.hasData
              ? MaterialApp(
                  builder: (context, child) => MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: const TextScaler.linear(1),
                    ),
                    child: Unfocus(child: child!),
                  ),
                  initialRoute: Routes.SPLASH,
                  navigatorKey: CustomNavigator.navigatorState,
                  onGenerateRoute: CustomNavigator.onCreateRoute,
                  navigatorObservers: [CustomNavigator.routeObserver],
                  debugShowCheckedModeBanner: false,
                  scaffoldMessengerKey: CustomNavigator.scaffoldState,
                  locale: const Locale("ar", ''),
                  supportedLocales: allTranslations.supportedLocales(),
                  localizationsDelegates: const [
                    TranslationsDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  title: "flutter_base",
                  theme: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
                      isDense: true,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Styles.PRIMARY_COLOR.withOpacity(0.5),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Styles.PRIMARY_COLOR.withOpacity(0.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      floatingLabelStyle: TextStyle(
                        fontSize: 14,
                        color: Styles.PRIMARY_COLOR.withOpacity(0.5),
                      ),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Styles.PRIMARY_COLOR,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.PRIMARY_COLOR.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    pageTransitionsTheme: const PageTransitionsTheme(
                      builders: {
                        TargetPlatform.android:
                            CupertinoPageTransitionsBuilder(),
                        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                      },
                    ),
                    primaryColor: Styles.PRIMARY_COLOR,
                    colorScheme: ThemeData().colorScheme.copyWith(
                          secondary: Styles.WHITE_COLOR,
                        ),
                    fontFamily:
                        lang.data == 'en' ? Styles.FONT_EN : Styles.FONT_AR,
                    scaffoldBackgroundColor: Styles.WHITE_COLOR,
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
