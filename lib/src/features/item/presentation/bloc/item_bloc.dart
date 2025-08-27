import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_service_app/src/core/enums/bloc_state_status.dart';
import 'package:store_service_app/src/core/errors/failure.dart';
import 'package:store_service_app/src/core/usecases/usecase.dart';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_all_items_usecase.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_filter_items_usecase.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetAllItemsUseCase getAllItemsUseCase;
  final GetFilterItemsUseCase getFilterItemsUseCase;

  ItemBloc({required this.getAllItemsUseCase, required this.getFilterItemsUseCase}) : super(const ItemState(status: BlocStateStatus.initial)) {
    on<GetItemsEvent>(_onGetItemsEvent);
    on<GetFilteredItemsEvent>(_onGetFilteredItemsEvent);
    on<ClearFiltersEvent>(_onClearFiltersEvent);
  }

  Future<void> _onGetItemsEvent(GetItemsEvent event, Emitter<ItemState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loadInProgress));
    Either<Failure, List<ItemEntity>> result = await getAllItemsUseCase(NoParams());
    result.fold(
      (failure) {
        final message = _getFailureMessage(failure);
        emit(state.copyWith(status: BlocStateStatus.loadFailure, errorMessage: message));
      },
      (dataList) {
        emit(state.copyWith(status: BlocStateStatus.loadSuccess, itemData: dataList));
      },
    );
  }

  Future<void> _onGetFilteredItemsEvent(GetFilteredItemsEvent event, Emitter<ItemState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loadInProgress));
    Either<Failure, List<ItemEntity>> result = await getFilterItemsUseCase(event.filterParams);
    result.fold(
      (failure) {
        final message = _getFailureMessage(failure);
        emit(state.copyWith(status: BlocStateStatus.loadFailure, errorMessage: message));
      },
      (dataList) {
        emit(state.copyWith(status: BlocStateStatus.loadSuccess, itemData: dataList));
      },
    );
  }

  Future<void> _onClearFiltersEvent(ClearFiltersEvent event, Emitter<ItemState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loadInProgress));
    Either<Failure, List<ItemEntity>> result = await getAllItemsUseCase(NoParams());
    result.fold(
      (failure) {
        final message = _getFailureMessage(failure);
        emit(state.copyWith(status: BlocStateStatus.loadFailure, errorMessage: message));
      },
      (dataList) {
        emit(state.copyWith(status: BlocStateStatus.loadSuccess, itemData: dataList));
      },
    );
  }

  String _getFailureMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NoConnectionFailure) {
      return 'No Connection failure';
    } else {
      return 'Unexpected error';
    }
  }
}
