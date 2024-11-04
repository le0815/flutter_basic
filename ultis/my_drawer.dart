import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 82,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(Icons.home_filled),
                title: Text("Home"),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, "/cart_page"),
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
              ),
            ],
          ),
          ListTile(
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              "/intro_page",
              (route) => false,
            ),
            leading: Icon(Icons.logout),
            title: Text("Exit"),
          ),
        ],
      ),
    );
  }
}
