import 'package:flutter/material.dart';
import 'package:qr/components/profilecard.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(
  child: ProfileCard(),

),

    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override



//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;

//     return Container(
      
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start, // ← HIZA ÖNEMLİ
//         children: [
//           // Profil Fotoğrafı
//           CircleAvatar(
//             radius: 40,
//             backgroundImage: AssetImage('assets/image/indir.png'),
//             // backgroundImage: NetworkImage(user?.photoURL ?? '')
//           ),

//           SizedBox(width: 16),

//           // İsim ve Mail
//           Column(
            
//             crossAxisAlignment: CrossAxisAlignment.start,
            
            
//             children: [
//               Text(
//                 user?.displayName ?? 'İsim Yok',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 user?.email ?? 'E-posta Yok',
//                 style: TextStyle(color: Colors.grey[700]),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
