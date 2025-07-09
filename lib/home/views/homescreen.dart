import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:krungthai_next/home/controllers/homecontroller.dart';
import 'package:krungthai_next/home/models/bannermodel.dart';
import 'package:krungthai_next/home/models/favoritemodel.dart';
import 'package:krungthai_next/home/models/featuremodel.dart';
import 'package:krungthai_next/home/models/promotionmodel.dart';
import 'package:krungthai_next/home/views/bannerscreen.dart';
import 'package:krungthai_next/home/views/favoritescreen.dart';
import 'package:krungthai_next/home/views/featurescreen.dart';
import 'package:krungthai_next/home/views/promotionscreen.dart';
import 'package:krungthai_next/profile/views/profilescreen.dart';
import 'package:krungthai_next/testscan.dart';
import 'package:krungthai_next/testscreen.dart';
import 'package:krungthai_next/utils/imageapp.dart';
import 'package:krungthai_next/widgets/barcode.dart';
import 'package:krungthai_next/widgets/dialogs/dialog.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App?'),
            content: Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
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
              SizedBox(height: 16.h),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: GestureDetector(
                          //เอาไว้เรียก onTap
                          onTap: () {
                            Get.to(() => BannerScreen(title: banner.title));
                          },
                          child: CardWidget(
                            title: banner.title,
                            color: banner.color,
                          ),
                        ));
                  },
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                height: 260,
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: features.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    final feature = features[index];
                    return GestureDetector(
                      //เอาไว้เรียก onTap
                      onTap: () {
                        Get.to(() => FeatureScreen(title: feature.title));
                      },
                      child: FeatureIcon(
                        title: feature.title ?? '',
                        icon: feature.icon ?? Icons.help_outline,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Favorites",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => FavoriteScreen());
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ))
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
                        padding: EdgeInsets.only(right: 16),
                        child: FeatureIcon(
                          title: favorite.title ?? "",
                          icon: favorite.icon ?? Icons.help_outline,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        child: GestureDetector(
                          //เอาไว้เรียก onTap
                          onTap: () {
                            Get.to(
                                () => PromotionScreen(title: promotion.title));
                          },
                          child: CardWidget(
                            title: promotion.title,
                            color: promotion.color,
                          ),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Account',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_outlined),
              label: 'Scan',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: 'Services',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            switch (index) {
              case 0:
                break;
              case 1:
                Get.to(() => MyWidget());
                break;
              case 2:
                Get.to(() => BarcodeScannerScreen());
              case 3:
                Get.to(() => MyApp());
                break;
              case 4:
                Get.to(() => ProfileScreen());
                break;
            }
          },
        ),
      ),
    );
  }
}

class FeatureIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeatureIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
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
