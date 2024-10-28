// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const Test2());
  // runApp(const MaterialApp(
  //   home: Scaffold(
  //     // backgroundColor: Colors.blue[100],
  //     // appBar: AppBar(
  //     //   backgroundColor: Colors.blue[400],
  //     //   title: const Text("App bar"),
  //     //   leading: const Icon(Icons.menu),
  //     // ),
  //     body: Test(),
  //   ),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text("App bar"),
          leading: Icon(Icons.menu),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: const Text(
              "Somewhere only we know",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("images/1007238.jpeg"),
        const Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Header",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Body"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text("Song's"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 214, 173, 233),
                  Colors.blue
                ],
              ),
            ),
          ),
          leadingWidth: 50,
          leading: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage("images/1007238.jpeg"),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: const Column(
            children: [
              TopNav(),
              MusicCard(
                image_addr: "images/1007238.jpeg",
                liked_number: "99",
                singer: "Mountain MTP",
                song_name: "Don't be late",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          const Icon(Icons.watch_later_outlined),
          Text(label),
        ],
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  final String song_name;
  final String image_addr;
  final String liked_number;
  final String singer;

  const MusicCard(
      {super.key,
      required this.song_name,
      required this.image_addr,
      required this.liked_number,
      required this.singer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(104, 255, 255, 255),
      shadowColor: null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //   width: 60,
            //   height: 60,
            //   color: Colors.red,
            // ),
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(image_addr),
            ),
            Expanded(
              flex: 5,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song_name,
                  ),
                  Text(
                    singer,
                    style: const TextStyle(
                        fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.play_arrow),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.favorite),
                  Text(
                    liked_number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Color.fromARGB(64, 0, 0, 0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Text("My music"),
            ),
            Expanded(
              flex: 1,
              child: Text("Shared"),
            ),
            Expanded(
              flex: 0,
              child: Text("Feed"),
            ),
          ],
        ),
      ),
    );
  }
}
