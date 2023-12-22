import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../core/managers/managers.dart';
import '../../../core/remote/api_constants.dart';
import '../../widgets/portifolio_widgets/general_buttoms.dart';
import '../../widgets/portifolio_widgets/other_buttoms.dart';
import '../../widgets/reusable_text.dart';
import '../home/applied_jobs.dart';
import '../home/home_screen.dart';
import 'edit_profile.dart';
import 'profile_language.dart';
import 'profile_login_security.dart';
import 'profile_notifications.dart';
import 'profile_portifolio.dart';

class ProfileScreen extends StatefulWidget {
  final String token;

  const ProfileScreen({super.key, required this.token});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApiConstants constants = ApiConstants();
  String aboutText = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withOpacity(.4),
        elevation: 0,
        title: const ReusableBigText(message: "Profile"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.redAccent,
              ))
        ],
      ),
      body: SizedBox(
        height: height * 2,
        child: ListView(children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * .1,
                    color: Colors.blueAccent.withOpacity(.4),
                  ),
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white)),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/profile/profile.png",
                            height: 100,
                            // width: 150,
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ReusableAdjustedText(
                  message: generalName, size: 16, fontWeight: FontWeight.bold),
              const ReusableAdjustedText(
                message: "Senior UI/UX Designer",
                size: 12,
                color: Colors.grey,
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      ReusableSmallText(message: "applied"),
                      ReusableAdjustedText(message: '0', size: 18)
                    ]),
                    // VerticalDivider(thickness: 5,color: Colors.black,),
                    Column(children: [
                      ReusableSmallText(message: "Reviewed"),
                      ReusableAdjustedText(message: '0', size: 18)
                    ]),
                    // VerticalDivider(thickness: 5,color: Colors.black,),
                    Column(children: [
                      ReusableSmallText(message: "Rejected"),
                      ReusableAdjustedText(message: '0', size: 18)
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // color: Colors.grey.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ReusableAdjustedText(
                        message: "About",
                        size: 14,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          searchController.clear();
                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: Container(
                                      height: height * .8,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                              width: 70,
                                              child: Divider(
                                                  thickness: 3.5,
                                                  color: Colors.black)),
                                          const SizedBox(height: 10),
                                          TextField(
                                            onSubmitted: (searchText) {
                                              setState(() {
                                                aboutText = searchText;
                                              });
                                            },
                                            controller: searchController,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                                prefixIcon:
                                                    const Icon(Icons.search),
                                                suffixIcon: GestureDetector(
                                                    onTap: () =>
                                                        searchController
                                                            .clear(),
                                                    child: const Icon(
                                                        Icons.clear)),
                                                hintText: "enter about",
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                          ),
                                          const SizedBox(height: 20),
                                          const Text("Preview the About"),
                                          Text(aboutText)
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: const ReusableAdjustedText(
                          message: "Edit",
                          size: 14,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ReusableAdjustedText(
                          message: aboutText,
                          size: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey.shade300,
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableAdjustedText(
                        message: "General",
                        size: 14,
                        color: Colors.black,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: height * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GeneralButton(
                          builder: (_) => EditProfile(token: widget.token),
                          name: "Edit profile",
                          token: widget.token,
                          image: "assets/profile/edit_profile.png"),
                      const Divider(thickness: 1),
                      GeneralButton(
                          builder: (_) => Portfolio(token: widget.token),
                          name: "Portfolio",
                          token: widget.token,
                          image: "assets/profile/portfolio.png"),
                      const Divider(thickness: 1),
                      GeneralButton(
                          builder: (_) => const Language(),
                          name: "Language",
                          token: widget.token,
                          image: "assets/profile/language.png"),
                      const Divider(thickness: 1),
                      GeneralButton(
                          builder: (_) => Notifications(token: widget.token),
                          name: "Notifications",
                          token: widget.token,
                          image: "assets/profile/notification.png"),
                      const Divider(thickness: 1),
                      GeneralButton(
                          builder: (_) => LoginAndSecurity(token: widget.token),
                          name: "Login and Security",
                          token: widget.token,
                          image: "assets/profile/lock.png"),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey.shade300,
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableAdjustedText(
                        message: "Others",
                        size: 14,
                        color: Colors.black,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: height * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtherButton(
                        builder: (_) => AppliedJobs(token: generalToken),
                        name: "Accessibility",
                        token: widget.token,
                      ),
                      const Divider(thickness: 1),
                      OtherButton(
                        builder: (_) => EditProfile(token: generalToken),
                        name: "Terms and policy",
                        token: widget.token,
                      ),
                      const Divider(thickness: 1),
                      OtherButton(
                        builder: (_) => EditProfile(token: generalToken),
                        name: "Terms and policy",
                        token: widget.token,
                      ),
                      const Divider(thickness: 1),
                      OtherButton(
                        builder: (_) => EditProfile(token: generalToken),
                        name: "Privacy Police",
                        token: widget.token,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
