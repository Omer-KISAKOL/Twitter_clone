import 'package:example1/model/trend_topic.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double _padding = 20;
  late TrendTopic _topic;

  @override
  void initState() {
    super.initState();
    _topic = TrendTopic(hashtag: "#Bisiler", location: "Trending in Turkey", tweets: "16.8K Tweets");
  }

  Future tempFuture() async {
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => tempFuture(),
      child: ListView(
        children: <Widget>[_downIconWidget, _emptySpace, _trendTitleWidget, _listHashView],
      ),
    );
  }

  Widget get _emptySpace => SizedBox(height: 15);

  Widget get _downIconWidget => Container(
        child: Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        ),
      );

  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), side: BorderSide(color: Colors.grey, width: 0.3)),
        child: Container(
          height: 43,
          padding: EdgeInsets.symmetric(horizontal: _padding),
          alignment: Alignment.centerLeft,
          child: Text(
            "Trends for you",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );

  Widget get _divider => Divider(
        height: 0,
        color: Colors.grey,
      );

  Widget get _listHashView => ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => _divider,
        itemBuilder: (context, index) => listCard(context),
      );

  Card listCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        side: BorderSide(style: BorderStyle.none),
      ),
      child: listPadding(context),
    );
  }

  Padding listPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 10),
      child: row(context),
    );
  }

  Row row(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          spacing: 5,
          children: <Widget>[
            Text(_topic.location, style: Theme.of(context).textTheme.caption),
            Text(_topic.hashtag, style: Theme.of(context).textTheme.bodyLarge),
            Text(_topic.tweets, style: Theme.of(context).textTheme.bodyMedium),
          ],
        )),
        Icon(Icons.expand_more, color: Colors.transparent.withAlpha(60))
      ],
    );
  }
}
