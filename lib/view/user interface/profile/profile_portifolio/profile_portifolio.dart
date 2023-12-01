import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/view/user%20interface/profile/profile_portifolio/profile_portifolio_function.dart';

class Portfolio extends StatefulWidget {
  final String token;

  const Portfolio({super.key, required this.token});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late Future<List<Map<String, dynamic>>> appliedData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appliedData = ProfilePortfolioFunction().getCVs();
  }

  upload() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    FilePickerResult? imageResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (filePickerResult != null) {

      File file = File(filePickerResult.files.single.path ?? " ");
      // String fileName = file.path.split("/").last;
      String filePath=file.path;

      File image = File(imageResult!.files.single.path ?? " ");
      // String imageName = image.path.split("/").last;
      String imagePath=image.path;

      ProfilePortfolioFunction().postCv(context, filePath, imagePath);
    } else {
      print("result is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const ReusableBigText(message: "Portfolio"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListView(
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text('Add portfolio here',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: const Color(0xFF3366FF),
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFECF2FF),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ClipOval(
                                  child: Container(
                                    color:
                                        const Color(0xFF3366FF).withOpacity(.2),
                                    child: Image.asset(
                                      'assets/portfolio/upload.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                ),
                              ),
                              const Text('Upload your other file',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              const Text('Max. file size 10 MB',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          // ApiFunctions().getCVs();
                                          upload();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFECF2FF),
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Color(0xFF3366FF),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(30))),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(CupertinoIcons.share),
                                            Text("Add file",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500
                                                ))
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              // ListView.builder(itemBuilder: itemBuilder)
                            ],
                          )),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: appliedData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Column(
                              children: [
                                Text('No portfolio yet.'),
                              ],
                            ));
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var item = snapshot.data![index];
                                print(item);
                                return Row(
                                  children: [
                                    ClipRRect(
                                        child: Image.network(item["image"])),
                                    Column(
                                      children: [
                                        ReusableAdjustedText(
                                            message: item["name"],
                                            size: 12,
                                            fontWeight: FontWeight.bold),
                                        ReusableAdjustedText(
                                            message: item["cv_file"],
                                            size: 10,
                                            color: Colors.grey)
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
