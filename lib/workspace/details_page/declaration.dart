import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder/modals/globals.dart';

class Declaration extends StatefulWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  bool switch1 = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final TextEditingController _date_j =
      TextEditingController(text: Globals.date1);
  final TextEditingController _description =
      TextEditingController(text: Globals.description1);
  final TextEditingController _city = TextEditingController(text: Globals.city);

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
          "Declaration",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              (switch1 == true)
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
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
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Declaration",
                                    style: TextStyle(
                                        color: Color(0xff2A2A2A),
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Switch(
                                      value: switch1,
                                      onChanged: (val) {
                                        setState(() {
                                          switch1 = val;
                                        });
                                      }),
                                ],
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image(
                                    image:
                                        AssetImage("asset/images/target.png"),
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: _description,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Invalid Description";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Globals.description1 = val;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(fontSize: 20),
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  filled: true,
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      fontSize: 20, color: Colors.black26),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.003,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.grey.shade500),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                              Globals.date1 = val;
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
                                  ),
                                  const SizedBox(
                                    width: 85,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Place (Interview \nvenue/city)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.grey.shade500),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.28,
                                        child: TextFormField(
                                          controller: _city,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Invalid city";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            setState(() {
                                              Globals.city = val;
                                            });
                                          },
                                          textInputAction: TextInputAction.next,
                                          style: const TextStyle(fontSize: 14),
                                          minLines: 1,
                                          keyboardType: TextInputType.multiline,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            hintText: "Eg. Surat",
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
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
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
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Declaration",
                                style: TextStyle(
                                    color: Color(0xff2A2A2A),
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                  value: switch1,
                                  onChanged: (val) {
                                    setState(() {
                                      switch1 = val;
                                    });
                                  }),
                            ],
                          ),
                        ],
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
                    child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff2A2A2A),),),
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
                          _city.clear();
                          _description.clear();
                          _date_j.clear();
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
                        _date_j.clear();
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
