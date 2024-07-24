import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 5));
    return "Esta es la data";
  }

  StreamController<String> streamController = StreamController();
  @override
  void initState() {
    print("creando stream controller");
    streamController.stream.listen(
      (data) {
        print("Dataa recibida_ $data");
      },
      onDone: () => print("doneee"),
    );
    streamController.add("Este es el evento");
    print("Finnish");
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
  // @override
  // void initState() {
  //   print("inicio del String");
  //   Stream<String> myStream = Stream.fromFuture(getData());
  //   print("Stream creado");
  //   myStream.listen(
  //     (data) {
  //       print("la data es $data");
  //     },
  //     onDone: () {
  //       print("Taks Done");
  //     },
  //     // onError: () {
  //     //   print("hay un error");
  //     // },
  //   );
  //   print("finish");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream PAge"),
      ),
    );
  }
}
