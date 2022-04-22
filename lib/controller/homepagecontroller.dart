import 'package:get/get.dart';

class HomePageController extends GetxController {

  final List<String> tabs = <String>[
    "All Boards",
    "Teams",
    "Personal",
  ];

  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onItemTapped(int value) {
  }
}
