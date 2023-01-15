import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modals/globals.dart';

class Refereneces extends StatefulWidget {
  const Refereneces({Key? key}) : super(key: key);

  @override
  State<Refereneces> createState() => _ReferenecesState();
}

class _ReferenecesState extends State<Refereneces> {

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  final TextEditingController _reference=TextEditingController(text: Globals.reference);
  final TextEditingController _designation=TextEditingController(text: Globals.designation);
  final TextEditingController _institute=TextEditingController(text: Globals.institute);

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
          "References",
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
                height: MediaQuery.of(context).size.height * 0.45,
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
                          "Reference Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff2A2A2A),),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _reference,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Name";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.reference=val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "Tony Stark",
                            hintStyle:
                            TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Designation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff2A2A2A),),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _designation,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Designation";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.designation=val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "Marketing Manager , ID-000000",
                            hintStyle:
                            TextStyle(fontSize: 20, color: Colors.black26),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Organization/Institute",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff2A2A2A),),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _institute,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Invalid Name";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Globals.institute=val;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 20),
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "H.A Pvt. Ltd",
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
                    child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff2A2A2A),)),
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();ScaffoldMessenger.of(context).showSnackBar(
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
                        setState(() {
                          _institute.clear();
                          _reference.clear();
                          _designation.clear();
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
                        Globals.reference=null;
                        Globals.designation=null;
                        Globals.institute=null;
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