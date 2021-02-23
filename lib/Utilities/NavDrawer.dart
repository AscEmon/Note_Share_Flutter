import 'package:NoteShare/Utilities/NavDrawerTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xfff90000),
            height: Get.height * 0.2,
            width: Get.width,
            child: Image.asset("images/noteShareSplash.png",
            
            )
          ),
       
          NavDrawerTile(
            navIcon: Icons.camera,
            navTitle: 'Camera',
            onNavPress: () {
            //  Get.toNamed(AppRoutes.FAVOURITE);
            },
          ),
          NavDrawerTile(
            navIcon: Icons.image,
            navTitle: 'Gallary',
            onNavPress: () {
             // Get.toNamed(AppRoutes.NAVPROPOSALS);
            },
          ),
       
          NavDrawerTile(
            navIcon: Icons.contact_page,
            navTitle: 'Contact Us',
            onNavPress: () {
             // Get.toNamed(AppRoutes.NAVPOSTAJOB);
            },
          ),
          NavDrawerTile(
            navIcon: Icons.account_box_outlined,
            navTitle: 'About Us',
            onNavPress: () {
              //Get.toNamed(AppRoutes.NAVJOBPAGE);
            },
          ),
          NavDrawerTile(
            navIcon: Icons.logout,
            navTitle: 'Sign Out',
            onNavPress: () {
             // Get.toNamed(AppRoutes.PACKAGES);
            },
          ),
          NavDrawerTile(
            navIcon: Icons.thumb_up,
            navTitle: 'Rate this App',
            onNavPress: () {
              Get.defaultDialog(
                  title: "Rate Application",
                  content: Text("Please rate the app at Play Store"),
                  onConfirm: () {
                   // launchURL(AppUrl.rateThisApp);
                  },
                  onCancel: () {
                    Get.back();
                  },
                  textCancel: "CANCEL",
                  textConfirm: "RATE",
                  confirmTextColor: Colors.white,
                  radius: 10,
                  buttonColor: Colors.red);
            },
          ),
         
         
        ],
      ),
    );
  }
}
