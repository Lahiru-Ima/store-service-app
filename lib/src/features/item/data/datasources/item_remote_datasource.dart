import 'package:store_service_app/src/core/network/dio_client.dart';
import 'package:store_service_app/src/features/item/data/models/item_model.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_filter_items_usecase.dart';

abstract class ItemRemoteDataSource {
  Future<List<ItemModel>> getItemData();
  Future<List<ItemModel>> getFilteredItemData(FilterParams params);
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final DioClient dioClient;

  ItemRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<ItemModel>> getItemData() async {
    final response = await dioClient.public.get('/items');
    return (response.data as List).map((item) => ItemModel.fromJson(item)).toList();
  }

  @override
  Future<List<ItemModel>> getFilteredItemData(FilterParams params) async {
    final response = await dioClient.public.get('/items/filter', queryParameters: params.toJson());
    print(response.data);
    return (response.data as List).map((item) => ItemModel.fromJson(item)).toList();
  }
}
