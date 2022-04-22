import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  final List<String> _tabs = <String>[
    "Featured",
    "Popular",
    "Latest",
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: DefaultTabController(
          length: _tabs.length, // This is the number of tabs.
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      automaticallyImplyLeading: false,
                      actions: [
                        SizedBox(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.add_box_outlined),
                              Icon(Icons.add_box_outlined)
                            ],
                          ),
                        ),
                      ],
                      floating: true,
                      pinned: true,
                      snap: false,
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: const Text("Collapsing Toolbar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                          background: Image.network(
                            "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                            fit: BoxFit.cover,
                          )),
                      primary: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: _tabs.map((String name) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8.0),
                            sliver: SliverFixedExtentList(
                              itemExtent: 60.0,
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Container(
                                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt() <<0).withOpacity(1.0));
                                },
                                childCount: 30,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
