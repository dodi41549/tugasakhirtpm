import 'package:flutter/material.dart';
import 'package:tugasakhirtpm/feedback.dart';
import 'package:tugasakhirtpm/money.dart';
import 'package:tugasakhirtpm/profil.dart';
import 'package:tugasakhirtpm/screens/login_screen.dart';
import 'package:tugasakhirtpm/time.dart';

import 'home.dart';
import 'kucing.dart';

class DetailMenu extends StatelessWidget {
  final String breedName;
  final String breedOrigin;
  final String breedDescription;
  final String breedTemperament;
  final String breedLife_span;
  final String breedWeightI;
  final String breedWeightM;


  DetailMenu({
    required this.breedName,
    required this.breedOrigin,
    required this.breedDescription,
    required this.breedTemperament,
    required this.breedLife_span,
    required this.breedWeightI,
    required this.breedWeightM,
  });

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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'data:image/jpeg;base64,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',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
            SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(
                      Icons.pets,
                      size: 48,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Breed Name :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  breedName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Origin :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  breedOrigin,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Temperament :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  breedTemperament,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Life Span :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  breedLife_span,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Weight :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Imperial : ${breedWeightI}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Metric : ${breedWeightM}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Description :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  breedDescription,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
            ),
        ],
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
