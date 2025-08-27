import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:store_service_app/src/core/errors/failure.dart';
import 'package:store_service_app/src/core/usecases/usecase.dart';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';
import 'package:store_service_app/src/features/item/domain/repositories/item_repository.dart';

class GetFilterItemsUseCase implements UseCase<List<ItemEntity>, FilterParams> {
  final ItemRepository repository;

  GetFilterItemsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ItemEntity>>> call(FilterParams params) async {
    return await repository.getFilteredItems(params);
  }
}

class FilterParams extends Equatable {
  final String? category;
  final String? subCategory;

  const FilterParams({this.category, this.subCategory});
  
  @override
  List<Object?> get props => [category, subCategory];

  Map<String,dynamic> toJson(){
    return {
      'category': category,
      'subCategory': subCategory,
    };
  }
}
