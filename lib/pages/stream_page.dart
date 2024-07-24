import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  // const StreamPage({super.key});

  CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");
  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future<int> getNumber() async {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    // getNumber().then((value) {
    //   print(value);
    // });
    // counter().listen((event) {
    //   print(event);
    // });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: StreamBuilder(
            stream: userReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                QuerySnapshot userCollection = snapshot.data;
                print(userCollection.size);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        // StreamBuilder(
        //   stream: counter(),
        //   // initialData: initialData,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       return Center(
        //         child: Text(
        //           snapshot.data.toString(),
        //           style: TextStyle(fontSize: 50),
        //         ),
        //       );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        // FutureBuilder(
        //   future: getNumber(),
        //   builder: (context, snap) {
        //     if (snap.hasData) {
        //       return Text(
        //         snap.data.toString(),
        //         style: TextStyle(fontSize: 50),
        //       );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
      ),
    );
  }
}
