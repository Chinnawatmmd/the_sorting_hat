import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:the_sorting_hat/pages/home/home.dart';
import 'package:the_sorting_hat/share/errorDialog.dart';
class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var amount;
  @override
  TextEditingController input = TextEditingController();
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), (){

    }).then((value) => {
      showDialog(context: context, builder: (context){
        return Dialog(
          child: Container(
            margin: EdgeInsets.all(15),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Insert only interger number"),
                TextField(
                  controller: input,
                  decoration: InputDecoration(
                      hintText: 'Enter a number here...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(checkInput(input.text)){
                      if(int.tryParse(input.text)!=null) {
                        amount = input.text;
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                Home(amount: int.parse(amount))));
                      }
                      else showMyDialog(context, 'Integer only', 'Please insert integer!!!');
                    }
                    else{
                      showMyDialog(context, 'Error', "Can't be empty");
                    }
                    input.clear();
                  },
                  child: Text("NEXT"),
                ),
              ],
            ),
          ),
        );
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('HI!!!', textStyle: TextStyle(fontSize: 30)),
                TyperAnimatedText('You are assigned to be a new principal at Hogward University', textStyle: TextStyle(fontSize: 30)),
                TyperAnimatedText('How many students will be accepted?',textStyle: TextStyle(fontSize: 30)),
              ],
              totalRepeatCount: 1,
            ),
          ),
        ],
      ),
    );
  }
  bool checkInput(input) {
    if (input != null && input.length > 0) return true;
    return false;
  }
}
