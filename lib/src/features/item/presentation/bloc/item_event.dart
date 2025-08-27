part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class GetItemsEvent extends ItemEvent {
  const GetItemsEvent();

  @override
  List<Object> get props => [];
}

class GetFilteredItemsEvent extends ItemEvent {
  final FilterParams filterParams;

  const GetFilteredItemsEvent({required this.filterParams});

  @override
  List<Object> get props => [filterParams];
}

class ClearFiltersEvent extends ItemEvent {
  const ClearFiltersEvent();

  @override
  List<Object> get props => [];
}
