import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_mobile/change_mobile_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_mobile/change_mobile_state.dart';
import '../../../core/managers/utils/dialogs/snak_bar.dart';
import '../../widgets/reusable_text.dart';

class EditPhone extends StatefulWidget {
  final String token;

  const EditPhone({super.key, required this.token});

  @override
  State<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends State<EditPhone> {
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
  late final TextEditingController mobileController;

  // late final String token;

  @override
  void initState() {
    super.initState();
    mobileController = TextEditingController();
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ChangeMobileCubit, ChangeMobileState>(
      listener: (context, state) {
        if (state is DoneChangeMobileState) {
          showSnakBar(context, "changed successfully");
          Timer(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        } else {
          showSnakBar(context, "error in changing your number");
        }
      },
      builder: (context, state) {
        ChangeMobileCubit cubit = ChangeMobileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit number"),
            // centerTitle: true,
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Row(children: [
                      ReusableAdjustedText(
                          message: "Main Mobile Phone", size: 16)
                    ]),
                    TextField(
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
                  ],
                ),
                SizedBox(
                  // height: 40,
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.editMobile(context, mobile: mobileController.text);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent)),
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                // EndButton(onPressed: constants.api, name: 'Save'),
              ],
            ),
          )),
        );
      },
    );
  }
}
