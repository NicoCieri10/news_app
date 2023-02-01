import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            Expanded(
              child: _CategoriesList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            children: [
              Icon(categories[index].icon),
              SizedBox(height: 5.sp),
              Text(categories[index].name),
            ],
          ),
        );
      },
    );
  }
}
