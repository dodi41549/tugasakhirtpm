import 'package:flutter/material.dart';
import 'package:tugasakhirtpm/feedback.dart';
import 'package:tugasakhirtpm/home.dart';
import 'package:tugasakhirtpm/kucing.dart';
import 'package:tugasakhirtpm/profil.dart';
import 'package:tugasakhirtpm/screens/login_screen.dart';
import 'package:tugasakhirtpm/time.dart';

class ConverterMenu extends StatefulWidget {
  @override
  _CurrencyConverterMenuState createState() => _CurrencyConverterMenuState();
}

class _CurrencyConverterMenuState extends State<ConverterMenu> {
  double rupiahAmount = 0.0;
  double convertedAmount = 0.0;
  double usdAmount = 0.0;
  double euroAmount = 0.0;
  double poundAmount = 0.0;
  String selectedCurrency = 'USD';

  void convertCurrency() {
    if (selectedCurrency == 'USD') {
      usdAmount = rupiahAmount / 14800;
      euroAmount = 0.0;
      poundAmount = 0.0;
    } else if (selectedCurrency == 'EURO') {
      usdAmount = 0.0;
      euroAmount = rupiahAmount / 16200;
      poundAmount = 0.0;
    } else if (selectedCurrency == 'POUND') {
      usdAmount = 0.0;
      euroAmount = 0.0;
      poundAmount = rupiahAmount / 18500;
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStuaTfUysdKLWtB8XGcOWwMyVgprRCAtTGrg&usqp=CAU',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
              'Konversi Mata Uang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  rupiahAmount = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Masukkan Jumlah Rupiah',
                prefixIcon: Icon(Icons.attach_money),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedCurrency,
              hint: Text(
                'Pilih Mata Uang',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
              ),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurrency = newValue!;
                });
              },
              items: <String>['USD', 'EURO', 'POUND'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  convertCurrency();
                });
              },
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi:',
            style: TextStyle(
            fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
                SizedBox(height: 10),
                selectedCurrency.isNotEmpty
                    ? Text(
                  '${selectedCurrency == 'USD' ? usdAmount.toStringAsFixed(2) :
                  selectedCurrency == 'EURO' ? euroAmount.toStringAsFixed(2) :
                  selectedCurrency == 'POUND' ? poundAmount.toStringAsFixed(2) : '0.0'
                  } $selectedCurrency',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
                    : Container(),
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