
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/owner_entity.dart';
import '../repositories/owner_repo.dart';

class SignupUseCase {
  final OwnerRepo ownerRepo;
  SignupUseCase({
    required this.ownerRepo,
  });

  Future<Either<Failure, Unit>> call(OwnerEntity ownerEntity) async {
    return await ownerRepo.signup(ownerEntity);
  }
}
