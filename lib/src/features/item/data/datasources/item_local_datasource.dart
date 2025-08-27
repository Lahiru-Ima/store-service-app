import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_service_app/src/core/errors/exception.dart';
import 'package:store_service_app/src/features/item/data/models/item_model.dart';

abstract class ItemLocalDataSource {
  Future<List<ItemModel>> getCachedItemData({required String cachedKey});

  Future<void> cacheItemData(List<ItemModel> itemModels, {required String cachedKey});
}

class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  final SharedPreferences sharedPreferences;

  const ItemLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheItemData(List<ItemModel> itemModels, {required String cachedKey}) async {
    sharedPreferences.setString(cachedKey, itemModelListToJson(itemModels));
  }

  @override
  Future<List<ItemModel>> getCachedItemData({required String cachedKey}) async {
    final jsonString = sharedPreferences.getString(cachedKey);
    if (jsonString != null) {
      return Future.value(itemModelListFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }
}
