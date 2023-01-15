import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modals/globals.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController _course =
      TextEditingController(text: Globals.course);
  final TextEditingController _school =
      TextEditingController(text: Globals.school);
  final TextEditingController _schoolPR =
      TextEditingController(text: Globals.schoolPR);
  final TextEditingController _passingYear = TextEditingController(
      text:
          (Globals.yearOfPass != null) ? Globals.yearOfPass.toString() : null);

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
          "Education",
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
              height: MediaQuery.of(context).size.height * 0.60,
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
                key: formkey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Course/Degree",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff2A2A2A),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFormField(
                        controller: _course,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid Course";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.course = val!;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "B.Tech Information Technology",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "School/Collage/Institute",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff2A2A2A),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFormField(
                        controller: _school,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid Details";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.school = val!;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "H.A University",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "School/Collage/Institute",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff2A2A2A),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFormField(
                        controller: _schoolPR,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid Details";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.schoolPR = val!;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "70% (or) 7.0 CGPA",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Year Of Pass",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff2A2A2A),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFormField(
                        controller: _passingYear,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid Year";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.yearOfPass = int.parse(val!);
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "2021",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff2A2A2A),
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Your Data Saved"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid Details"),
                          ),
                        );
                      }
                      setState(() {
                        _course.clear();
                        _school.clear();
                        _schoolPR.clear();
                        _passingYear.clear();
                      });
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
                      formkey.currentState!.reset();

                      setState(() {
                        _course.clear();
                        _school.clear();
                        _schoolPR.clear();
                        _passingYear.clear();
                      });

                      Globals.course = null;
                      Globals.school = null;
                      Globals.schoolPR = null;
                      Globals.yearOfPass = null;
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
