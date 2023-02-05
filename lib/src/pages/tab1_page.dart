import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headLines = Provider.of<NewsService>(context).headLines;

    return Scaffold(
      body: (headLines.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : NewsList(headLines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
