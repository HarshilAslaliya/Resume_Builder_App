import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/workspace/details_page/achievements.dart';
import 'package:resume_builder/workspace/details_page/carrier_objective.dart';
import 'package:resume_builder/workspace/details_page/contact_info.dart';
import 'package:resume_builder/workspace/details_page/declaration.dart';
import 'package:resume_builder/workspace/details_page/education.dart';
import 'package:resume_builder/workspace/details_page/experiences.dart';
import 'package:resume_builder/workspace/details_page/interest_hobbies.dart';
import 'package:resume_builder/workspace/details_page/pdf_preview.dart';
import 'package:resume_builder/workspace/details_page/personal_details.dart';
import 'package:resume_builder/workspace/details_page/projects.dart';
import 'package:resume_builder/workspace/details_page/references.dart';
import 'package:resume_builder/workspace/details_page/technical_skill.dart';
import 'package:resume_builder/workspace/resume_workspace.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyApp(),
        'resume_workspace': (context) => const ResumeWorkspace(),
        'contact_info':(context)=>const ContactInfo(),
        'carrier_objective':(context)=>const CarrierObjective(),
        'personal_details':(context)=>const PersonalDetails(),
        'education':(context)=>const Education(),
        'experiences':(context)=>const Experiences(),
        'technical_skill':(context)=>const TechnicalSkills(),
        'interest_hobbies':(context)=>const Interest_Hobbies(),
        'projects':(context)=>const Projects(),
        'achievements':(context)=>const Achievements(),
        'references':(context)=>const Refereneces(),
        'declaration':(context)=>const Declaration(),
        'pdfpreview':(context)=>const pdfPreview(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var resumeCount = 0;
  bool value = false;

  List<Column> h1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A2A2A),
        toolbarHeight: 150,
        title: Column(
          children: const [
            Text(
              "Resume Builder",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "RESUMES",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              (resumeCount == 0)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Image(
                              image: AssetImage(
                                  "asset/images/open-cardboard-box.png"),
                              height: 60,
                              width: 60,
                            ),
                            Text(
                              "No Resumes + Create new resume.",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: h1
                          .map(
                            (e) => e,
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: const Color(0xff2A2A2A),
        onPressed: () {
          setState(() {
            resumeCount++;
            if(resumeCount==1){
               h1.add(
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'resume_workspace');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade500,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: const Offset(4, 4),
                            ),
                            const BoxShadow(
                              color: Colors.white60,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(-4, -4),
                            ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Text(
                                    " Resume $resumeCount",
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )),

                              Expanded(
                                child: CupertinoButton(
                                  padding: const EdgeInsets.only(bottom: 22),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'resume_workspace');
                                  },
                                  child: const Icon(
                                    CupertinoIcons.forward,
                                    color: Color(0xff2A2A2A),
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              );
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}