import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _CategoriesList(),
            if (!newsService.isLoading)
              Expanded(
                child: (newsService.getArticlesSelectedCategory == null)
                    ? const Center(child: CircularProgressIndicator())
                    : NewsList(newsService.getArticlesSelectedCategory!),
              ),
            if (newsService.isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
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

    return SizedBox(
      width: double.infinity,
      height: 80.sp,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final name = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                SizedBox(height: 5.sp),
                Text('${name[0].toUpperCase()}${name.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40.sp,
        height: 40.sp,
        margin: EdgeInsets.symmetric(horizontal: 10.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: newsService.selectedCategory == category.name
              ? myTheme.colorScheme.primary
              : Colors.white,
        ),
        child: Icon(
          category.icon,
          color: newsService.selectedCategory == category.name
              ? Colors.white
              : Colors.black54,
        ),
      ),
    );
  }
}
