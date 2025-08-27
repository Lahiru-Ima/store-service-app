import 'package:dio/dio.dart';
import '../config/env_config.dart';

class DioClient {
  Dio public;

  DioClient({required this.public}) {
    public.options = BaseOptions(baseUrl: EnvConfig.baseUrl, connectTimeout: const Duration(seconds: 5), receiveTimeout: const Duration(seconds: 3), responseType: ResponseType.json);
  }
}
