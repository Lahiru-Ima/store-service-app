import 'package:store_service_app/src/core/enums/enum_values.dart';

enum BlocStateStatus { initial, loadInProgress, loadSuccess, loadFailure }
  
final blocStateStatusValues = EnumValues({
  'initial': BlocStateStatus.initial,
  'loadInProgress': BlocStateStatus.loadInProgress,
  'loadSuccess': BlocStateStatus.loadSuccess,
  'loadFailure': BlocStateStatus.loadFailure,
});
