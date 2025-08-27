import 'package:dartz/dartz.dart';
import 'package:store_service_app/src/core/errors/exception.dart';
import 'package:store_service_app/src/core/errors/failure.dart';
import 'package:store_service_app/src/core/network/network_info.dart';
import 'package:store_service_app/src/features/item/data/datasources/item_local_datasource.dart';
import 'package:store_service_app/src/features/item/data/datasources/item_remote_datasource.dart';
import 'package:store_service_app/src/features/item/data/models/item_model.dart';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';
import 'package:store_service_app/src/features/item/domain/repositories/item_repository.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_filter_items_usecase.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;
  final ItemLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const ItemRepositoryImpl({required this.networkInfo, required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<ItemEntity>>> getAllItems() async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final data = await remoteDataSource.getItemData();
        localDataSource.cacheItemData(data, cachedKey: 'ITEM_DATA');
        return Right(data.toEntity());
      } on ServerException catch (serverException) {
        return Left(ServerFailure(message: serverException.errorMessage));
      }
    } else {
      try {
        final data = await localDataSource.getCachedItemData(cachedKey: 'ITEM_DATA');
        return Right(data.toEntity());
      } on CacheException {
        return Left(NoConnectionFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> getFilteredItems(FilterParams params) async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final data = await remoteDataSource.getFilteredItemData(params);
        localDataSource.cacheItemData(data, cachedKey: 'FILTERED_ITEM_DATA');
        return Right(data.toEntity());
      } on ServerException catch (serverException) {
        return Left(ServerFailure(message: serverException.errorMessage));
      }
    } else {
      try {
        final data = await localDataSource.getCachedItemData(cachedKey: 'FILTERED_ITEM_DATA');
        return Right(data.toEntity());
      } on CacheException {
        return Left(NoConnectionFailure());
      }
    }
  }
}
