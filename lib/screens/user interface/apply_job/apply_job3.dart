import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/apply_controllers/apply_job_cubit/apply_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/profile_portfolio/portfolio_cubit.dart';
import '../../../core/controllers/apply_controllers/apply_job_cubit/apply_state.dart';
import '../../../core/managers/managers.dart';
import '../../../core/managers/navigation.dart';
import '../../../core/managers/utils/colors/colors.dart';
import '../../../core/managers/utils/dialogs/snak_bar.dart';
import '../../widgets/reusable_text.dart';
import '../home/home_screen.dart';

class ApplyJobAddPortfolio extends StatefulWidget {
  final List list;

  const ApplyJobAddPortfolio({super.key, required this.list});

  @override
  State<ApplyJobAddPortfolio> createState() => _ApplyJobAddPortfolioState();
}

class _ApplyJobAddPortfolioState extends State<ApplyJobAddPortfolio> {
  ColorConstantsGradient gradient = ColorConstantsGradient();
  late String file;
  late String image;
  late Future<List<Map<String, dynamic>>> appliedData;

  @override
  void initState() {
    super.initState();
    appliedData = PortfolioCubit.get(context).getCVs();
  }

  upload() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    FilePickerResult? imageResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (filePickerResult != null && imageResult != null) {
      file == file;
      String image = imageResult.files.single.path!;
      image == image;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ApplyCubit, ApplyState>(
      listener: (context, state) {
        if (state is DoneApplyState) {
          Navigator.pushReplacement(context,
              customPageRouteTransition(HomeScreen(token: generalToken)));
        } else {
          showSnakBar(context, "error in applying to this job");
        }
      },
      builder: (context, state) {
        ApplyCubit cubit = ApplyCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const ReusableBigText(message: "Portfolio"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        ClipOval(
                            child: Container(
                          decoration: BoxDecoration(
                              gradient: gradient.linearGradientBlue),
                          height: 50,
                          width: 50,
                          child: const Center(
                              child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )),
                        )),
                        const SizedBox(height: 5),
                        const ReusableAdjustedText(
                            message: "Biodata", size: 12, color: Colors.blue)
                      ]),
                      Column(children: [
                        ClipOval(
                            child: Container(
                          decoration: BoxDecoration(
                              gradient: gradient.linearGradientBlue),
                          height: 50,
                          width: 50,
                          child: const Center(
                              child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )),
                        )),
                        const SizedBox(height: 5),
                        const ReusableAdjustedText(
                            message: "Type of Work",
                            size: 12,
                            color: Colors.blue)
                      ]),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(25)),
                              height: 50,
                              width: 50,
                              child: const Center(
                                  child: ReusableAdjustedText(
                                      message: "3",
                                      size: 16,
                                      color: Colors.blueAccent))),
                          const SizedBox(height: 5),
                          const ReusableAdjustedText(
                              message: "portfolio",
                              size: 12,
                              color: Colors.blueAccent)
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Row(children: [
                        ReusableAdjustedText(
                            message: "Type of work",
                            size: 20,
                            fontWeight: FontWeight.bold),
                      ]),
                      const Row(children: [
                        ReusableAdjustedText(
                            message: "Fill in your bio data correctly",
                            size: 14),
                      ]),
                      const SizedBox(height: 20),
                      const Row(children: [
                        ReusableAdjustedText(
                            message: "Upload CV",
                            size: 16,
                            fontWeight: FontWeight.bold),
                      ]),
                      const SizedBox(height: 10),
                      Container(
                        height: height * .12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          children: [
                            Image.asset("assets/pdf.png"),
                            const SizedBox(width: 10),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableAdjustedText(
                                    message: "CV.pdf",
                                    size: 14,
                                    fontWeight: FontWeight.bold),
                                ReusableAdjustedText(
                                    message: "CV.pdf 300KB", size: 10),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: appliedData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
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
                      )),
                      const SizedBox(height: 10),
                      const Row(children: [
                        ReusableAdjustedText(
                            message: "Other file",
                            size: 16,
                            fontWeight: FontWeight.bold),
                      ]),
                      const SizedBox(height: 10),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: const Color(0xFF3366FF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFECF2FF),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              ClipOval(
                                child: Container(
                                  color: Colors.white.withOpacity(.3),
                                  child: Image.asset(
                                    'assets/portfolio/upload.png',
                                    height: 60,
                                    width: 60,
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
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child: ElevatedButton(
                                      onPressed: () {
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
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      )),
                                ),
                              ),
                              const SizedBox(height: 10)
                            ],
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width,
                          child: FloatingActionButton(
                              backgroundColor: Colors.indigo,
                              onPressed: () {
                                cubit.applyToJobData(
                                    jobId: widget.list[0],
                                    userId: generalID,
                                    name: widget.list[2],
                                    email: widget.list[3],
                                    number: widget.list[4],
                                    work: widget.list[5],
                                    file: file,
                                    image: image);
                              },
                              child: const ReusableAdjustedText(
                                  message: 'Submit',
                                  size: 14,
                                  color: Colors.white)))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
