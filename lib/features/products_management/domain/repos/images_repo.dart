import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure, Map<String, String>>> uploadImage(File fileImage);
  Future<Either<Failure, void>> updateImage({
    required File fileImage,
    required String imagePath,
  });
  Future<Either<Failure, void>> deleteImage(String imagePath);
}
