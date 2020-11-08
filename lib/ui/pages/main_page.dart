import 'package:articles/logic/rss_client.dart';
import 'package:articles/ui/widgets/card_of_article.dart';
import 'package:articles/utils/strings.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:dart_rss/domain/rss1_feed.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    MyRssClient.shared.setFeedLink(habr_ml_rss_link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
          ),
          // child: ListView.builder(
          //     itemCount: MyRssClient.shared.feed.items.length,
          //     itemBuilder: (context, index) {
          //       var item = MyRssClient.shared.feed.items[index];
          //       return Text(item.title);
          //     })
          child: FutureBuilder(
            builder: (context, projectSnap) {
              if (projectSnap.data == null) {
                print("Cont");

                return Container();
              }
              return ListView.builder(
                  itemCount: projectSnap.data.length,
                  itemBuilder: (context, index) {
                    RssItem item = projectSnap.data[index];
                    print("DATA");
                    return Text(item.title);
                  });
            },
            future: MyRssClient.shared.getChannel(),
          )
          // child: ListView(

          //   children: [
          //     CardOfArticle("Title 1", "Description 1"),
          //     CardOfArticle("Title 1", "Description 1"),
          //     CardOfArticle("Title 1", "Description 1"),
          //   ],
          // ),
          ),
    );
  }
}
