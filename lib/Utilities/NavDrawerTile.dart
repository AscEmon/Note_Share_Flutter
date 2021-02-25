import 'package:flutter/material.dart';


class NavDrawerTile extends StatelessWidget {
  final String navTitle;
  final IconData navIcon;
  final Function onNavPress;
  const NavDrawerTile({Key key, this.navTitle, this.navIcon,this.onNavPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onNavPress,
      leading: Icon(navIcon,color: Colors.black,),
      title: Text(
        navTitle,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
