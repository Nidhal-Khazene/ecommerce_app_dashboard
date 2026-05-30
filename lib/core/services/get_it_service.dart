import 'package:ecommerce_app_dashboard/core/services/database_service.dart';
import 'package:ecommerce_app_dashboard/core/services/firebase_cloud_storage.dart';
import 'package:ecommerce_app_dashboard/core/services/firestore_service.dart';
import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/products_management/data/repos/images_repo_impl.dart';
import '../../features/products_management/data/repos/products_repo_impl.dart';
import '../../features/products_management/domain/repos/images_repo.dart';
import '../../features/products_management/domain/repos/products_repo.dart';
import 'firebase_auth_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FirebaseCloudStorage());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt<StorageService>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
