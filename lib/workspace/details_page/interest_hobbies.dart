import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modals/globals.dart';

// ignore: camel_case_types
class Interest_Hobbies extends StatefulWidget {
  const Interest_Hobbies({Key? key}) : super(key: key);

  @override
  State<Interest_Hobbies> createState() => _Interest_HobbiesState();
}

// ignore: camel_case_types
class _Interest_HobbiesState extends State<Interest_Hobbies> {
  List<Container> interest = [];

  var height1 = 0.25;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool? value1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A2A2A),
        toolbarHeight: 150,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Interest/Hobbies",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * height1,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 30,
                    offset: Offset(-4, -4),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Enter your interest",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: interest.map((e) => e).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          height1 += 0.07;
                          interest.add(
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Invalid interest';
                                  }
                                  return null;
                                },
                                onSaved: (val1) {
                                  setState(() {
                                    Globals.interest1.add(val1);
                                  });
                                },
                                style: const TextStyle(fontSize: 20),
                                keyboardType: TextInputType.multiline,
                                cursorColor: Colors.black,
                                cursorHeight: 5,
                                cursorWidth: 1.5,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          height1 -= 0.07;
                                          interest.removeLast();
                                        });
                                      },
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        size: 28,
                                      ),
                                    ),
                                    alignLabelWithHint: true,
                                    hintText: "Interest / Hobbies",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade500),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.add,
                          size: 28,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(-4, -4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff2A2A2A),)),
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Your Data Saved"),
                          ),
                        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid Details"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1.5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(-4, -4),
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      formKey.currentState!.reset();
                      Globals.interest=null;
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff2A2A2A),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
