import 'package:example1/home/tabbar_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView(this.controller);

  final ScrollController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String _randomImage = "https://picsum.photos/200/300";

  String dummyTweet =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium, velit et laoreet hendrerit, risus orci pellentesque tellus, eu bibendum dui lorem eget enim.";

  bool isHeaderClose = false;
  double lastOffset = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: _listView
    );
  }

  Widget get _fabButton => FloatingActionButton(
    onPressed: () {}, 
    child: Icon(Icons.chat_rounded)
  );

  Widget get _expandedListView => Expanded(child: _listView);

  Widget get _listView => ListView.builder(
        itemCount: 7,
        controller: widget.controller,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(_randomImage)),
          title: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            children: <Widget>[_listCardTitle("List"), Text(dummyTweet), _placeHolderField, _footerButtonListRow],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(text, style: titleTextStyle);

  Widget get _placeHolderField => Container(height: 100, child: Placeholder());

  Widget get _footerButtonListRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[_iconLabelButton1, _iconLabelButton2, _iconLabelButton3, _iconLabelButton4],
      );

  Widget _iconLabel1(String text) => Wrap(
        spacing: 5,
        children: <Widget>[Icon(Icons.mode_comment_outlined), Text(text)],
      );

  Widget _iconLabel2(String text) => Wrap(
        spacing: 5,
        children: <Widget>[Icon(Icons.call_missed_outgoing), Text(text)],
      );

  Widget _iconLabel3(String text) => Wrap(
        spacing: 5,
        children: <Widget>[Icon(Icons.heart_broken_outlined), Text(text)],
      );

  Widget _iconLabel4(String text) => Wrap(
        spacing: 5,
        children: <Widget>[Icon(Icons.file_upload_outlined), Text(text)],
      );

  Widget get _iconLabelButton1 => InkWell(
        child: _iconLabel1("1"),
        onTap: () {},
      );

  Widget get _iconLabelButton2 => InkWell(
        child: _iconLabel2("1"),
        onTap: () {},
      );

  Widget get _iconLabelButton3 => InkWell(
        child: _iconLabel3("1"),
        onTap: () {},
      );

  Widget get _iconLabelButton4 => InkWell(
        child: _iconLabel4("1"),
        onTap: () {},
      );
}

