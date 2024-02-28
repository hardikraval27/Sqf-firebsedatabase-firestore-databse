// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pilllist/Inventory.dart';
import 'package:pilllist/Payment.dart';
import 'package:pilllist/Rupees.dart';
import 'package:pilllist/Stockin.dart';
import 'package:pilllist/BIll.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  }
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3DM3mwk7iV4ApaQN2o05JMWz3P1nl_G0",
          authDomain: "helthcaredashbord.firebaseapp.com",
          databaseURL: "https://helthcaredashbord-default-rtdb.firebaseio.com",
          projectId: "helthcaredashbord",
          storageBucket: "helthcaredashbord.appspot.com",
          messagingSenderId: "165152646444",
          appId: "1:165152646444:web:8d2a119aa4f24e6a4cb889",
          measurementId: "G-RJET21LCL8"));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  late String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BalsamiqSans'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SliderDrawer(
            appBar: SliderAppBar(
                appBarColor: Colors.white,
                title: Text(title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700))),
            key: _sliderDrawerKey,
            sliderOpenSize: 179,
            sliderCloseSize: 50,
            slider: _SliderView(
              onItemClick: (title) {
                _sliderDrawerKey.currentState!.closeSlider();
                setState(() {
                  this.title = title;

                  if (title == "Bill") {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const name();
                      },
                    ));
                  } else if (title == "Inventory") {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const inventory();
                      },
                    ));
                  } else if (title == "Stock In") {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Stock();
                      },
                    ));
                  } else if (title == "Rupees") {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Rupees();
                      },
                    ));
                  } else if (title == "Payment") {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Payment();
                      },
                    ));
                  } else if (title == "LogOut") {}
                });
              },
            ),
            child: _AuthorList()),
      ),
    );
  }
}

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Nick',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(Image.asset('assets/bill.png'), 'Bill'),
            Menu(Image.asset('assets/ready-stock.png'), 'Inventory'),
            Menu(Image.asset('assets/log-in.png'), 'Stock In'),
            //  Menu(Image.asset('assets/ready-stock.png'), 'Stock Out'),
            Menu(Image.asset('assets/rupee-indian.png'), 'Rupees'),
            Menu(
              Image.asset('assets/payment.png'),
              'Payment',
            ),
            Menu(
              Image.asset('assets/exit.png'),
              'LogOut',
            ),
          ]
              .map(
                (menu) => _SliderMenuItem(
                    title: menu.title,
                    iconData: menu.iconData,
                    onTap: onItemClick),
              )
              .toList(),
          const Divider(
            height: 10,
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text("Management")),
              InkWell(
                onTap: () {},
                child: ListTile(
                    leading: SizedBox(
                        height: 30,
                        child: Image.asset(
                          'assets/payment.png',
                        )),
                    trailing: const Text(
                      "Inventory",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                    leading: SizedBox(
                        height: 30,
                        child: Image.asset(
                          'assets/payment.png',
                        )),
                    trailing: const Text(
                      "Inventory",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                    leading: SizedBox(
                        height: 30,
                        child: Image.asset(
                          'assets/payment.png',
                        )),
                    trailing: const Text(
                      "Inventory",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                    leading: SizedBox(
                        height: 30,
                        child: Image.asset(
                          'assets/payment.png',
                        )),
                    trailing: const Text(
                      "Inventory",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final Image iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
        //  leading: Container(height: 30, child: Image.asset("assets/exit.png")),
        leading: SizedBox(
          width: 30,
          child: iconData,
        ),
        //   Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call(title));
  }
}

class _AuthorList extends StatefulWidget {
  @override
  State<_AuthorList> createState() => _AuthorListState();
}

class _AuthorListState extends State<_AuthorList> {
  List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'name': '11',
      'price': 10.99,
      'inventory': 100,
      'img': 'Vendor 2',
      'mdate': '2024-02-16',
      'exdate': '2024-02-20',
      'pudate': '2024-02-18',
      'uufaa': 'Some value'
    },
  ];

  List<String> dropdownOptions = [
    'Name',
    'Price',
    'Inventory',
    'Img',
    'MDate',
    'ExDate',
    'PUDate',
    'UUFAA'
  ];
  String selectedOption = 'Name';

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = data;
    fetchUserData();
  }

  List<Map<String, dynamic>> userData = [];
  List<Map<String, dynamic>> abc = [];
  bool isLoading = false;

  Future<void> fetchUserData() async {
    try {
      setState(() {
        isLoading = true;
      });
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      setState(() {
        userData = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        print("==========$userData");
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  List<Map<String, dynamic>> filteredData = [];

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Map<String, dynamic>> filteredList = [];
      userData.forEach((item) {
        if (item.values.any((value) =>
            value.toString().toLowerCase().contains(query.toLowerCase()) &&
            item.containsKey(
                selectedOption) && // Check if item contains selected option
            item[selectedOption]
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))) {
          filteredList.add(item);
        }
      });
      setState(() {
        filteredData = filteredList;
      });
    } else {
      setState(() {
        filteredData = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: DropdownButton<String>(
                          value: selectedOption,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedOption = newValue;
                                filterSearchResults(searchController.text);
                              });
                            }
                          },
                          items: [
                            'Name',
                            'Price',
                            'Inventory',
                            'Img',
                            'MDate',
                            'ExDate',
                            'PUDate',
                            'UUFAA'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 300, right: 300),
                          child: TextField(
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                            controller: searchController,
                            decoration: const InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              suffixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 50, right: 100),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DataTable(
                      columnSpacing: 8,
                      dataRowHeight: 48,
                      headingRowHeight: 56,
                      border: TableBorder.all(width: 1),
                      columns: const [
                        DataColumn(
                          label: SizedBox(
                              width: 80, child: Center(child: Text('ID'))),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 120,
                            child: Center(
                              child: Text('Name'),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 80,
                            child: Center(child: Text('Price')),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Center(child: Text('Inventory')),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 120,
                            child: Center(child: Text('img')),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 120,
                            child: Center(child: Text('MDate')),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 120,
                            child: Center(child: Text('ExDate')),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 120,
                            child: Center(child: Text('PUDate')),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 120,
                            child: Center(child: Text('UUFAA')),
                          ),
                        ),
                      ],
                      rows: userData.map((item) {
                        return DataRow(cells: [
                          DataCell(
                            SizedBox(
                              width: 80,
                              height: 48,
                              child: Center(
                                child: Text('${item['Name']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 120,
                              height: 48,
                              child: Center(
                                child: Text('${item['Name']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 100,
                              height: 48,
                              child: Center(
                                child: Text('${item['Price']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 100,
                              height: 48,
                              child: Center(
                                child: Text('${item['Name']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 120,
                              height: 48,
                              child: Center(
                                child: Text('${item['Name']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 120,
                              height: 48,
                              child: Center(
                                child: Text('${item['Mdate']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 120,
                              height: 48,
                              child: Center(
                                child: Text('${item['Exdate']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 120,
                              height: 48,
                              child: Center(
                                child: Text('${item['Purchasedate']}'),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 120,
                              height: 48,
                              child: Center(
                                child: Text('${item['Quantity']}'),
                              ),
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class Menu {
  final Image iconData;
  final String title;

  Menu(this.iconData, this.title);
}
