import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slidingwidget/app_state.dart';
import 'package:slidingwidget/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 90.0,
        width: 90.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.orange : Colors.orangeAccent,
              width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.orange : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              color: isSelected ? Colors.white : Colors.orange,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              category.name,
              style:
                  TextStyle(color: isSelected ? Colors.white : Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
