import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/widgets/category_item.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList =
        Provider.of<CategoryListProvider>(context).categoryList;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StackTopNavigationBar(),
            Expanded(
              child: ListView.separated(
                //ListView 내부에 스크롤 기능이 있다.
                itemCount: categoryList.length + 1,
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
                        '모든 할 일',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return CategoryItem(
                      category: categoryList[index - 1].categoryName,
                      // onCheckedTodo: _handleCheckTodoItem,
                      // onDeleteTodo: _deleteTodoItem,
                    );
                  }
                },
              ),
            ),
            CategoryAddBox(),
          ],
        ),
      ),
    );
  }
}

class CategoryAddBox extends StatelessWidget {
  const CategoryAddBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                decoration: InputDecoration(
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
          Icon(
            Icons.add_rounded,
            color: Colors.black,
            size: 28,
          ),
        ],
      ),
    );
  }
}
