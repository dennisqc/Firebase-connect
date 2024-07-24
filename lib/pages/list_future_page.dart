import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListFuturePage extends StatelessWidget {
  // const ListFuturePage({super.key});

  CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List future Page"),
      ),
      body: FutureBuilder(
        future: userReference.get(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot userCollection = snapshot.data;
            List<QueryDocumentSnapshot> docs = userCollection.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    docs[index]["nombre"],
                  ),
                  trailing: Text(
                    docs[index]["apellido"],
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
