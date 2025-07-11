
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileCard extends StatefulWidget {
    
   ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
String userName = "";

Future<void> fetchUserName() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final uid = user.uid;
    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists) {
      final data = doc.data();
      final name = data?['name'];
      if (name != null) {
        setState(() {
          userName = name;
        });
        print("Kullanıcı adı: $name");
      }
    } else {
      print("Kullanıcı verisi bulunamadı.");
    }
  }
}





  @override


@override
void initState() {
  fetchUserName();
  super.initState();
  
}


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Center(
        
          child: Column(
       // Dikey ortala
            crossAxisAlignment: CrossAxisAlignment.center, // Yatay ortala
            children: [
              // Profil fotoğrafı
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/image/indir.png'),
                // Network kullanacaksan: backgroundImage: NetworkImage(user?.photoURL ?? '')
              ),
              SizedBox(height: 16),
              Text(
               userName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        
        
        
        
      ),
    );
  }
}