import 'package:dartz/dartz.dart';
import 'package:saudi_clean_services_owner/core/errors/exceptions.dart';
import 'package:saudi_clean_services_owner/core/network/check_internet.dart';
import 'package:saudi_clean_services_owner/features/auth/signup/data/models/owner_model.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entities/owner_entity.dart';
import '../../domain/repositories/owner_repo.dart';
import '../data%20sources/owner_remote_data_source.dart';

class OwnerRepoImpl implements OwnerRepo {
  OwnerRemoteDataSource ownerRemoteDataSource;
  NetworkInfo networkInfo;
  OwnerRepoImpl({
    required this.ownerRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Unit>> signup(OwnerEntity ownerEntity) async {
    if (await networkInfo.isConnected) {
      OwnerModel ownerModel = OwnerModel(
        name: ownerEntity.name,
        phone: ownerEntity.phone,
        city: ownerEntity.city,
        password: ownerEntity.password,
        confirmPassword: ownerEntity.confirmPassword,
      );
      try {
        await ownerRemoteDataSource.signup(ownerModel);
        return const Right(unit);
      } on ExceptionTimeout {
        return Left (NetworkErrorFailure(message: 'Time out'));
      } on ExceptionSocket {
       return Left( NetworkErrorFailure(message: 'Socket Error'));
      } on ExceptionFormat {
        return Left( NetworkErrorFailure(message: 'Bad Response Format'));
      } on ExceptionHandshake {
        return Left( NetworkErrorFailure(message: 'Handshake Error'));
      } on ExceptionOther {
        return Left( NetworkErrorFailure(message: 'Error'));
      }on CustomException catch(e) {
        return Left( NetworkErrorFailure(message:e.message ));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
