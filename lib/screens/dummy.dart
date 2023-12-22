import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Recommended for\n you devices',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
            child: Text(
              "See All",
              style: TextStyle(color: Colors.blue, fontStyle: FontStyle.normal),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.85,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 58, 57, 57),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.card_travel_sharp,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 58, 57, 57),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.1, screenWidth * 0.3, screenWidth * 0.1, 0),
                      child: SizedBox(
                        height: screenHeight * 0.2,
                        child: Image.asset(
                          'assets/ps4_console_white_1.png',
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Text(
                      "Free Engraving",
                      style: TextStyle(color: Colors.amber[400]),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "AirPods Max - Silver",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "\$899.00", // Added the dollar sign
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 2),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(width: 2),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(width: 2),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.amber,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "+1 more",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LandingScreen(),
  ));
}
