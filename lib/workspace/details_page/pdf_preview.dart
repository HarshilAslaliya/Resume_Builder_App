import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import '../../modals/globals.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// ignore: camel_case_types
class pdfPreview extends StatefulWidget {
  const pdfPreview({Key? key}) : super(key: key);

  @override
  State<pdfPreview> createState() => _pdfPreviewState();
}

// ignore: camel_case_types
class _pdfPreviewState extends State<pdfPreview> {
  final pdf = pw.Document();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makePDF();
  }

  makePDF() {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Contact Info",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        (Globals.Name == null) ? "" : "${Globals.Name}",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 18,
                            color: PdfColors.black),
                      ),
                      pw.Text(
                        "${Globals.Address == null ? "" : "${Globals.Address}"}\n${Globals.Address2 == null ? "" : "${Globals.Address2}"}\n${Globals.Address3 == null ? "" : "${Globals.Address3}"}",
                        style: const pw.TextStyle(
                            fontSize: 18, color: PdfColors.black),
                      ),
                      pw.Row(children: [
                        pw.Text(
                          "Email : ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18,
                              color: PdfColors.black),
                        ),
                        pw.Text(
                          Globals.email == null ? "" : "${Globals.email}",
                          style: const pw.TextStyle(
                              fontSize: 18, color: PdfColors.black),
                        ),
                      ]),
                      pw.Row(
                        children: [
                          pw.Text(
                            "Mobile Number : ",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18,
                                color: PdfColors.black),
                          ),
                          pw.Text(
                            Globals.Contact == null ? "" : "${Globals.Contact}",
                            style: const pw.TextStyle(
                                fontSize: 18, color: PdfColors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    children: [
                      pw.Container(
                        height: 100,
                        width: 100,
                        decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                        ),
                        alignment: pw.Alignment.center,
                        child: pw.Image(
                          pw.MemoryImage(
                            Globals.image!.readAsBytesSync(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Career Objective",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Career Objective : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  Globals.description == null ? "" : "${Globals.description}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Current Designation : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  Globals.experience == null ? "" : "${Globals.experience}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Personal Details",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Date Of Birth : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  Globals.date == null ? "" : "${Globals.date}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.Row(children: [
              pw.Text(
                "Marital Status : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.marital == null ? "" : "${Globals.marital}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Languages Known : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                "${(Globals.languages1 == false) ? "" : "English,"}${(Globals.languages2 == false) ? "" : "Hindi,"}${(Globals.languages3 == false) ? "" : "Gujarati"}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Nationality : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.nationality == null ? "" : "${Globals.nationality}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Education",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Course/Degree : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.course == null ? "" : "${Globals.course}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(
              children: [
                pw.Text(
                  "School/Collage/Institute : ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      color: PdfColors.black),
                ),
                pw.Text(
                  Globals.school == null ? "" : "${Globals.school}",
                  style:
                      const pw.TextStyle(fontSize: 18, color: PdfColors.black),
                ),
              ],
            ),
            pw.Row(children: [
              pw.Text(
                "School/Collage/Institute : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.schoolPR == null ? "" : "${Globals.schoolPR}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Passing Year : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.yearOfPass == null ? "" : "${Globals.yearOfPass}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Experience",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Company Name : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.companyName == null ? "" : "${Globals.companyName}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "School/Collage/Institute : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.school1 == null ? "" : "${Globals.school1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Roles : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.roles == null ? "" : "${Globals.roles}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Employed Status : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.selected1 == null ? "" : "${Globals.selected1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Joining Date : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.date_j == null ? "" : "${Globals.date_j}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Exit Date : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.date_e == null ? "" : "${Globals.date_e}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Technical Skills",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Skills : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                // ignore: unnecessary_null_comparison
                Globals.skills1 == null ? "" : "${Globals.skills1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Interest / Hobbies",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Interest/Hobbies : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                // ignore: unnecessary_null_comparison
                Globals.interest1 == null ? "" : "${Globals.interest1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Projects",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Project Title : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.title == null ? "" : "${Globals.title}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Technologies : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                "${(Globals.tech1 == false) ? "" : "C Programming,"}${(Globals.tech2 == false) ? "" : "C++,"}${(Globals.tech3 == false) ? "" : "Flutter"}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Roles : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.roles2 == null ? "" : "${Globals.roles2}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Technologies : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.technologies == null ? "" : "${Globals.technologies}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Project Description : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.projectDescription == null
                    ? ""
                    : "${Globals.projectDescription}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Achievements",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Achievements : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                // ignore: unnecessary_null_comparison
                Globals.achievements1 == null ? "" : "${Globals.achievements1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Reference",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Reference Name : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.reference == null ? "" : "${Globals.reference}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Designation : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.designation == null ? "" : "${Globals.designation}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Organization/Institute : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.institute == null ? "" : "${Globals.institute}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              "Declaration",
              style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 21,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(children: [
              pw.Text(
                "Description : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.description1 == null ? "" : "${Globals.description1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Date : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.date1 == null ? "" : "${Globals.date1}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.Row(children: [
              pw.Text(
                "Place(interview venue) : ",
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.black),
              ),
              pw.Text(
                Globals.city == null ? "" : "${Globals.city}",
                style: const pw.TextStyle(fontSize: 18, color: PdfColors.black),
              ),
            ]),
            pw.SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A2A2A),
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
        toolbarHeight: 150,
        title: const Text(
          "PDF Preview",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Uint8List data = await pdf.save();
              await Printing.layoutPdf(onLayout: (format) => data);
            },
            icon: const Icon(
              Icons.picture_as_pdf_outlined,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            Uint8List data = await pdf.save();
            await Printing.layoutPdf(onLayout: (format) => data);
          },
          child: const Icon(
            Icons.picture_as_pdf_outlined,
            size: 200,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
