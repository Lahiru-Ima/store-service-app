import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_service_app/src/core/di/injector.dart';
import 'package:store_service_app/src/core/enums/bloc_state_status.dart';
import 'package:store_service_app/src/features/item/domain/usecases/get_filter_items_usecase.dart';
import 'package:store_service_app/src/features/item/presentation/bloc/item_bloc.dart';
import 'package:store_service_app/src/features/item/presentation/widgets/item_card.dart';

class ItemListPageWrapper extends StatelessWidget {
  const ItemListPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemBloc>(create: (context) => sl<ItemBloc>()..add(GetItemsEvent()), child: ItemListPage());
  }
}

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  String? _selectedCategory;
  String? _selectedSubCategory;
  List<dynamic> _allItems = [];

  void _applyFilters() {
    if (_selectedCategory == null && _selectedSubCategory == null) {
      context.read<ItemBloc>().add(GetItemsEvent());
    } else {
      context.read<ItemBloc>().add(
        GetFilteredItemsEvent(
          filterParams: FilterParams(category: _selectedCategory, subCategory: _selectedSubCategory),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Store View', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[50],
            child: Column(
              children: [
                BlocListener<ItemBloc, ItemState>(
                  listener: (context, state) {
                    if (state.status == BlocStateStatus.loadSuccess) {
                      if (_selectedCategory == null && _selectedSubCategory == null && state.itemData != null) {
                        _allItems = state.itemData!;
                      }
                    }
                  },
                  child: BlocBuilder<ItemBloc, ItemState>(
                    builder: (context, state) {
                      final categories = _allItems.map((e) => e.category).toSet().toList()..sort();
                      final subCategories = _allItems.map((e) => e.subCategory).toSet().toList()..sort();

                      return Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                  child: Icon(Icons.tune, color: Colors.blue[600], size: 16),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Filter Items',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                                ),
                                const Spacer(),
                                if (_selectedCategory != null || _selectedSubCategory != null)
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedCategory = null;
                                        _selectedSubCategory = null;
                                      });
                                      context.read<ItemBloc>().add(GetItemsEvent());
                                    },
                                    child: const Text('Clear Filters', style: TextStyle(color: Colors.blue)),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Category',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.grey[200]!),
                                        ),
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedCategory,
                                          hint: Text('All', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                                          decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                                          items: [
                                            const DropdownMenuItem(value: null, child: Text('All')),
                                            ...categories.map((category) {
                                              return DropdownMenuItem(value: category, child: Text(category));
                                            }),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedCategory = value;
                                              _selectedSubCategory = null;
                                            });
                                            _applyFilters();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subcategory',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.grey[200]!),
                                        ),
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedSubCategory,
                                          hint: Text('All', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                                          decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                                          items: [
                                            const DropdownMenuItem(value: null, child: Text('All')),
                                            ...subCategories.map((subCategory) {
                                              return DropdownMenuItem(value: subCategory, child: Text(subCategory));
                                            }),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedSubCategory = value;
                                            });
                                            _applyFilters();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Items List
          Expanded(
            child: BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                if (state.status == BlocStateStatus.loadInProgress) {
                  return const Center(child: CircularProgressIndicator(color: Colors.blue));
                } else if (state.status == BlocStateStatus.loadSuccess) {
                  final items = state.itemData ?? [];

                  if (items.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            _selectedCategory != null || _selectedSubCategory != null ? 'No items match your filters' : 'No items found',
                            style: TextStyle(fontSize: 18, color: Colors.grey[600], fontWeight: FontWeight.w500),
                          ),
                          if (_selectedCategory != null || _selectedSubCategory != null) ...[
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _selectedCategory = null;
                                  _selectedSubCategory = null;
                                });
                                context.read<ItemBloc>().add(GetItemsEvent());
                              },
                              child: const Text('Clear filters to see all items'),
                            ),
                          ],
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ItemCard(item: item);
                    },
                  );
                } else if (state.status == BlocStateStatus.loadFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                        const SizedBox(height: 16),
                        Text(
                          'Something went wrong',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600], fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.errorMessage ?? 'An error occurred',
                          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ItemBloc>().add(GetItemsEvent());
                          },
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
