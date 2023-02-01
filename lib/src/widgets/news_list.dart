import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.news, {super.key});

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(news: news[index], index: index);
      },
    );
  }
}

class _News extends StatelessWidget {
  const _News({
    required this.news,
    required this.index,
  });

  final Article news;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(
          news: news,
          index: index,
        ),
        _TitleCard(
          news,
        ),
        _ImageCard(
          news,
        ),
      ],
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Holanda'),
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Text(
        news.title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  const _TopBarCard({
    Key? key,
    required this.news,
    required this.index,
  }) : super(key: key);

  final Article news;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      margin: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
            style: TextStyle(
              color: myTheme.colorScheme.primary,
            ),
          ),
          Text(
            ' ${news.source.name}.',
          ),
        ],
      ),
    );
  }
}
