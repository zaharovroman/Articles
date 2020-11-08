import 'package:articles/utils/strings.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:dart_rss/domain/rss1_feed.dart';
import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart' as browser_client;

class MyRssClient {
  String _feedLink;
  RssFeed _feed;
  browser_client.BrowserClient _client = browser_client.BrowserClient();
  MyRssClient._private();

  static final MyRssClient _instance = MyRssClient._private();

  static MyRssClient get shared => _instance;
  RssFeed get feed => _feed;

  setFeedLink(String link) {
    _feedLink = link;

    // Future<List<RssItem>> getChannel() async {
    //   var body = await getBody();
    //   print(body);
    //   return RssFeed.parse(body).items;
    // }
  }

  Future<List<RssItem>> getChannel() async {
    _client.head(_feedLink);
    // _client.get(_feedLink).then((response) {
    //   return response.body;
    // }).then((value) {
    //   var channel = Rss1Feed.parse(value);
    // });
    // _client.close();
    return [];

    // return _client.read(_feedLink).then((response) {
    //   return response;
    // }).then((bodyString) {
    //   var channel = RssFeed.parse(bodyString);
    //   _client.close();

    //   return channel.items;
    // });
  }
}
