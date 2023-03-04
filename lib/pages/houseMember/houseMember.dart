import 'package:flutter/material.dart';

class HouseMember extends StatelessWidget {
  var member;
  var houseName;
  HouseMember({Key? key, required this.member, required this.houseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(houseName)),
      body: ListView.builder(itemCount: member.length,itemBuilder: showName),
    );
  }
  Widget showName(context, index){
    return Card(
      key: ValueKey(member[index]),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(member[index], style: TextStyle(fontSize: 30),)),
    );
  }
}
