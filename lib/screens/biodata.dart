import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';

class Data extends StatefulWidget {
  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  String? date;
  String? fullname;
  String? image;
  String? adress;
  String? cast;
  String? fathername;
  String? gradute;
  String? height;
  String? hobiies;
  String? maternalname;
  String? maternalplace;
  String? mobile;
  String? mothername;
  String? weight;

  @override
  void initState() {
    super.initState();
    newMethod();

    setState(() {});
  }

  final pdf = pw.Document();
  Future<void> generatePdf() async {
    final image2 = pw.MemoryImage(
      File(image.toString()).readAsBytesSync(),
    );
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Container(
              width: double.infinity,
              margin: pw.EdgeInsets.only(top: 5, left: 5, right: 10),
              padding: pw.EdgeInsets.only(top: 20, left: 10, bottom: 20),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 2),
                borderRadius: pw.BorderRadius.circular(20),
              ),
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      fullname.toString(),
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 26,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Row(
                                  // crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Date of Birth : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      child: pw.Text(
                                        date.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Height : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      child: pw.Text(
                                        height.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                pw.Row(
                                  //crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Weight : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      child: pw.Text(
                                        weight.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Contact : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      child: pw.Text(
                                        mobile.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Cast : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      width: 160,
                                      child: pw.Text(
                                        cast.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Hobbies : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      width: 160,
                                      child: pw.Text(
                                        hobiies.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text("Address : ",
                                        style: pw.TextStyle(
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 2),
                                    pw.Container(
                                      width: 160,
                                      child: pw.Text(
                                        adress.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                          pw.Column(children: [
                            pw.Container(
                              margin: pw.EdgeInsets.only(right: 10),
                              height: 140,
                              width: 100,
                              child: pw.Image(image2, fit: pw.BoxFit.cover),
                            ),
                          ]),
                        ]),
                    pw.SizedBox(height: 30),
                    pw.Text(
                      "Education",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 26,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Column(
                      children: [
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Graduate : ",
                                style: pw.TextStyle(
                                    fontSize: 17,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 2),
                            pw.Container(
                              width: 160,
                              child: pw.Text(
                                gradute.toString(),
                                style: pw.TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        pw.SizedBox(height: 3),
                      ],
                    ),
                    pw.Text(
                      "Family Details",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 26,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(height: 30),
                    pw.Column(
                      children: [
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Father name : ",
                                style: pw.TextStyle(
                                    fontSize: 17,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 2),
                            pw.Container(
                              width: 160,
                              child: pw.Text(
                                fathername.toString(),
                                style: pw.TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        pw.SizedBox(height: 3),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Mother name : ",
                                style: pw.TextStyle(
                                    fontSize: 17,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 2),
                            pw.Container(
                              width: 160,
                              child: pw.Text(
                                mothername.toString(),
                                style: pw.TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        pw.SizedBox(height: 3),
                      ],
                    ),
                    pw.SizedBox(height: 30),
                    pw.Text(
                      "Maternal Details",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 26,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Column(
                      children: [
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Maternal Uncle name : ",
                                style: pw.TextStyle(
                                    fontSize: 17,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 2),
                            pw.Container(
                              width: 160,
                              child: pw.Text(
                                maternalname.toString(),
                                style: pw.TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        pw.SizedBox(height: 3),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Maternal Place: ",
                                style: pw.TextStyle(
                                    fontSize: 17,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 2),
                            pw.Container(
                              width: 160,
                              child: pw.Text(
                                maternalplace.toString(),
                                style: pw.TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        pw.SizedBox(height: 3),
                      ],
                    )
                  ]),
            );
          }),
    );
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/example.pdf';
    print(path);
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save(), flush: true);
    OpenFile.open(path);
  }

  Future<void> newMethod() async {
    final pref = await SharedPreferences.getInstance();
    fullname = pref.getString('fullname');
    image = pref.getString('image');
    adress = pref.getString('adress');
    cast = pref.getString('cast');
    date = pref.getString('date');
    fathername = pref.getString('fathername');
    gradute = pref.getString('gradute');
    height = pref.getString('height');
    maternalname = pref.getString('maternalname');
    maternalplace = pref.getString('maternalplace');
    mobile = pref.getString('mobile');
    mothername = pref.getString('mothername');
    weight = pref.getString('weight');
    hobiies = pref.getString('hobbies');
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Bio Data"), actions: [
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: InkWell(
              onTap: () {
                generatePdf();
                setState(() {});
              },
              child: Icon(Icons.download)),
        )
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: h * 0.03),
                height: h * 0.7,
                width: w * 0.9,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                        top: BorderSide(width: 2),
                        bottom: BorderSide(width: 2),
                        left: BorderSide(width: 2),
                        right: BorderSide(width: 2))),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: w * 0.56, top: 10),
                      height: h * 0.2,
                      width: w * 0.3,
                      // color: Colors.blue,
                      child: Image.file(
                        fit: BoxFit.fill,
                        File(image.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h * 0.01),
                            child: Row(
                              children: [
                                Text(
                                  fullname.toString(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "Date of Birth : ${date} ",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Height : ${height}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Weight : ${weight}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Phone: ${mobile}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Cast : ${cast}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Hobbies : ${hobiies}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h * 0.05,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Education",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Gradute : ${gradute}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h * 0.05,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Adress : ${adress}",
                                textAlign: TextAlign.start,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: h * 0.05, right: w * 0.1),
                            child: Row(
                              children: [
                                Text(
                                  "Family Details",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Father name : ${fathername}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Mother name : ${mothername}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: h * 0.05, right: w * 0.1),
                            child: Row(
                              children: [
                                Text(
                                  "Maternal Details",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Maternal Uncle Name : ${maternalname}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.004,
                          ),
                          Row(
                            children: [
                              Text(
                                "Maternal Place : ${maternalplace}",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text('back'))
          ],
        ),
      ),
    );
  }
}
