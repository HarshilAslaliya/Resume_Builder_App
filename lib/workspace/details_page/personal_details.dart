import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../modals/globals.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController _date = TextEditingController(text: Globals.date);

  String unmarried = 'Unmarried';
  String married = 'Married';
  String? marital;

  bool checkBoxVal1 = false;
  bool checkBoxVal2 = false;
  bool checkBoxVal3 = false;

  String? drop1;

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
          "Personal Details",
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
                          "DOB",
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Date";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.date = val!;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          controller: _date,
                          onTap: () async {
                            DateTime? pickdate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
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
                                _date.text =
                                    DateFormat('dd/MM/yyyy').format(pickdate);
                              });
                            }
                          },
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "DD/MM/YYYY",
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Marital Status",
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
                                  Radio(
                                    activeColor: Color(0xff2A2A2A),
                                    value: unmarried,
                                    groupValue: Globals.marital,
                                    onChanged: (val) {
                                      setState(() {
                                        Globals.marital = val;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Unmarried",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  child: Radio(
                                    value: married,
                                    groupValue: Globals.marital,
                                    onChanged: (val) {
                                      setState(() {
                                        Globals.marital = val;
                                      });
                                    },
                                  ),
                                ),
                                const Text(
                                  "Married",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Languages Known",
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
                                  Checkbox(
                                      activeColor: Color(0xff2A2A2A),
                                      value: Globals.languages1,
                                      onChanged: (val) {
                                        setState(() {
                                          Globals.languages1 = val!;
                                        });
                                      }),
                                  const Text(
                                    "English",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Color(0xff2A2A2A),
                                      value: Globals.languages2,
                                      onChanged: (val) {
                                        setState(() {
                                          Globals.languages2 = val!;
                                        });
                                      }),
                                  const Text(
                                    "Hindi",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Color(0xff2A2A2A),
                                      value: Globals.languages3,
                                      onChanged: (val) {
                                        setState(() {
                                          Globals.languages3 = val!;
                                        });
                                      }),
                                  const Text(
                                    "Gujarati",
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
                          "Nationality",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2A2A2A),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.4,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: const Alignment(0, 0),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black54),
                              icon: const Icon(CupertinoIcons.globe),
                              hint: const Text("Select Country"),
                              borderRadius: BorderRadius.circular(10),
                              value: Globals.nationality,
                              items: const [
                                DropdownMenuItem(
                                  value: 'IN',
                                  child: Text("India"),
                                ),
                                DropdownMenuItem(
                                  value: 'US',
                                  child: Text("America"),
                                ),
                                DropdownMenuItem(
                                  value: 'UA',
                                  child: Text("Ukraine"),
                                ),
                                DropdownMenuItem(
                                  value: 'JP',
                                  child: Text("Japan"),
                                ),
                                DropdownMenuItem(
                                  value: 'KW',
                                  child: Text("Kuwait"),
                                ),
                                DropdownMenuItem(
                                  value: 'UK',
                                  child: Text("Europe"),
                                ),
                                DropdownMenuItem(
                                  value: 'UAE',
                                  child: Text("Dubai"),
                                ),
                              ],
                              onChanged: (val) {
                                setState(() {
                                  Globals.nationality = val!;
                                });
                              }),
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
                          _date.clear();
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
                          Globals.nationality = null;
                          Globals.languages1 = false;
                          Globals.languages2 = false;
                          Globals.languages3 = false;
                          Globals.marital = null;
                          _date.clear();
                        });
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
