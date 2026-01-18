import 'package:ecommerce_app_dashboard/core/routing/on_generate_route.dart';
import 'package:ecommerce_app_dashboard/core/services/custom_bloc_observer.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/core/services/supabase_storage_service.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_app_dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.initSupabase();
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
}
