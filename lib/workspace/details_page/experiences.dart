import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../modals/globals.dart';

class Experiences extends StatefulWidget {
  const Experiences({Key? key}) : super(key: key);

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  String previous = 'Previous Employed';
  String currently = 'Currently Employed';
  String? select;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _company =
      TextEditingController(text: Globals.companyName);
  final TextEditingController _school1 =
      TextEditingController(text: Globals.school1);
  final TextEditingController _roles =
      TextEditingController(text: Globals.roles);

  // ignore: non_constant_identifier_names
  final TextEditingController _date_j =
      TextEditingController(text: Globals.date_j);

  // ignore: non_constant_identifier_names
  final TextEditingController _date_e =
      TextEditingController(text: Globals.date_e);

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
          "Experiences",
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
                        "Company Name",
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
                        controller: _company,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Invalid Name';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.companyName = val;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "New Enterprise, San Francisco",
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
                        controller: _school1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Invalid Details';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.school1 = val;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "Quality Test Engineer",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Roles (optional)",
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
                        controller: _roles,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid Details";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.roles = val;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        minLines: 3,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText:
                              "Working with team members to come up with new concepts and product analysis",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        "Employed Status",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: const Color(0xff2A2A2A),
                                  value: previous,
                                  groupValue: Globals.selected1,
                                  onChanged: (val) {
                                    setState(() {
                                      Globals.selected1 = val;
                                    });
                                  },
                                ),
                                const Text(
                                  "Previously Employed",
                                  style: TextStyle(
                                      color: Color(0xff2A2A2A),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Radio(activeColor: const Color(0xff2A2A2A),
                                  value: currently,
                                  groupValue: Globals.selected1,
                                  onChanged: (val) {
                                    setState(() {
                                      Globals.selected1 = val;
                                    });
                                  },
                                ),
                              ),
                              const Text(
                                "Currently Employed",
                                style: TextStyle(
                                    color: Color(0xff2A2A2A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.003,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (currently == Globals.selected1)
                              ? Column(
                                  children: [
                                    Text(
                                      "Date Joined",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey.shade500),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Invalid Date";
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            Globals.date_j = val;
                                          });
                                        },
                                        textInputAction: TextInputAction.next,
                                        controller: _date_j,
                                        onTap: () async {
                                          DateTime? pickdate =
                                              await showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context).copyWith(
                                                        colorScheme: const ColorScheme.light(
                                                          primary: Color(0xff2A2A2A),
                                                          onPrimary: Colors.white,
                                                          onSurface: Color(0xff2A2A2A),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2101));

                                          if (pickdate != null) {
                                            setState(() {
                                              _date_j.text =
                                                  DateFormat('dd/MM/yyyy')
                                                      .format(pickdate);
                                            });
                                          }
                                        },
                                        style: const TextStyle(fontSize: 14),
                                        minLines: 1,
                                        keyboardType: TextInputType.multiline,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          hintText: "DD/MM/YYYY",
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black26),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Date Joined",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.grey.shade500),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.28,
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Invalid Date";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Globals.date_j = val;
                                              });
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: _date_j,
                                            onTap: () async {
                                              DateTime? pickdate =
                                                  await showDatePicker(
                                                      builder: (context, child) {
                                                        return Theme(
                                                          data: Theme.of(context).copyWith(
                                                            colorScheme: const ColorScheme.light(
                                                              primary: Color(0xff2A2A2A),
                                                              onPrimary: Colors.white,
                                                              onSurface: Color(0xff2A2A2A),
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(2101));

                                              if (pickdate != null) {
                                                setState(() {
                                                  _date_j.text =
                                                      DateFormat('dd/MM/yyyy')
                                                          .format(pickdate);
                                                });
                                              }
                                            },
                                            style:
                                                const TextStyle(fontSize: 14),
                                            minLines: 1,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              hintText: "DD/MM/YYYY",
                                              hintStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black26),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 90,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Date Exit",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.grey.shade500),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.28,
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Invalid Date";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Globals.date_e = val;
                                              });
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: _date_e,
                                            onTap: () async {
                                              DateTime? pickdate1 =
                                                  await showDatePicker(
                                                      builder: (context, child) {
                                                        return Theme(
                                                          data: Theme.of(context).copyWith(
                                                            colorScheme: const ColorScheme.light(
                                                              primary: Color(0xff2A2A2A),
                                                              onPrimary: Colors.white,
                                                              onSurface: Color(0xff2A2A2A),
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(2101));

                                              if (pickdate1 != null) {
                                                setState(() {
                                                  _date_e.text =
                                                      DateFormat('dd/MM/yyyy')
                                                          .format(pickdate1);
                                                });
                                              }
                                            },
                                            style:
                                                const TextStyle(fontSize: 14),
                                            minLines: 1,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              hintText: "DD/MM/YYYY",
                                              hintStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black26),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                        ],
                      )
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
                            content: Text("Invalid"),
                          ),
                        );
                        setState(() {
                          _date_j.clear();
                          _date_e.clear();
                          _roles.clear();
                          _school1.clear();
                          _company.clear();
                        });
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

                      setState(() {
                        _company.clear();
                        _school1.clear();
                        _roles.clear();
                        _date_j.clear();
                        _date_e.clear();
                      });

                      Globals.companyName = null;
                      Globals.school1 = null;
                      Globals.roles = null;
                      Globals.date_j = null;
                      Globals.date_e = null;
                      Globals.selected1 = null;
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
