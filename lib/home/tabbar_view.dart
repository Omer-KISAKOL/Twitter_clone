import 'package:example1/home/search_view.dart';
import 'package:example1/home/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:example1/home/home_view.dart';

class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({super.key});

  @override
  State<TwitterTabbarView> createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  int defualtTabLength = 4;
  String myPhoto ="https://picsum.photos/200/300";
  bool isHeaderClose = false;
  double lastOffset = 0;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.offset);

      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >= scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: defualtTabLength,
      initialIndex: 0,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: <Widget>[_containerAppbar, _tabbarView],
        ),
      ),
    );
  }

  Widget get _tabbarView => Expanded(
          child: TabBarView(children: <Widget>[
        HomeView(scrollController),
        SearchView(),
        WidgetTree(),
        Text("data"),
      ]));

  Widget get _bottomAppBar => BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: _tabbarItems,
      );

  Widget get _containerAppbar =>
      AnimatedContainer(duration: Duration(milliseconds: 500), height: isHeaderClose ? 0 : 85, child: _appBar);

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _appBarItems => Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: NetworkImage(myPhoto), ),
          _emptyWidht,
          Expanded(child: _centerAppBarWidget),
          _emptyWidht,
          Icon(Icons.settings_outlined, color: Colors.blue)
        ],
      );

  Widget get _emptyWidht => SizedBox(width: 20);

  Widget get _centerAppBarWidget => currentIndex == 1 ? _searchTextField : Text('Home', style: titleTextStyle);

  Widget get _searchTextField => TextField(
    maxLines: 1,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0),
      labelText: "Hello",
      hintText: "Search Twitter", 
      prefixIcon: Icon(Icons.search, color: Colors.grey),
      filled: true,
      fillColor: Color.fromARGB(94, 158, 158, 158),
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    ),
  );

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(30));

  Widget get _tabbarItems => TabBar(
          isScrollable: false,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home_outlined)),
            Tab(icon: Icon(Icons.search_outlined)),
            Tab(icon: Icon(Icons.notifications_active_outlined)),
            Tab(icon: Icon(Icons.chat_outlined)),
          ]);

}

final titleTextStyle = TextStyle(letterSpacing: 0, fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black);
