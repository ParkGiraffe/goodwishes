import 'package:flutter/material.dart';
import 'package:goodwishes/Models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Function(String) onDeleteCategory;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onDeleteCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context, category.categoryName);
              },
              style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${category.categoryName}   - ${category.count}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          if (category.id != 'no_category')
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyan[300],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 18,
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                highlightColor: Colors.transparent,
                onPressed: () {
                  onDeleteCategory(category.id);
                },
              ),
            )
        ],
      ),
    );
  }
}
