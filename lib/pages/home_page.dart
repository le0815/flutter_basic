import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/cart_page.dart';
import 'package:flutter_application_3/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentNavInx = 0;

  final List<Widget> pagesList = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  // header image
                  child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(invertColors: true),
                      child: Image.asset(
                        "images/nike_logo.png",
                        width: 150,
                      )),
                ),
                // setting
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color.fromARGB(186, 255, 255, 255),
                  ),
                  title: Text(
                    "Setting",
                    style: TextStyle(color: Color.fromARGB(186, 255, 255, 255)),
                  ),
                ),
                //FAQ
                const ListTile(
                  leading: Icon(
                    Icons.question_answer_rounded,
                    color: Color.fromARGB(186, 255, 255, 255),
                  ),
                  title: Text(
                    "FAQ",
                    style: TextStyle(color: Color.fromARGB(186, 255, 255, 255)),
                  ),
                ),
              ],
            ),
            // logout
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color.fromARGB(186, 255, 255, 255),
                ),
                title: Text(
                  "Log out",
                  style: TextStyle(color: Color.fromARGB(186, 255, 255, 255)),
                ),
              ),
            )
          ],
        ),
      ),
      body: pagesList[currentNavInx],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: currentNavInx,
        enableFeedback: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
        ],
        onTap: (value) {
          setState(() {
            currentNavInx = value;
          });
        },
      ),
    );
  }
}
