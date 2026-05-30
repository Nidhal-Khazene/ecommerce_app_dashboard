import 'package:ecommerce_app_dashboard/core/routing/on_generate_route.dart';
import 'package:ecommerce_app_dashboard/core/services/custom_bloc_observer.dart';
import 'package:ecommerce_app_dashboard/core/services/firebase_auth_services.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/core/services/shared_preferences_singleton.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_app_dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localingo/localingo.dart';

import 'core/utils/colors_data.dart';
import 'features/auth/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SupabaseStorageService.initSupabase();
  // SupabaseStorageService.createBucket(bucketName: BackendBreakPoint.images);
  await SharedPreferencesSingleton.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Localingo.navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
      ],
      locale: const Locale("ar"),
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsData.kPrimaryColor),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: getInitialRoute(),
    );
  }

  String getInitialRoute() {
    if (FirebaseAuthService.isLoggedIn()) {
      return DashboardView.routeName;
    } else {
      return LoginView.routeName;
    }
  }
}
