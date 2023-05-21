import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhirtpm/feedback.dart';
import 'package:tugasakhirtpm/money.dart';
import 'package:tugasakhirtpm/profil.dart';
import 'package:tugasakhirtpm/screens/login_screen.dart';
import 'package:tugasakhirtpm/time.dart';
import 'dart:convert';

import 'detail.dart';
import 'home.dart';

class CatMenu extends StatefulWidget {
  @override
  _CatMenuState createState() => _CatMenuState();
}

class _CatMenuState extends State<CatMenu> {
  late Future<List<dynamic>> catBreeds;

  @override
  void initState() {
    super.initState();
    catBreeds = fetchCatBreeds();
  }

  Future<List<dynamic>> fetchCatBreeds() async {
    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody;
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }

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
      body: FutureBuilder<List<dynamic>>(
        future: catBreeds,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final breedName = data[index]['name'];
                final breedOrigin = data[index]['origin'];
                final breedIcon = Icons.pets_rounded;
                final breedDescription = data[index]['description'];
                final breedTemperament = data[index]['temperament'];
                final breedLife_span = data[index]['life_span'];
                final breedWeightI = data[index]['weight']['imperial'];
                final breedWeightM = data[index]['weight']['metric'];


                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMenu(
                          breedName: breedName,
                          breedOrigin: breedOrigin,
                          breedDescription: breedDescription,
                          breedTemperament: breedTemperament,
                          breedLife_span: breedLife_span,
                          breedWeightI: breedWeightI,
                          breedWeightM: breedWeightM,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        breedIcon,
                        size: 50,
                        color: Colors.black,
                      ),
                      title: Text(
                        breedName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Origin: $breedOrigin',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
