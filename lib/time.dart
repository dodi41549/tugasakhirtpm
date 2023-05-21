import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';
import 'package:tugasakhirtpm/feedback.dart';
import 'package:tugasakhirtpm/home.dart';
import 'package:tugasakhirtpm/kucing.dart';
import 'package:tugasakhirtpm/money.dart';
import 'package:tugasakhirtpm/profil.dart';
import 'package:tugasakhirtpm/screens/login_screen.dart';

class Location {
  final String name;
  final String zone;

  const Location(this.name, this.zone);
}

List<Location> locations = [
  Location('Jakarta', 'Asia/Jakarta'),
  Location('Makassar', 'Asia/Makassar'),
  Location('Jayapura', 'Asia/Jayapura'),
  Location('London', 'Europe/London'),
  Location('New York', 'America/New_York'),
];

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<TimePage> {
  late String _zone;
  late tz.Location _selectedLocation;
  late String _time;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _zone = 'Asia/Jakarta';
    _selectedLocation = tz.getLocation(_zone);
    _setTime();
  }

  void _setZone(String zone) {
    setState(() {
      _zone = zone;
      _selectedLocation = tz.getLocation(_zone);
      _setTime();
    });
  }

  void _setTime() {
    initializeDateFormatting('id', null).then((_) {
      final now = tz.TZDateTime.now(_selectedLocation);
      final formatter = DateFormat('EEEE, d MMMM yyyy, HH:mm:ss', 'id');
      setState(() {
        _time = formatter.format(now);
      });
    });
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('data:image/jpeg;base64,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'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Waktu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      _time,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Zona Waktu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _setZone('Asia/Jakarta');
                          },
                          child: Text('WIB'),
                          style: ElevatedButton.styleFrom(
                            primary:
                            _zone == 'Asia/Jakarta' ? Colors.blue : null,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            _setZone('Asia/Makassar');
                          },
                          child: Text('WITA'),
                          style: ElevatedButton.styleFrom(
                            primary:
                            _zone == 'Asia/Makassar' ? Colors.blue : null,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            _setZone('Asia/Jayapura');
                          },
                          child: Text('WIT'),
                          style: ElevatedButton.styleFrom(
                            primary:
                            _zone == 'Asia/Jayapura' ? Colors.blue : null,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            _setZone('Europe/London');
                          },
                          child: Text('GMT+1'),
                          style: ElevatedButton.styleFrom(
                            primary:
                            _zone == 'Europe/London' ? Colors.blue : null,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            _setZone('America/New_York');
                          },
                          child: Text('EDT'),
                          style: ElevatedButton.styleFrom(
                            primary:
                            _zone == 'America/New_York' ? Colors.blue : null,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
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