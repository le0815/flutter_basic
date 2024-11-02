import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/body_cart.dart';
import 'package:flutter_application_3/components/body_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentNavIdx = 0;

  List<Widget> bodyComponent = [const BodyHome(), const BodyCart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentNavIdx == 0 ? Text("Nike Shop") : Text("Your Cart"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(invertColors: true),
                    child: Image.asset("images/nike_logo.png"),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Setting",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentNavIdx,
        onTap: (value) {
          setState(() {
            currentNavIdx = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Cart",
          ),
        ],
      ),
      body: bodyComponent[currentNavIdx],
    );
  }
}
