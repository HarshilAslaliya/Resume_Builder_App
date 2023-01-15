import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modals/globals.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _title =
      TextEditingController(text: Globals.title);
  final TextEditingController _roles1 =
      TextEditingController(text: Globals.roles2);
  final TextEditingController _tech =
      TextEditingController(text: Globals.technologies);
  final TextEditingController _des =
      TextEditingController(text: Globals.projectDescription);

  bool checkBoxVal1 = false;
  bool checkBoxVal2 = false;
  bool checkBoxVal3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
          "Projects",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.65,
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Project Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2A2A2A),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _title,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Title";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.title = val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "Resume Builder App",
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Technologies",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2A2A2A),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  Checkbox(activeColor: Color(0xff2A2A2A),
                                      value: Globals.tech1,
                                      onChanged: (val) {
                                        setState(() {
                                          Globals.tech1 = val!;
                                        });
                                      }),
                                  const Text(
                                    "C Programming",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  Checkbox(activeColor: Color(0xff2A2A2A),
                                      value: Globals.tech2,
                                      onChanged: (val) {
                                        setState(() {
                                          Globals.tech2 = val!;
                                        });
                                      }),
                                  const Text(
                                    "C++",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  Checkbox(activeColor: Color(0xff2A2A2A),
                                      value: Globals.tech3,
                                      onChanged: (val) {
                                        setState(() {
                                          Globals.tech3 = val!;
                                        });
                                      }),
                                  const Text(
                                    "Flutter",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Roles",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2A2A2A),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _roles1,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Roles";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.roles2 = val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 2,
                          maxLines: 2,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "Organize team members, Code analysis",
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Technologies",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2A2A2A),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _tech,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Technologies";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.technologies = val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "5- Programmers",
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Project Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2A2A2A),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _des,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Description";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.projectDescription = val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "Enter Your Project Description",
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
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
                      )),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
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
                          _title.clear();
                          _roles1.clear();
                          _tech.clear();
                          _des.clear();
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
                        formKey.currentState!.reset();
                        Globals.title = null;
                        Globals.tech1 = false;
                        Globals.tech2 = false;
                        Globals.tech3 = false;
                        Globals.roles2 = null;
                        Globals.technologies = null;
                        Globals.projectDescription = null;
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
      ),
    );
  }
}
