import 'package:flutter/material.dart';
import 'package:the_sorting_hat/pages/houseMember/houseMember.dart';
import 'package:the_sorting_hat/share/errorDialog.dart';

class Home extends StatefulWidget {
  int amount;
  Home({Key? key, required this.amount}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    final gryfMember = [];
    final huffleMember = [];
    final ravenMember = [];
    final slytheMember = [];
    TextEditingController input = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          gryfMember.clear();
          huffleMember.clear();
          input.clear();
          slytheMember.clear();
          count = 0;
        },
        backgroundColor: Colors.red,
        child: Text('RESET'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExOTBlNzBhN2YzMWUyODY0Nzg3ZTAxYjMxM2VkODMxNjM1MzAyODk5YiZjdD1z/l1KVaVCC1jrRoVlGE/giphy.gif'),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: input,
                  decoration: InputDecoration(
                      hintText: 'Enter a student name here...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (checkInput(input.text)) {
                        addData(input.text, count, gryfMember, huffleMember,
                            ravenMember, slytheMember);
                        count++;
                    }
                    else{
                      showMyDialog(context, "Error", "Can't be empty");
                    }
                    input.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 20, right: 20),
                    child: Text('Insert a new student'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'All student info',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HouseMember(member: gryfMember, houseName: 'gryffindor')),);
                      },
                      child:
                          showHouseImages('assets/images/house/gryffindor.png'),

                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HouseMember(member: huffleMember, houseName: 'hufflepuff')),);
                      },
                      child:
                          showHouseImages('assets/images/house/hufflepuff.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HouseMember(member: ravenMember, houseName: 'ravenclaw')),);
                      },
                      child:
                          showHouseImages('assets/images/house/ravenclaw.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HouseMember(member: slytheMember, houseName: 'slytherin')),);
                      },
                      child:
                          showHouseImages('assets/images/house/slytherin.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addData(input, count, gryf, huffle, raven, slythe) {
    print(widget.amount);
    var temp = count % 4;
    if (temp % 4 == 0&&gryf.length<widget.amount) {
      gryf.add(input);
      showDialog(
        context: context,
        builder: (context) => showCongratsDialog(
            'assets/images/house/gryffindor.png', 'Gryffindor'),
      );
    } else if (temp % 4 == 1&&huffle.length<widget.amount) {
      huffle.add(input);
      showDialog(
          context: context,
          builder: (context) => showCongratsDialog(
              'assets/images/house/hufflepuff.png', 'Hufflepuff'));
    } else if (temp % 4 == 2&&raven.length<widget.amount) {
      raven.add(input);
      showDialog(
        context: context,
        builder: (context) => showCongratsDialog(
            'assets/images/house/ravenclaw.png', 'Ravenclaw'),
      );
    } else if (temp % 4 == 3&&slythe.length<widget.amount) {
      slythe.add(input);
      showDialog(
        context: context,
        builder: (context) => showCongratsDialog(
            'assets/images/house/slytherin.png', 'Slytherin'),
      );

    }
    else{
      showMyDialog(context, 'Error', "It's already full");
    }
  }

  bool checkInput(input) {
    if (input != null && input.length > 0) return true;
    return false;
  }

  Widget showHouseImages(imgPath) {
    return Image.asset(
      imgPath,
      width: 150,
      height: 150,
    );
  }

  Widget showCongratsDialog(imgPath, nameHouse) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(15),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showHouseImages(imgPath),
            Text('Congrats your house is ${nameHouse}'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        ),
       ),
    );
  }
}
