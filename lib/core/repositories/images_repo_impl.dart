import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';
import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/backend_break_point.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File fileImage) async {
    try {
      String url = await storageService.uploadFile(
        fileImage,
        BackendBreakPoint.images,
      );
      return Right(url);
    } on Exception catch (e) {
      return Left(ServerFailure(message: "Failed to upload image!"));
    }
  }
}
