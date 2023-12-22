// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class FriendsListScreen extends StatefulWidget {
//   const FriendsListScreen({super.key});

//   @override
//   State<FriendsListScreen> createState() => _FriendsListScreenState();
// }

// class _FriendsListScreenState extends State<FriendsListScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _contactNoController = TextEditingController();

//   final CollectionReference _friends =
//       FirebaseFirestore.instance.collection('Friends');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Friends',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true, // Center the title
//         actions: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
//             child: IconButton(
//               icon: const Icon(
//                 Icons.add,
//                 size: 30,
//               ),
//               color: Colors.white,
//               onPressed: () {
//                 // Handle the onPressed event for the + icon
//                 // Add your logic here
//               },
//             ),
//           ),
//         ],
//       ),

//       // Body
//       body: StreamBuilder(
//         stream: _friends.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//           if (streamSnapshot.hasData) {
//             return ListView.builder(
//               itemCount: streamSnapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                     streamSnapshot.data!.docs[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text(documentSnapshot['Name']),
//                     subtitle: Column(
//                       children: [
//                         Text(documentSnapshot['Email']),
//                         Text(documentSnapshot['ContactNo']),
//                       ],
//                     ),
//                     trailing: SizedBox(
//                       width: 100,
//                       child: Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.delete),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }

//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendsListScreen extends StatefulWidget {
  const FriendsListScreen({Key? key}) : super(key: key);

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  final CollectionReference _friends =
      FirebaseFirestore.instance.collection('Friends');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Friends',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {
                // Handle the onPressed event for the + icon
                // Add your logic here
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _friends.orderBy('Createdtime', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            print("Data: ${streamSnapshot.data!.docs.length}");
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                final String name = documentSnapshot['Name'] ?? '';
                final String email = documentSnapshot['Email'] ?? '';
                final String contactNo = documentSnapshot['ContactNo'] ?? '';

                return Card(
                  child: ListTile(
                    title: Text(name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(email),
                        Text(contactNo),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle delete button
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
