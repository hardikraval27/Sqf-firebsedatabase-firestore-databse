// import 'package:flutter/material.dart';



// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Screen'),
//       ),
//       drawer: MainDrawer(),
//       body: Center(
//         child: Text('Main Content'),
//       ),
//     );
//   }
// }

// class OtherScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Other Screen'),
//       ),
//       drawer: MainDrawer(),
//       body: Center(
//         child: Text('Other Content'),
//       ),
//     );
//   }
// }

// class MainDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Drawer Header',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             title: Text('Main Screen'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MainScreen()),
//               );
//             },
//           ),
//           ListTile(
//             title: Text('Other Screen'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => OtherScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
