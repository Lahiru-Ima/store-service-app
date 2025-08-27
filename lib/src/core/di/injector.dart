import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_service_app/src/core/network/dio_client.dart';
import 'package:store_service_app/src/core/network/network_info.dart';
import 'package:store_service_app/src/features/item/data/datasources/item_local_datasource.dart';
import 'package:store_service_app/src/features/item/data/datasources/item_remote_datasource.dart';
import 'package:store_service_app/src/features/item/data/repositories/item_repository_impl.dart';
import 'package:store_service_app/src/features/item/domain/repositories/item_repository.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_all_items_usecase.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_filter_items_usecase.dart';
import 'package:store_service_app/src/features/item/presentation/bloc/item_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Network
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient(public: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.createInstance());

  /// Feature: Item
  // Blocs
  sl.registerFactory<ItemBloc>(() => ItemBloc(getAllItemsUseCase: sl(), getFilterItemsUseCase: sl()));

  // Usecases
  sl.registerLazySingleton<GetAllItemsUseCase>(() => GetAllItemsUseCase(repository: sl()));
  sl.registerLazySingleton<GetFilterItemsUseCase>(() => GetFilterItemsUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<ItemRemoteDataSource>(() => ItemRemoteDataSourceImpl(dioClient: sl()));
  sl.registerLazySingleton<ItemLocalDataSource>(() => ItemLocalDataSourceImpl(sharedPreferences: sl()));

  // Repositories
  sl.registerLazySingleton<ItemRepository>(() => ItemRepositoryImpl(networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));
}
