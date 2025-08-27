import 'package:dartz/dartz.dart';
import 'package:store_service_app/src/core/errors/failure.dart';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_filter_items_usecase.dart';

abstract class ItemRepository {
    Future<Either<Failure, List<ItemEntity>>> getAllItems();
    Future<Either<Failure, List<ItemEntity>>> getFilteredItems(FilterParams params);
}
