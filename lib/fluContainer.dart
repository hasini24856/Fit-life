import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text("Container Example")),
        body:Center(
          child:Container(
            width: 200,
            height: 100,
            color: Colors.purple,
            child: const Center(
              child:Text(
                "Hello Flutter",
                style:TextStyle(color: Colors.white,fontSize: 20),
              )
            )
          )
        )
      ),
    ),
  );
}