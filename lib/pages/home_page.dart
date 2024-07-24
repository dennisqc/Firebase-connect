import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconnect/pages/list_future_page.dart';
import 'package:firebaseconnect/pages/list_stream_page.dart';
import 'package:firebaseconnect/pages/stream_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  userReference.get().then((value) {
                    value.docs.forEach((e) {
                      print(e.data());
                    });
                  });
                },
                child: Text("data")),
            ElevatedButton(
                onPressed: () {
                  userReference.get().then(
                    (value) {
                      QuerySnapshot userCollection = value;
                      List<QueryDocumentSnapshot> docs = userCollection.docs;
                      docs.forEach(
                        (element) {
                          print(element.id);
                        },
                      );
                    },
                  );
                },
                child: Text("Traer Data")),
            ElevatedButton(
              onPressed: () {
                userReference
                    .where("esPeruano", isEqualTo: true)
                    .where("estatura", isGreaterThan: 180)
                    .get()
                    .then((value) {
                  QuerySnapshot userCollection = value;
                  List<QueryDocumentSnapshot> docs = userCollection.docs;
                  docs.forEach((element) {
                    print(element.id);
                  });
                }).catchError((error) {
                  print("Error al traer datos filtrados: $error");
                });
              },
              child: Text("Traer Data Filtrada"),
            ),
            ElevatedButton(
                onPressed: () {
                  userReference.add({
                    'nombre': "Mario",
                    'apellido': "MElendez",
                    'esPeruano': true,
                    'estatura': 188
                  }).then((value) {
                    print(value.id);
                  });
                },
                child: Text("crear")),
            ElevatedButton(
                onPressed: () {
                  userReference.doc("idnoexiste").set({
                    'nombre': "Mario",
                    'apellido': "MElendez",
                    'esPeruano': true,
                    'estatura': 188
                  });
                },
                child: Text("insercion tipo 2 ")),
            ElevatedButton(
                onPressed: () {
                  userReference.doc("idnoexiste").update({
                    'nombre': "pedrito",
                    'apellido': "MElendez",
                    'esPeruano': false,
                    'estatura': 148
                  });
                },
                child: Text("update")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListStreamPage(),
                      ));
                },
                child: Text("List Stream PAge")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListFuturePage(),
                  ),
                );
              },
              child: Text("List Future Page"),
            ),      ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamPage(),
                  ),
                );
              },
              child: Text("Stream Page"),
            )
          ],
        ),
      ),
    ));
  }
}
