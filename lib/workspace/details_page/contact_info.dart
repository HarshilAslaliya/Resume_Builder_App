import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../modals/globals.dart';
import 'package:image_picker/image_picker.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final TextEditingController _name = TextEditingController(text: Globals.Name);
  final TextEditingController _email =
      TextEditingController(text: Globals.email);
  final TextEditingController _contact = TextEditingController(
      text: (Globals.Contact != null) ? Globals.Contact.toString() : null);
  final TextEditingController _address =
      TextEditingController(text: Globals.Address);
  final TextEditingController _address2 =
      TextEditingController(text: Globals.Address2);
  final TextEditingController _address3 =
      TextEditingController(text: Globals.Address3);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  // getImage() async {
  //   ImagePicker pick = ImagePicker();
  //   XFile? file = await pick.pickImage(source: ImageSource.gallery);
  //   if (file != null) {
  //     setState(() {
  //       Globals.image = File(file.path);
  //     });
  //   }
  // }

  getCamera() async {
    ImagePicker pick = ImagePicker();
    XFile? file = await pick.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        Globals.image = File(file.path);
      });
    }
  }

  // ImagePicker image1 = ImagePicker();
  // XFile? file;
  //
  // imageForCamera() async {
  //   file = await image1.pickImage(source: ImageSource.camera);
  // }
  // imageForGallery() async {
  //   file = await image1.pickImage(source: ImageSource.gallery);
  // }
  // videoForCamera() async {
  //   file = await image1.pickVideo(source: ImageSource.camera);
  // }
  // videoForGallery() async {
  //   file = await image1.pickVideo(source: ImageSource.gallery);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: const Color(0xff2A2A2A),
        leading: CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 30,
            )),
        toolbarHeight: 104,
        elevation: 0,
        title: const Text(
          "Contact Info",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.yellow.shade300,
          indicatorWeight: 3,
          tabs: const [
            Text("Contact"),
            Text("Photo"),
          ],
          controller: _tabController,
          labelPadding: const EdgeInsets.all(10),
          labelStyle: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                          blurRadius: 50,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: Icon(
                                  CupertinoIcons.person,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: Icon(
                                  CupertinoIcons.mail_solid,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: Icon(
                                  CupertinoIcons.phone,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  CupertinoIcons.location_solid,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _name,
                                    textInputAction: TextInputAction.next,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Invalid Name';
                                      }
                                      return null;
                                    },
                                    onSaved: (val1) {
                                      setState(() {
                                        Globals.Name = val1!;
                                      });
                                    },
                                    style: const TextStyle(fontSize: 20),
                                    cursorColor: Colors.black,
                                    cursorHeight: 5,
                                    cursorWidth: 1.5,
                                    decoration: const InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _email,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(fontSize: 20),
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          !val.contains("@") ||
                                          !val.contains(".com")) {
                                        return 'Invalid Email';
                                      }
                                      return null;
                                    },
                                    onSaved: (val1) {
                                      setState(() {
                                        Globals.email = val1!;
                                      });
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    cursorHeight: 5,
                                    cursorWidth: 1.5,
                                    decoration: const InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _contact,
                                    textInputAction: TextInputAction.next,
                                    validator: (val) {
                                      if (val!.length < 10) {
                                        return 'Invalid Mobile Number';
                                      }
                                      return null;
                                    },
                                    onSaved: (val1) {
                                      setState(() {
                                        Globals.Contact = int.parse(val1!);
                                      });
                                    },
                                    style: const TextStyle(fontSize: 20),
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.black,
                                    cursorHeight: 5,
                                    cursorWidth: 1.5,
                                    decoration: const InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _address,
                                    textInputAction: TextInputAction.next,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Invalid Address';
                                      }
                                      return null;
                                    },
                                    onSaved: (val1) {
                                      setState(() {
                                        Globals.Address = val1!;
                                      });
                                    },
                                    style: const TextStyle(fontSize: 20),
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: Colors.black,
                                    cursorHeight: 5,
                                    cursorWidth: 1.5,
                                    decoration: const InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText:
                                            "Address (Street, Building No)",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _address2,
                                    textInputAction: TextInputAction.next,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Invalid Address';
                                      }
                                      return null;
                                    },
                                    onSaved: (val1) {
                                      setState(() {
                                        Globals.Address2 = val1!;
                                      });
                                    },
                                    style: const TextStyle(fontSize: 20),
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: Colors.black,
                                    cursorHeight: 5,
                                    cursorWidth: 1.5,
                                    decoration: const InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Address Line 2",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _address3,
                                    textInputAction: TextInputAction.next,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Invalid Address';
                                      }
                                      return null;
                                    },
                                    onSaved: (val1) {
                                      setState(() {
                                        Globals.Address3 = val1!;
                                      });
                                    },
                                    style: const TextStyle(fontSize: 20),
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: Colors.black,
                                    cursorHeight: 5,
                                    cursorWidth: 1.5,
                                    decoration: const InputDecoration(
                                        alignLabelWithHint: true,
                                        hintText: "Address Line 3",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
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
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xff2A2A2A)),
                        ),
                        onPressed: () {
                          final isValid = formKey.currentState!.validate();
                          if (isValid) {
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
                            _name.clear();
                            _email.clear();
                            _contact.clear();
                            _address.clear();
                            _address2.clear();
                            _address3.clear();
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.black54, width: 1.5),
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
                            _name.clear();
                            _email.clear();
                            _contact.clear();
                            _address.clear();
                            _address2.clear();
                            _address3.clear();
                          });

                          Globals.Name = null;
                          Globals.email = null;
                          Globals.Contact = null;
                          Globals.Address = null;
                          Globals.Address2 = null;
                          Globals.Address3 = null;
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
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
                        blurRadius: 50,
                        offset: Offset(-4, -4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey1,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const Alignment(0, -0.7),
                          child: CircleAvatar(
                            radius: 63,
                            backgroundColor: Colors.grey.shade300,
                            backgroundImage: (Globals.image != null)
                                ? FileImage(Globals.image!)
                                : null,
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.27, -0.07),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                getCamera();
                              });
                            },
                            child: const CircleAvatar(
                              radius: 17,
                              backgroundColor: Color(0xff2A2A2A),
                              child: Icon(
                                CupertinoIcons.add,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
                        formKey1.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Your Data Saved"),
                          ),
                        );
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
                        formKey1.currentState!.reset();
                        Globals.image = null;
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
        ],
      ),
    );
  }
}
