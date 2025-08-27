import 'package:dartz/dartz.dart';
import 'package:store_service_app/src/core/errors/failure.dart';
import 'package:store_service_app/src/core/usecases/usecase.dart';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';
import 'package:store_service_app/src/features/item/domain/repositories/item_repository.dart';

class GetAllItemsUseCase implements UseCase<List<ItemEntity>, NoParams> {
  final ItemRepository repository;

  GetAllItemsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ItemEntity>>> call(NoParams params) async {
    return await repository.getAllItems();
  }
}


