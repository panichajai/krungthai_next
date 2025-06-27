import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:krungthai_next/home/controllers/homecontroller.dart';
import 'package:krungthai_next/utils/imageapp.dart';
import 'package:krungthai_next/widgets/dialogs/dialog.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final HomeController homeController = Get.put(HomeController());

  final List<Map<String, dynamic>> primaryFeatures = [
    {'title': 'Transfer', 'icon': Icons.credit_card},
    {'title': 'Top Up', 'icon': Icons.credit_card},
    {'title': 'Pay Bills', 'icon': Icons.credit_card},
    {'title': 'ATM', 'icon': Icons.credit_card},
    {'title': 'More', 'icon': Icons.more_horiz},
  ];

  final List<Map<String, dynamic>> secondaryFeatures = [
    {'title': 'Funds', 'icon': Icons.credit_card},
    {'title': 'Insurance', 'icon': Icons.credit_card},
    {'title': 'Loan', 'icon': Icons.credit_card},
    {'title': 'More', 'icon': Icons.more_horiz},
    {'title': 'More', 'icon': Icons.more_horiz},
  ];

  final List<Map<String, dynamic>> favorites = [
    {'title': 'Funds', 'icon': Icons.person},
    {'title': 'More', 'icon': Icons.add},
  ];

  final List<Map<String, dynamic>> promotions = [
    {'title': 'Promotion 1!', 'color': Colors.blue},
    {'title': 'Promotion 2!', 'color': Colors.green},
    {'title': 'Promotion 3!', 'color': Colors.orange},
    {'title': 'Promotion 4!', 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("krungthai Next"),
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.all(10.r),
              child: ClipOval(
                child: Image.asset(
                  ImageApp.person,
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.dialog(
                DialogApp(
                  content: "ยืนยันการออกจากระบบ".tr,
                  submit: () {
                    Get.back();
                  },
                ),
                barrierDismissible: false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Live Life to the NEXT',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: primaryFeatures.length,
                      itemBuilder: (context, index) {
                        final feature = primaryFeatures[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: FeatureIcon(
                            title: feature['title'],
                            icon: feature['icon'],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: secondaryFeatures.length,
                      itemBuilder: (context, index) {
                        final feature = secondaryFeatures[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: FeatureIcon(
                            title: feature['title'],
                            icon: feature['icon'],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Favorites",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final favorite = favorites[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: FeatureIcon(
                        title: favorite['title'],
                        icon: favorite['icon'],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Promotion",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: promotions.length,
                itemBuilder: (context, index) {
                  final promotion = promotions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: CardWidget(
                      title: promotion['title'],
                      color: promotion['color'],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          homeController.currentPageIndex.value =
              index; // 🔹 ไม่ใช้ setState แล้ว
        },
        indicatorColor: Colors.amber,
        selectedIndex: homeController.currentPageIndex.value,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(height: 50.0),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment Counter',
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class FeatureIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeatureIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;
  final String title;

  const CardWidget({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
