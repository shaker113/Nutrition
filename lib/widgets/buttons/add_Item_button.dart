import 'dart:math';
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class AddButton extends StatelessWidget {
  CollectionReference theCollectionReference;
  AddButton({
    super.key,
    required this.theCollectionReference,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            child: AddingPage(theCollectionReference: theCollectionReference),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

class AddingPage extends StatefulWidget {
  CollectionReference theCollectionReference;
  AddingPage({super.key, required this.theCollectionReference});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  bool isSugerFree = false,
      isHighProtein = false,
      isHighIron = false,
      isHighCrbs = false;
  File? image;
  var imagepiker = ImagePicker();
  var storgeRef;

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController calories = TextEditingController();
  TextEditingController caloriesUnit = TextEditingController();
  TextEditingController protein = TextEditingController();
  TextEditingController proteinUnit = TextEditingController();
  TextEditingController carbs = TextEditingController();
  TextEditingController carbsUnit = TextEditingController();
  TextEditingController fibers = TextEditingController();
  TextEditingController fibersUnit = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController weightUnit = TextEditingController();
  TextEditingController vitamins = TextEditingController();
  TextEditingController vitaminsUnit = TextEditingController();
  TextEditingController fat = TextEditingController();
  TextEditingController fatUnit = TextEditingController();
  TextEditingController suger = TextEditingController();
  TextEditingController sugerUnit = TextEditingController();
  List category = [
    "Drinks",
    "Fruits ",
    "Vegetables",
    "Dairy",
    "Meat ",
    "Healty Food"
  ];
  String chosenCategory = "Drinks";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: backgrounColor2,
        elevation: 0,
        title: const Text(
          "Adding Item",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Text(
                "Please fill the information of the item",
                style: customTextStyle.displaySmall,
              ),
              addVerticalSpace(10),
              Text(
                "Item name",
                style: customTextStyle.bodyMedium,
              ),
              addVerticalSpace(10),
              CustomTextfieldBlue(
                label: "name",
                theController: name,
              ),
              addVerticalSpace(10),
              const Text("image"),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonsColor,
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () async {
                  var random = Random().nextInt(1000000000);
                  var imagepiked =
                      await imagepiker.pickImage(source: ImageSource.gallery);
                  if (imagepiked != null) {
                    setState(
                      () {
                        image = File(imagepiked.path);
                      },
                    );

                    var imageName = basename(imagepiked.path);
                    storgeRef = FirebaseStorage.instance
                        .ref("images/$random$imageName");
                  }
                },
                child: const Text(
                  "Upload an image",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
              addVerticalSpace(10),
              image != null
                  ? Image.file(
                      image!,
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text("No image has uploaded yet"),
                    ),
              addVerticalSpace(10),
              Text(
                "Item description",
                style: customTextStyle.bodyMedium,
              ),
              addVerticalSpace(10),
              CustomTextfieldBlue(
                label: "description",
                maxLines: 5,
                theController: description,
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                      theItemController: calories,
                      theUnitController: caloriesUnit,
                      theItemName: "calories"),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                      theItemController: protein,
                      theUnitController: proteinUnit,
                      theItemName: "protein"),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                      theItemController: carbs,
                      theUnitController: carbsUnit,
                      theItemName: "carbs"),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                      theItemName: "fibers",
                      theItemController: fibers,
                      theUnitController: fibersUnit)
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                      theItemName: "Weight",
                      theItemController: weight,
                      theUnitController: weightUnit),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                      theItemName: "Vitamins",
                      theItemController: vitamins,
                      theUnitController: vitaminsUnit),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                      theItemName: "Suger",
                      theItemController: suger,
                      theUnitController: sugerUnit),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                      theItemName: "fat",
                      theItemController: fat,
                      theUnitController: fatUnit),
                ],
              ),
              categoryRow(setState),
              SwitchListTile(
                activeColor: backgrounColor,
                value: isSugerFree,
                onChanged: (value) {
                  setState(
                    () {
                      isSugerFree = value;
                    },
                  );
                },
                title: Text(
                  "Is High Protein?",
                  style: customTextStyle.bodyMedium,
                ),
              ),
              SwitchListTile(
                activeColor: backgrounColor,
                value: isHighProtein,
                onChanged: (value) {
                  setState(
                    () {
                      isHighProtein = value;
                    },
                  );
                },
                title: Text(
                  "Is Suger Free?",
                  style: customTextStyle.bodyMedium,
                ),
              ),
              SwitchListTile(
                activeColor: backgrounColor,
                value: isHighIron,
                onChanged: (value) {
                  setState(
                    () {
                      isHighIron = value;
                    },
                  );
                },
                title: Text(
                  "Is High iron?",
                  style: customTextStyle.bodyMedium,
                ),
              ),
              SwitchListTile(
                activeColor: backgrounColor,
                value: isHighCrbs,
                onChanged: (value) {
                  setState(
                    () {
                      isHighCrbs = value;
                    },
                  );
                },
                title: Text(
                  "Is High carbs?",
                  style: customTextStyle.bodyMedium,
                ),
              ),
              GradientButton(
                  theFunction: () async {
                    try {
                      await storgeRef.putFile(image!);
                      String imageUrl = await storgeRef.getDownloadURL();
                      createItem(
                        name: name.text,
                        id: "s",
                        description: description.text,
                        calories: calories.text,
                        caloriesUnit: caloriesUnit.text,
                        protein: protein.text,
                        proteinUnit: proteinUnit.text,
                        carbs: carbs.text,
                        carbsUnit: carbsUnit.text,
                        fibers: fibers.text,
                        fibersUnit: fibersUnit.text,
                        weight: weight.text,
                        weightUnit: weightUnit.text,
                        vitamins: vitamins.text,
                        vitaminsUnit: vitaminsUnit.text,
                        fat: fat.text,
                        fatUnit: fatUnit.text,
                        suger: suger.text,
                        sugerUnit: sugerUnit.text,
                        category: chosenCategory,
                        imageLink: imageUrl,
                        isSugerFree: isSugerFree,
                        isHighprotine: isHighProtein,
                        isHighcarbs: isHighCrbs,
                        isHighIron: isHighIron,
                        collection: widget.theCollectionReference,
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      CustomSnakBar(
                          "There is something went wrong please try again",
                          context);
                    }
                  },
                  theText: "Add Item")
            ],
          );
        },
      ),
    );
  }

  Future createItem(
      {required String name,
      required String? id,
      required String description,
      required String calories,
      required String caloriesUnit,
      required String protein,
      required String proteinUnit,
      required String carbs,
      required String carbsUnit,
      required String fibers,
      required String fibersUnit,
      required String weight,
      required String weightUnit,
      required String suger,
      required String sugerUnit,
      required String fat,
      required String fatUnit,
      required String vitamins,
      required String vitaminsUnit,
      required String category,
      required String imageLink,
      required bool isSugerFree,
      required bool isHighprotine,
      required bool isHighcarbs,
      required bool isHighIron,
      required CollectionReference collection}) async {
    final json = {
      'id': id,
      'name': name,
      'description': description,
      'calories': calories,
      'caloriesUnit': caloriesUnit,
      'protein': protein,
      'proteinUnit': proteinUnit,
      'carbs': carbs,
      'carbsUnit': carbsUnit,
      'fibers': fibers,
      'fibersUnit': fibersUnit,
      'weight': weight,
      'weightUnit': weightUnit,
      'vitamins': vitamins,
      'vitaminsUnit': vitaminsUnit,
      'suger': suger,
      'sugerUnit': sugerUnit,
      'fat': fat,
      'fatUnit': fatUnit,
      'category': category,
      'imageLink': imageLink,
      'isSugerFree': isSugerFree,
      'isHighprotine': isHighprotine,
      'isHighcarbs': isHighcarbs,
      'isHighIron': isHighIron,
    }; //to Create doucumant
    await collection.doc().set(json);
  }

  Row categoryRow(StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "category",
          style: customTextStyle.bodyMedium,
        ),
        DropdownButton(
          value: chosenCategory,
          items: category
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    "$e",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  )))
              .toList(),
          onChanged: (value) {
            setState(() {
              chosenCategory = value.toString();
            });
          },
        )
      ],
    );
  }

  SwitchListTile CustomSwitchList(
      StateSetter setState, bool theValue, String theText) {
    return SwitchListTile(
      activeColor: backgrounColor,
      value: theValue,
      onChanged: (value) {
        setState(
          () {
            theValue = value;
          },
        );
      },
      title: Text(
        theText,
        style: customTextStyle.bodyMedium,
      ),
    );
  }
}

class ItemInfoRow extends StatelessWidget {
  const ItemInfoRow(
      {Key? key,
      required this.theItemController,
      required this.theUnitController,
      required this.theItemName})
      : super(key: key);
  final String theItemName;
  final TextEditingController theItemController;
  final TextEditingController theUnitController;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text(
            "Item $theItemName",
            style: customTextStyle.bodyMedium,
          ),
          addVerticalSpace(10),
          CustomTextfieldBlue(
            label: theItemName,
            theController: theItemController,
          ),
          addVerticalSpace(5),
          CustomTextfieldBlue(
            label: "unit ",
            theController: theUnitController,
          ),
        ],
      ),
    );
  }
}
