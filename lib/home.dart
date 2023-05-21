import 'package:flutter/material.dart';
import 'package:tugasakhirtpm/feedback.dart';
import 'package:tugasakhirtpm/money.dart';
import 'package:tugasakhirtpm/profil.dart';
import 'package:tugasakhirtpm/screens/login_screen.dart';
import 'package:tugasakhirtpm/time.dart';

import 'kucing.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String imageUrl = 'data:image/jpeg;base64,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';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  Text('Home'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.pets),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CatMenu()),
                      );
                    },
                  ),
                  Text('Kucing'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.monetization_on),
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConverterMenu()),
                    );
                    },
                  ),
                  Text('Mata Uang'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {
                      // Action when "Waktu" button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TimePage()),
                      );
                    },
                  ),
                  Text('Waktu'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          width: 1300, // Ubah ukuran lebar sesuai kebutuhan
          height: 500, // Ubah ukuran tinggi sesuai kebutuhan
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Saran & Kesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileMenu()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackMenu()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
