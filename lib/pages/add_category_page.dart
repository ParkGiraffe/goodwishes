import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/category_item.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryListProvider = Provider.of<CategoryListProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: UIDefault.pageHorizontalPadding),
          child: Column(
            children: [
              const StackTopNavigationBar(),
              CategoryList(categoryListProvider: categoryListProvider),
              const CategoryAddBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categoryListProvider,
  });

  final CategoryListProvider categoryListProvider;

  @override
  Widget build(BuildContext context) {
    void deleteCategoryHandler(String id) {
      categoryListProvider.removeCategory(id);
    }

    return Expanded(
      child: ListView.separated(
        //ListView 내부에 스크롤 기능이 있다.
        itemCount: categoryListProvider.categoryList.length + 1,
        separatorBuilder: (context, index) {
          if (index == 0) return const SizedBox.shrink();
          return const SizedBox(
            height: 5,
          );
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: const Text(
                '굿즈 분류 목록',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } else {
            return CategoryItem(
              category: categoryListProvider.categoryList.elementAt(index - 1),
              // onCheckedTodo: _handleCheckTodoItem,
              onDeleteCategory: deleteCategoryHandler,
            );
          }
        },
      ),
    );
  }
}

class CategoryAddBox extends StatelessWidget {
  const CategoryAddBox({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final categoryListProvider = Provider.of<CategoryListProvider>(context);
    String newCategory = '';

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller,
                onChanged: (val) {
                  newCategory = val;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '긋즈 분류 추가',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (newCategory != '') {
                categoryListProvider.addCategory(
                  Category(
                      id: DateTime.now().toString(),
                      categoryName: newCategory,
                      count: 0),
                );
                newCategory = '';
                controller.clear();
              }
            },
            icon: const Icon(Icons.add_rounded),
            color: Colors.black,
            constraints: const BoxConstraints(),
            style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
        ],
      ),
    );
  }
}
