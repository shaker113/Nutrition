import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/screens/bodyFatClaculator.dart';
import 'package:fina/screens/dailyNeedCalculator.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fina/data/data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:path/path.dart';
import '../models/models.dart';

class Profile_Page extends StatefulWidget {
  // String accountImage, userName, userEmail, weight, height;
  Profile_Page({
    super.key,
  });
  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  void initState() {
    getAccountInfo();
    heightController.text = userHeight!.toString();
    weightController.text = userWeight!.toString();
    TheStatOfDailyNeedCalculator().plussMethod(
        double.parse(weightController.text),
        double.parse(heightController.text),
        true);
    TheStatOfbodyFatCalState().testmethod(double.parse(weightController.text),
        double.parse(heightController.text), userGender!, userAge!, true);
    super.initState();
  }

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  File? image;
  var imagepiker = ImagePicker();
  var storgeRef;

  set newText(String newText) {}
  bool isEdditing = false;

  @override
  Widget build(BuildContext context) {
    nameController.text = userName!;
    heightController.text = userHeight!.toString();
    weightController.text = userWeight!.toString();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: screenHeigth,
            width: screenWidth,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  backgrounColor,
                  backgrounColor,
                  backgrounColor2,
                  backgrounColor2
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.35,
            child: SizedBox(
              width: screenWidth,
              height: screenHeigth! / 2 - 140,
              child: Image(
                image:
                    AssetImage(isEdditing ? mountains2Image : mountainsImage),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeigth! / 2 - 140,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.3),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 20,
              child: Row(
                children: [
                  backButton(context),
                ],
              )),
          Positioned(
            left: screenWidth! / 2 - 38,
            top: 35,
            child: const Text(
              "Profile",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          userImageinterface(),
          Positioned(
            top: screenHeigth! / 2 - 70,
            left: 0,
            right: 0,
            bottom: 10,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  infoOrtextfeild(
                    "Name",
                    userName ?? " ",
                    nameController,
                    (p0) => nameValidator(p0),
                  ),
                  addVerticalSpace(20),
                  Text(
                    userEmail ?? " ",
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  addVerticalSpace(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      hAndWinfoOrtextfeild(
                        "Height",
                        "cm",
                        userHeight!.toString(),
                        heightController,
                        (p0) => null,
                      ),
                      addHorizantalSpace(10),
                      hAndWinfoOrtextfeild(
                        "weight",
                        "Kg",
                        userWeight!.toString(),
                        weightController,
                        (p0) => null,
                      ),
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      infoContainer(
                        thepage: DailyNeedCalculator(),
                        assetName1: caloriesIcon,
                        title1: (userCal ?? 0).toStringAsFixed(0),
                        subtitle1: "Cal",
                        assetName2: proteinIcon,
                        title2: (userProtein ?? 0).toStringAsFixed(0),
                        subtitle2: "g",
                        assetName3: fatsIcon,
                        title3: (userFat ?? 0).toStringAsFixed(0),
                        subtitle3: "g",
                      ),
                      infoContainer(
                        thepage: const bodyFatCal(),
                        assetName1: bmiIcon,
                        title1: (userBmi ?? 0).toStringAsFixed(0),
                        subtitle1: "BMI",
                        assetName2: bodyFatIcon,
                        title2: (userFatPercentage ?? 0).toStringAsFixed(0),
                        subtitle2: "Body Fat",
                        assetName3: bmiStatusIcon,
                        title3: userStatus ?? "",
                        subtitle3: "Status",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenWidth! * 0.35,
            right: screenWidth! * 0.35,
            bottom: 10,
            child: LongButton(
                theFunction: () {
                  setState(() {
                    isEdditing = !isEdditing;
                  });
                  if (isEdditing == false) {
                    userCollection.doc(userId).update({
                      'name': nameController.text,
                      'height': double.parse(heightController.text),
                      'Weight': double.parse(weightController.text),
                    });
                    setState(() {
                      userName = nameController.text;
                      userWeight = double.parse(weightController.text);
                      userHeight = double.parse(heightController.text);
                    });
                    TheStatOfDailyNeedCalculator().plussMethod(
                        double.parse(weightController.text),
                        double.parse(heightController.text),
                        true);
                    TheStatOfbodyFatCalState().testmethod(
                        double.parse(weightController.text),
                        double.parse(heightController.text),
                        userGender!,
                        userAge!,
                        true);
                  }
                },
                theText: isEdditing ? "Save" : "Edit"),
          )
        ],
      ),
    );
  }

  hAndWinfoOrtextfeild(
      String label,
      String infoUnit,
      String? mainText,
      TextEditingController theController,
      String? Function(String?)? validator) {
    return Container(
      width: screenWidth! * 0.4,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
        ),
      ),
      child: isEdditing
          ? SizedBox(
              height: 50,
              child: Container(
                width: screenWidth! / 3,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextfield(
                  label: label,
                  inputType: TextInputType.number,
                  theFormater: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                  ],
                  theController: theController,
                  validator: validator,
                ),
              ),
            )
          : Text(
              "$label: ${mainText ?? " "} $infoUnit",
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  infoOrtextfeild(
      String label,
      String? mainText,
      TextEditingController theController,
      String? Function(String?)? validator) {
    return isEdditing
        ? SizedBox(
            width: screenWidth! / 2,
            child: CustomTextfield(
              label: label,
              theController: theController,
              validator: validator,
            ),
          )
        : Text(
            mainText ?? " ",
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
  }

  userImageinterface() {
    return Positioned(
      left: screenWidth! / 2 - 70,
      top: screenHeigth! / 2 - 220,
      child: Stack(
        children: [
          Hero(
            tag: accountImage ?? "",
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4), width: 1.5)),
              child: CircleAvatar(
                foregroundImage: accountImage == null
                    ? null
                    : CachedNetworkImageProvider(accountImage!),
                backgroundColor: buttonsColor,
                radius: 65,
                child: Text(
                  userName!
                      .trim()
                      .split(' ')
                      .map((l) => l[0])
                      .take(2)
                      .join()
                      .toUpperCase()
                      .toString(),
                  style: const TextStyle(
                      letterSpacing: 4, fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          isEdditing
              ? Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        if (accountImage != null) {
                          FirebaseStorage.instance
                              .refFromURL(accountImage!)
                              .delete();
                        }
                        int random = Random().nextInt(1000000000);
                        var imagepiked = await imagepiker.pickImage(
                            source: ImageSource.gallery);
                        if (imagepiked != null) {
                          setState(
                            () {
                              image = File(imagepiked.path);
                            },
                          );

                          var imageName = basename(imagepiked.path);
                          storgeRef = FirebaseStorage.instance
                              .ref("images/$random$imageName");
                          await storgeRef.putFile(image);
                          var imageUrl = await storgeRef.getDownloadURL();
                          final user = FirebaseFirestore.instance
                              .collection('user')
                              .doc(userId);
                          final userinfo = {'image': imageUrl};
                          await user.update(userinfo);
                          // getAccountInfo();

                          setState(() {});
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        color: backgrounColor2,
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
