import 'package:flutter/material.dart';
import 'package:tugasakhirtpm/feedback.dart';
import 'package:tugasakhirtpm/home.dart';
import 'package:tugasakhirtpm/kucing.dart';
import 'package:tugasakhirtpm/money.dart';
import 'package:tugasakhirtpm/screens/login_screen.dart';
import 'package:tugasakhirtpm/time.dart';

class ProfileMenu extends StatelessWidget {
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade400],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV4OW3ZXni8O0kKlD0fJaurAGkCt4vfR6D3A&usqp=CAU',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Nama : Dodi Al farisy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'NIM : 123200011',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
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
