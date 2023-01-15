import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResumeWorkspace extends StatefulWidget {
  const ResumeWorkspace({Key? key}) : super(key: key);

  @override
  State<ResumeWorkspace> createState() => _ResumeWorkspaceState();
}

class _ResumeWorkspaceState extends State<ResumeWorkspace> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        toolbarHeight: 70,
        elevation: 0,
        title: const Text(
          "Resume Workspace",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: const Color(0xff2A2A2A),
              child: const Text(
                "Build Options",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'contact_info');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/contact-books.png",
                        ),
                        name1: "Contact info"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'carrier_objective');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/briefcase.png",
                        ),
                        name1: "Career Objective"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'personal_details');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/user.png",
                        ),
                        name1: "Personal Details"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'education');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/mortarboard.png",
                        ),
                        name1: "Education"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'experiences');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/thinking.png",
                        ),
                        name1: "Experiences"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'technical_skill');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/experience.png",
                        ),
                        name1: "Technical Skills"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'interest_hobbies');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/open-book.png",
                        ),
                        name1: "Interest/Hobbies"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'projects');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/project.png",
                        ),
                        name1: "Projects"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'achievements');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/achievement.png",
                        ),
                        name1: "Achievements"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'references');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/handshake.png",
                        ),
                        name1: "References"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'declaration');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/declaration.png",
                        ),
                        name1: "Declaration"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'pdfpreview');
                    },
                    child: BuildContainer(
                        image1: const AssetImage(
                          "asset/images/pdf.png",
                        ),
                        name1: "PDF Preview"),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildContainer({
    required image1,
    required name1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade400,
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(flex: 2, child: Image(image: image1)),
              Expanded(
                flex: 8,
                child: Text(
                  name1,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  color: Color(0xff2A2A2A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
