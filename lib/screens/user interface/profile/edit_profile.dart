import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/profile_controllers/edit_profile/edit_profile_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/edit_profile/edit_profile_state.dart';
import '../../../core/managers/utils/dialogs/snak_bar.dart';
import '../../widgets/reusable_text.dart';

class EditProfile extends StatefulWidget {
  final String token;

  const EditProfile({super.key, required this.token});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Country country = Country(
      phoneCode: '20',
      countryCode: 'eg',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'EGYPT',
      example: 'EGYPT',
      displayName: 'Egypt',
      displayNameNoCountryCode: 'EG',
      e164Key: '');

  final TextEditingController bioController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    bioController.dispose();
    addressController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is DoneEditState) {
          showSnakBar(context, "changed successfully");
          Timer(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        } else {
          showSnakBar(context, "error in editing your info");
        }
      },
      builder: (context, state) {
        EditProfileCubit cubit = EditProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const ReusableBigText(message: "Edit profile"),
            centerTitle: true,
          ),
          body: ListView(children: [
            Column(
              children: [
                SizedBox(
                  height: height * .25,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              // border: Border.all(color: Colors.grey),
                            ),
                            child: Stack(children: [
                              ClipOval(
                                  child: Image.asset(
                                      "assets/profile/profile.png",
                                      height: 100)),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Icon(Icons.camera_alt_outlined,
                                      size: 60,
                                      color: Colors.white.withOpacity(.6)))
                            ])),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const ReusableAdjustedText(
                              message: "Change Photo",
                              size: 14,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [Text("bio")]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: bioController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [Text("address")]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [Text("mobile")]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: CountryListThemeData(
                                      bottomSheetHeight: height * .6,
                                      backgroundColor: Colors.white),
                                  onSelect: (code) {
                                    setState(() {
                                      country = code;
                                    });
                                  });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ReusableAdjustedText(
                                  message: country.flagEmoji,
                                  size: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
                SizedBox(height: height * .05),
                SizedBox(
                  // height: 40,
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      if (bioController.text.isNotEmpty &&
                          addressController.text.isNotEmpty &&
                          mobileController.text.isNotEmpty) {
                        cubit.editProfileData(
                          context,
                          bio: bioController.text,
                          address: addressController.text,
                          mobile: mobileController.text,
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CupertinoAlertDialog(
                                title: const Text("failed to edit"),
                                content: const Text(
                                  "please be sure that you entered all the required elements",
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('close')),
                                ],
                              );
                            });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent)),
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
