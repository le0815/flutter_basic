import 'package:flutter/material.dart';

double _app_bar_size = 0;

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          // width: double.infinity,
          // height: double.infinity,
          child: Column(
            children: [
              _buildSearchBar(),
              _buildTopNav(),
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height - 143 - 56 - 1,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                // constraints: const BoxConstraints.expand(),
                child: const Column(
                  children: [
                    Text("No Recents Item!"),
                    Text("Your recently opened tasks, docs, views, and "
                        "other item will appear here"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTopNav() {
    return Row(
      children: [
        _buildIconWithTextBelow(
          icon: const Icon(Icons.watch_later_outlined),
          text: const Text("Recents"),
        ),
        _buildIconWithTextBelow(
          icon: const Icon(Icons.star_border_outlined),
          text: const Text("Favorites"),
        ),
        _buildIconWithTextBelow(
          icon: const Icon(Icons.location_city_outlined),
          text: const Text("Space"),
        ),
        _buildIconWithTextBelow(
          icon: const Icon(Icons.document_scanner_sharp),
          text: const Text("Docs"),
        ),
        _buildIconWithTextBelow(
          icon: const Icon(Icons.pie_chart_outline_sharp),
          text: const Text(
            "Dashboard",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Expanded _buildIconWithTextBelow({required Icon icon, required Text text}) {
    return Expanded(
      child: Column(
        children: [
          icon,
          text,
        ],
      ),
    );
  }

  Padding _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(39, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Icon(Icons.search),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 30,
                  ),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.stay_primary_portrait_sharp)
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    final AppBar appBar = AppBar(
      title: const Text("Hello world"),
      leadingWidth: 80,
      leading: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Icon(Icons.menu_rounded),
            SizedBox(width: 10),
            Icon(Icons.person),
          ],
        ),
      ),
      actions: const [
        Icon(Icons.settings),
        SizedBox(width: 10),
      ],
    );

    _app_bar_size = appBar.preferredSize.height;

    return appBar;
  }
}
