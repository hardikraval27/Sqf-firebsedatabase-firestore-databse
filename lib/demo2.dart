// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:image_picker/image_picker.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   MyAppState createState() => MyAppState();
// }

// class MyAppState extends State<MyApp> {
//   final GlobalKey<SliderDrawerState> _sliderDrawerKey =
//       GlobalKey<SliderDrawerState>();
//   late String title;

//   @override
//   void initState() {
//     title = "Home";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'BalsamiqSans'),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SliderDrawer(
//             appBar: SliderAppBar(
//                 appBarColor: Colors.white,
//                 title: Text(title,
//                     style: const TextStyle(
//                         fontSize: 22, fontWeight: FontWeight.w700))),
//             key: _sliderDrawerKey,
//             sliderOpenSize: 179,
//             sliderCloseSize: 50,
//             slider: _SliderView(
//               onItemClick: (title) {
//                 _sliderDrawerKey.currentState!.closeSlider();
//                 setState(() {
//                   this.title = title;
//                 });
//               },
//             ),
//             child: _AuthorList()),
//       ),
//     );
//   }
// }

// class _SliderView extends StatelessWidget {
//   final Function(String)? onItemClick;

//   const _SliderView({Key? key, this.onItemClick}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.only(top: 30),
//       child: ListView(
//         children: <Widget>[
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Nick',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 30,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ...[
//             Menu(Icons.home, 'Home'),
//             Menu(Icons.add_circle, 'Add Post'),
//             Menu(Icons.notifications_active, 'Notification'),
//             Menu(Icons.favorite, 'Likes'),
//             Menu(Icons.settings, 'Setting'),
//             Menu(Icons.logout, 'LogOut')
//           ]
//               .map((menu) => _SliderMenuItem(
//                   title: menu.title,
//                   iconData: menu.iconData,
//                   onTap: onItemClick))
//               .toList(),
//         ],
//       ),
//     );
//   }
// }

// class _SliderMenuItem extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final Function(String)? onTap;

//   const _SliderMenuItem(
//       {Key? key,
//       required this.title,
//       required this.iconData,
//       required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(title,
//             style: const TextStyle(
//                 color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
//         leading: Icon(iconData, color: Colors.black),
//         onTap: () => onTap?.call(title));
//   }
// }

// class _AuthorList extends StatefulWidget {
//   @override
//   State<_AuthorList> createState() => _AuthorListState();
// }

// class _AuthorListState extends State<_AuthorList> {
//   @override
//   Widget build(BuildContext context) {
//     String selectedOption = 'Instock';

//     final _scaffoldKey = GlobalKey<ScaffoldState>();
//     TextEditingController name = TextEditingController();
//     TextEditingController price = TextEditingController();
//     TextEditingController quantity = TextEditingController();
//     TextEditingController image = TextEditingController();
//     TextEditingController mdate = TextEditingController();
//     TextEditingController exdate = TextEditingController();
//     TextEditingController purchasedate = TextEditingController();

//     String? img;

//     Future<void> _pickImage() async {
//       final picker = ImagePicker();
//       final XFile? pickedFile =
//           await picker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         setState(() {
//           img = pickedFile.path;
//           image.text = img!;
//         });
//       }
//     }

//     DateTime selectedDate = DateTime.now();

//     Future<void> _selectDate(BuildContext context) async {
//       final DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: selectedDate,
//           firstDate: DateTime(2015, 8),
//           lastDate: DateTime(2101));
//       if (picked != null && picked != selectedDate)
//         setState(() {
//           selectedDate = picked;
//           mdate.text = selectedDate.toString(); // Update the TextField value
//         });
//     }

//     DateTime selectedDateex = DateTime.now();

//     Future<void> _selectDateex(BuildContext context) async {
//       final DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: selectedDateex,
//           firstDate: DateTime(2015, 8),
//           lastDate: DateTime(2101));
//       if (picked != null && picked != selectedDateex)
//         setState(() {
//           selectedDateex = picked;
//           exdate.text = selectedDateex.toString(); // Update the TextField value
//         });
//     }

//     DateTime selectedDatepur = DateTime.now();

//     Future<void> _selectDatepur(BuildContext context) async {
//       final DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: selectedDatepur,
//           firstDate: DateTime(2015, 8),
//           lastDate: DateTime(2101));
//       if (picked != null && picked != selectedDatepur)
//         setState(() {
//           selectedDatepur = picked;
//           purchasedate.text =
//               selectedDatepur.toString(); // Update the TextField value
//         });
//     }

//     List<Quotes> quotesList = [];
//     quotesList.add(Quotes(Colors.amber, 'Amelia Brown',
//         'Life would be a great deal easier if dead things had the decency to remain dead.'));
//     quotesList.add(Quotes(Colors.orange, 'Olivia Smith',
//         'That proves you are unusual," returned the Scarecrow'));
//     quotesList.add(Quotes(Colors.deepOrange, 'Sophia Jones',
//         'Her name badge read: Hello! My name is DIE, DEMIGOD SCUM!'));
//     quotesList.add(Quotes(Colors.red, 'Isabella Johnson',
//         'I am about as intimidating as a butterfly.'));
//     quotesList.add(Quotes(Colors.purple, 'Emily Taylor',
//         'Never ask an elf for help; they might decide your better off dead, eh?'));
//     quotesList
//         .add(Quotes(Colors.green, 'Maya Thomas', 'Act first, explain later'));

//     return Column(
//       children: [
//         // Text(selectedOption, style: const TextStyle(fontSize: 25)),
//         Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: TextField(
//                   controller: name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'Name',
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10), // Add some space between text fields
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: TextField(
//                   controller: price,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'Price',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: 100,
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: TextField(
//                   controller: quantity,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'Quantity',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: image,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: 'Image',
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.image),
//                           onPressed:
//                               _pickImage, // call _pickImage directly here
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     // Display the picked image if available
//                     if (img != null) ...[
//                       Container(
//                           height: 50, width: 50, child: Image.file(File(img!))),
//                     ],
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(width: 10),

//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: TextField(
//                   controller: mdate,
//                   readOnly: true, // Make TextField read-only
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'manudate',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.calendar_today),
//                       onPressed: () {
//                         _selectDate(context); // Call date picker function
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ), // Add some space between text fields
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 80, right: 80),
//                 child: TextField(
//                   controller: exdate,
//                   readOnly: true, // Make TextField read-only
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'exdate',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.calendar_today),
//                       onPressed: () {
//                         _selectDateex(context); // Call date picker function
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ), // Add some spa
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Container(
//               width: 480,
//               margin: const EdgeInsets.only(left: 80, right: 80),
//               child: TextField(
//                 controller: purchasedate,
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   hintText: 'purchasedate',
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.calendar_today),
//                     onPressed: () {
//                       _selectDatepur(context); // Call date picker function
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 50,
//         ),
//         ElevatedButton(onPressed: () {}, child: const Text("Done"))
//       ],
//     );
//   }
// }

// class Quotes {
//   final MaterialColor color;
//   final String author;
//   final String quote;

//   Quotes(this.color, this.author, this.quote);
// }

// class Menu {
//   final IconData iconData;
//   final String title;

//   Menu(this.iconData, this.title);
// }



  // const name({super.key});