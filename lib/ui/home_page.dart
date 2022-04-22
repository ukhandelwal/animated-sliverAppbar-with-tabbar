import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/controller/homepagecontroller.dart';
import 'package:interview_task/utils/CircleTabIndicator.dart';
import 'package:interview_task/utils/StringFile.dart';
import 'package:interview_task/utils/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: homeBackgroundColor,
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                boxShadow: [
                  BoxShadow(
                    color: homeBackgroundColor,
                    blurRadius: 0.5,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
                color: homeSecondaryBackgroundColor),
            child: bodyData(controller.tabs, controller)),
      ),
    );
  }

  Widget bodyData(List<String> tabs, HomePageController controller) {
    return Scaffold(
        backgroundColor: transparentColor,
        body: DefaultTabController(
          length: tabs.length, // This is the number of tabs.
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      backgroundColor: whiteColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      automaticallyImplyLeading: false,
                      floating: true,
                      pinned: true,
                      expandedHeight: 280,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 60.0, left: 25, right: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20.0)),
                                          border: Border.all(
                                              color:
                                                  homeSecondaryNBackgroundColor,
                                              width: 2)),
                                      padding: const EdgeInsets.all(10),
                                      child: const Icon(
                                        Icons.sort,
                                        color: blueColor,
                                      )),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(30.0),
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0)),
                                          border: Border.all(
                                              color: blueColor, width: 1),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: blueColor,
                                              blurRadius: 12.0,
                                              offset: Offset(0.0, 5.0),
                                            ),
                                          ],
                                          color: blueColor),
                                      padding: const EdgeInsets.all(6),
                                      child: const Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    boards,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 40),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: homeSecondaryBackgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          listIcon,
                                          height: 24,
                                          color: blueColor,
                                          width: 24,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          color: greyLightColor,
                                          height: 24,
                                          width: 1,
                                        ),
                                        Image.asset(
                                          gridIcon,
                                          height: 24,
                                          width: 24,
                                          color: greyLightColor,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 0.0, bottom: 0.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    fillColor: homeSecondaryBackgroundColor,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: greyColor,
                                    ),
                                    hintText: searchCard,
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: greyColor)),
                                style: const TextStyle(
                                    color: greyColor, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      primary: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(80.0),
                        // here the desired height
                        child: TabBar(
                          indicator:
                              CircleTabIndicator(color: blueColor, radius: 3),
                          indicatorColor: blueColor,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          indicatorWeight: 1.0,
                          labelColor: blueColor,
                          unselectedLabelColor: blackColor,
                          tabs: tabs
                              .map((String name) => Tab(text: name))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: tabs.map((String name) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 25, right: 25),
                            sliver: SliverFixedExtentList(
                              itemExtent: 260.0,
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Image.asset(
                                              googleIcon,
                                              height: 24,
                                              width: 24,
                                            ),
                                            decoration: const BoxDecoration(
                                                color: whiteColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            padding: const EdgeInsets.all(5),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          const Text(
                                            google,
                                            style: TextStyle(
                                                color: blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        padding: const EdgeInsets.all(15),
                                        margin: const EdgeInsets.only(top: 10),
                                        height: 100,
                                        width: Get.width,
                                        child: Column(
                                          children: const [
                                            Text(
                                              developer,
                                              style: TextStyle(
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              member,
                                              style: TextStyle(
                                                  color: greyLightColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        padding: const EdgeInsets.all(15),
                                        height: 100,
                                        width: Get.width,
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: const [
                                            Text(
                                              developer,
                                              style: TextStyle(
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              member,
                                              style: TextStyle(
                                                  color: greyLightColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      )
                                    ],
                                  );
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
        bottomNavigationBar: bottomNavigationBar(controller));
  }

  Widget bottomNavigationBar(HomePageController controller) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(40),
        bottomLeft: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: transparentColor,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: blueColor,
        unselectedItemColor: homeBottomNavBackgroundColor,
        onTap: controller.onItemTapped,
      ),
    );
  }
}
