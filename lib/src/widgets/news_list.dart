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
        _BodyCard(
          news,
        ),
        _ButtonsCard(),
        SizedBox(
          height: 10.sp,
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: const Icon(Icons.star_border),
          ),
          SizedBox(
            width: 10.sp,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Text(
        (news.description != null) ? news.description! : '',
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.sp),
          bottomRight: Radius.circular(30.sp),
          topLeft: Radius.circular(30.sp),
          topRight: Radius.circular(30.sp),
        ),
        child: Container(
          child: (news.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(news.urlToImage!),
                )
              : const Image(
                  image: AssetImage('assets/img/no-image.png'),
                ),
        ),
      ),
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
