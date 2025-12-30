import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo_impl.dart';
import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repositories/images_repo.dart';
import '../repositories/images_repo_impl.dart';
import 'firebase_cloud_storage.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FirebaseCloudStorage());
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt<StorageService>()));
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl());
}
