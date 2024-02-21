import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  //const IntroPage({super.key});
  var nameController = TextEditingController();
  var nameVal = "No saved Value";

  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(child: Text("Wecome")),
      ),
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text('Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      var name = nameController.text.toString();
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString("name", name);
                      //         builder: (context) => BmiCalculatorPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Save",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                    )),
                Text(nameVal)
              ]),
        ),
      ),
    );
  }

  void getValue() async {
    var prefss = await SharedPreferences.getInstance();
    var getName = prefss.getString("name");

    setState(() {
      nameVal = getName != null ? getName : "No Value Saved";
    });
  }
}
