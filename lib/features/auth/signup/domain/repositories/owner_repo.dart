import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/owner_entity.dart';

abstract class OwnerRepo {
  Future<Either<Failure,Unit>> signup(OwnerEntity ownerEntity);

}
