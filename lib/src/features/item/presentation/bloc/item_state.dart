part of 'item_bloc.dart';

class ItemState extends Equatable {
  final BlocStateStatus status;
  final List<ItemEntity>? itemData;

  final String? errorMessage;

  const ItemState({required this.status, this.itemData, this.errorMessage});

  @override
  List<Object?> get props => [status, itemData, errorMessage];

  ItemState copyWith({BlocStateStatus? status, List<ItemEntity>? itemData, String? errorMessage}) {
    return ItemState(status: status ?? this.status, itemData: itemData ?? this.itemData, errorMessage: errorMessage ?? this.errorMessage);
  }
}
