// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pilllist/sqflitedatabase.dart';

// class name extends StatefulWidget {
//   const name({super.key});

//   @override
//   State<name> createState() => _nameState();
// }

// class _nameState extends State<name> {
//   TextEditingController name = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController quantity = TextEditingController();
//   TextEditingController image = TextEditingController();
//   TextEditingController mdate = TextEditingController();
//   TextEditingController exdate = TextEditingController();
//   TextEditingController purchasedate = TextEditingController();

//   senddata() async {
//     // DatabaseReference ref = FirebaseDatabase.instance.ref('users/');

//     // await ref.set({
//     //   'Name': name.text,
//     //   'Price': price.text,
//     //   'Quantity': quantity.text,
//     //   'Mdate': mdate.text,
//     //   'Exdate': exdate.text,
//     //   'Purchasedate': purchasedate.text,
//     // });

//     // DatabaseReference ref =
//     //     FirebaseDatabase.instance.reference().child('users');

//     // try {
//     //   await ref.set({
//     //     'Name': name.text,
//     //     'Price': price.text,
//     //     'Quantity': quantity.text,
//     //     'Mdate': mdate.text,
//     //     'Exdate': exdate.text,
//     //     'Purchasedate': purchasedate.text,
//     //   });
//     //   print('Data sent successfully');
//     // } catch (error) {
//     //   print('Failed to send data: $error');
//     // }

//     FirebaseFirestore.instance.collection('users').add({
//       'Name': name.text,
//       'Price': price.text,
//       'Quantity': quantity.text,
//       'Mdate': mdate.text,
//       'Exdate': exdate.text,
//       'Purchasedate': purchasedate.text,
//     });
//   }

//   String? img;
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final XFile? pickedFile =
//         await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         img = pickedFile.path;
//         image.text = img!;
//       });
//     }
//   }

//   DateTime selectedDate = DateTime.now();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         mdate.text = selectedDate.toString();
//       });
//     }
//   }

//   DateTime selectedDateex = DateTime.now();

//   Future<void> _selectDateex(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDateex,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDateex) {
//       setState(() {
//         selectedDateex = picked;
//         exdate.text = selectedDateex.toString(); // Update the TextField value
//       });
//     }
//   }

//   DateTime selectedDatepur = DateTime.now();

//   Future<void> _selectDatepur(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDatepur,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDatepur) {
//       setState(() {
//         selectedDatepur = picked;
//         purchasedate.text =
//             selectedDatepur.toString(); // Update the TextField value
//       });
//     }
//   }

//   final dbhelper = DatabaseHelper.instance;
//   insert() async {
//     var insertdata = await dbhelper.firstnamesend(name.text, price.text,
//         quantity.text, mdate.text, exdate.text, purchasedate.text);
//   }

//   List selectData = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 50),
//           Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 80, right: 80),
//                   child: TextField(
//                     controller: name,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       hintText: 'Name',
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10), // Add some space between text fields
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 80, right: 80),
//                   child: TextField(
//                     controller: price,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       hintText: 'Price',
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: 100,
//                   margin: const EdgeInsets.only(left: 80, right: 80),
//                   child: TextField(
//                     controller: quantity,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       hintText: 'Quantity',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 80, right: 80),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: image,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           hintText: 'Image',
//                           suffixIcon: IconButton(
//                             icon: const Icon(Icons.image),
//                             onPressed:
//                                 _pickImage, // call _pickImage directly here
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       // Display the picked image if available
//                       // if (img != null) ...[
//                       //   Container(
//                       //       height: 50, width: 50, child: Image.file(File(img!))),
//                       //   SizedBox(height: 10)
//                       // ],

//                       if (img != null) ...[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Scaffold(
//                                   appBar: AppBar(
//                                     title: const Text('Image Preview'),
//                                   ),
//                                   body: Center(
//                                     child: SizedBox(
//                                       height: 200, // Set height as needed
//                                       width: 200, // Set width as needed
//                                       child: Image.file(File(img!)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           child: const SizedBox(
//                             height: 50,
//                             width: 50,
//                             // child: Image.file(File(img!)),
//                             child: Center(child: Text("View")),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 80, right: 80),
//                   child: TextField(
//                     controller: mdate,
//                     readOnly: true, // Make TextField read-only
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       hintText: 'manudate',
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.calendar_today),
//                         onPressed: () {
//                           _selectDate(context); // Call date picker function
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ), // Add some space between text fields
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 80, right: 80),
//                   child: TextField(
//                     controller: exdate,
//                     readOnly: true, // Make TextField read-only
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       hintText: 'exdate',
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.calendar_today),
//                         onPressed: () {
//                           _selectDateex(context); // Call date picker function
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ), // Add some spa
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Container(
//                 width: 480,
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: TextField(
//                   controller: purchasedate,
//                   readOnly: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'purchasedate',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.calendar_today),
//                       onPressed: () {
//                         _selectDatepur(context); // Call date picker function
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 //insert();
//                 senddata();
//               },
//               child: const Text("Done")),
//           const SizedBox(
//             height: 50,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 // selectAllData();
//               },
//               child: const Text("SELECT_DATA"))
//         ],
//       ),
//     );
//   }

//   selectAllData() async {
//     selectData = await dbhelper.select();
//     for (int i = 0; i < selectData.length; i++) {
//       print('${selectData[i]}');
//     }
//   }
// }



// ..[
//             Menu(Image.asset('assets/bill.png'), 'Home'),
//             Menu(Image.asset('assets/ready-stock.png'), 'Inventory'),
//             Menu(Image.asset('assets/log-in.png'), 'Stock In'),
//             //  Menu(Image.asset('assets/ready-stock.png'), 'Stock Out'),
//             Menu(Image.asset('assets/rupee-indian.png'), 'Rupees'),
//             Menu(
//               Image.asset('assets/exit.png'),
//               'Payment',
//             ),
//             Menu(
//               Image.asset('assets/exit.png'),
//               'LogOut',
//             ),
//           ]

// image_picker: ^1.0.7
//   flutter_date_pickers: ^0.4.2
//   flutter_slider_drawer: ^2.1.3
//   firebase_core: ^2.25.4
//   firebase_auth: ^4.17.4
//   firebase_database: ^10.1.0
//   sqflite: ^2.3.2
//   path_provider: ^2.1.0
//   sqflite_common_ffi: ^2.3.2+1
//   firebase_storage: ^11.6.5
//   firebase_core_web: ^2.11.4
//   cloud_firestore: ^4.15.4
//   intl: ^0.18.0