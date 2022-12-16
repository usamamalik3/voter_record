import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:voterrecord/auth/athentication.dart';
import 'package:voterrecord/utils/container_menu.dart';

import 'package:voterrecord/utils/dashboard_item_list.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  <Widget>[
                      const SizedBox(height: 10.0),
                       Image.asset("assets/icons/app_icon.png", height: 90, width: 90),
                      // Text(
                      //    FirebaseAuth.instance.currentUser!.email.toString(),
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //       fontSize: 14.0),
                      // ),
                    ],
                  )
                ],
              ),
            ),

            //Here you place your menu items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('ڈیش بورڈ', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            const Divider(height: 3.0),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('رکنیت فارم', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.pushNamed(context, '/partyform');
              },
            ),
            const Divider(height: 3.0),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out', style: TextStyle(fontSize: 18)),
              onTap: () {
                Authentication.signOut(context: context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: const Text("Al-Hayat 360 الحیات"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 72, 163, 75),
                Color.fromARGB(255, 17, 121, 5)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageSlideshow(
                /// Width of the [ImageSlideshow].
                width: double.infinity,

                /// Height of the [ImageSlideshow].
                height: 200,

                /// The page to show when first creating the [ImageSlideshow].
                initialPage: 0,

                /// The color to paint the indicator.

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.grey,

                /// Called whenever the page in the center of the viewport changes.

                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: 3000,

                /// Loops back to first slide.
                isLoop: true,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder
                children: [
                  Image.asset(
                    'assets/images/logoslide.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/aaa.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/786.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/11111.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/000001.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            ContainerMenu(
                list: myList,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 0.90)
          ],
        ),
      ),
    );
  }

  ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
    ),
  );

  Widget kBackBtn = const Icon(
    Icons.arrow_back_ios,
    // color: Colors.black54,
  );
}
