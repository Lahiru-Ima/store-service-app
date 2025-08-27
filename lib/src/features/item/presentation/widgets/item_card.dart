import 'package:flutter/material.dart';
import 'package:store_service_app/src/features/item/domain/entities/item_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.inventory_2_outlined, color: Colors.blue[600], size: 20),
        ),
        title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  item.brand.toUpperCase(),
                  style: TextStyle(color: Colors.blue[700], fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  item.category.toUpperCase(),
                  style: TextStyle(color: Colors.green[700], fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  item.subCategory.toUpperCase(),
                  style: TextStyle(color: Colors.orange[700], fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
