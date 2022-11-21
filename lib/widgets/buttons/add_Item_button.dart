import 'dart:math';
import 'dart:io';
import 'package:fina/models/firestore_refrences.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            child: const AddingPage(),
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
  const AddingPage({
    super.key,
  });

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
  TextEditingController protein = TextEditingController();
  TextEditingController carbs = TextEditingController();
  TextEditingController fibers = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController vitamins = TextEditingController();
  TextEditingController fat = TextEditingController();
  TextEditingController suger = TextEditingController();
  List category = [
    "Drinks",
    "Fruits",
    "Vegetables",
    "Dairy",
    "Meat",
    "junk Food",
    "White meat",
    "Sweets",
    "Bakery"
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
                      theItemName: "calories",
                      theFormater: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9.]'),
                        ),
                      ]),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                      theItemController: protein,
                      theItemName: "protein",
                      theFormater: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9.]'),
                        ),
                      ]),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                      theItemController: carbs,
                      theItemName: "carbs",
                      theFormater: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9.]'),
                        ),
                      ]),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                    theItemName: "fibers",
                    theItemController: fibers,
                    theFormater: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[0-9.]'),
                      ),
                    ],
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                    theItemName: "Weight",
                    theItemController: weight,
                    theFormater: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[0-9.]'),
                      ),
                    ],
                  ),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                    theItemName: "Vitamins",
                    theItemController: vitamins,
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                    theItemName: "Suger",
                    theItemController: suger,
                    theFormater: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[0-9.]'),
                      ),
                    ],
                  ),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                    theItemName: "fat",
                    theItemController: fat,
                    theFormater: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[0-9.]'),
                      ),
                    ],
                  ),
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
                        calories: double.parse(calories.text),
                        protein: double.parse(protein.text),
                        carbs: double.parse(carbs.text),
                        fibers: double.parse(fibers.text),
                        weight: double.parse(weight.text),
                        vitamins: vitamins.text,
                        fat: double.parse(fat.text),
                        suger: double.parse(suger.text),
                        category: chosenCategory,
                        imageLink: imageUrl,
                        isSugerFree: isSugerFree,
                        isHighprotine: isHighProtein,
                        isHighcarbs: isHighCrbs,
                        isHighIron: isHighIron,
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

  Future createItem({
    required String name,
    required String? id,
    required String description,
    required double calories,
    required double protein,
    required double carbs,
    required double fibers,
    required double weight,
    required double suger,
    required double fat,
    required String vitamins,
    required String category,
    required String imageLink,
    required bool isSugerFree,
    required bool isHighprotine,
    required bool isHighcarbs,
    required bool isHighIron,
  }) async {
    CollectionReference? theCollectionReference;

    if (category == "Meat") {
      theCollectionReference = meatCollection;
    } else if (category == "Fruits") {
      theCollectionReference = fruitsCollecton;
    } else if (category == "Vegetables") {
      theCollectionReference = vegetablesCollection;
    } else if (category == "Dairy") {
      theCollectionReference = dairyCollection;
    } else if (category == "junk Food") {
      theCollectionReference = junkFoodCollection;
    } else if (category == "White meat") {
      theCollectionReference = whiteMeatCollection;
    } else if (category == "Drinks") {
      theCollectionReference = drinksCollection;
    } else if (category == "Sweets") {
      theCollectionReference = sweetCollection;
    } else if (category == "Bakery") {
      theCollectionReference = bakeryCollection;
    }

    final json = {
      'id': id,
      'name': name,
      'description': description,
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fibers': fibers,
      'weight': weight,
      'vitamins': vitamins,
      'suger': suger,
      'fat': fat,
      'category': category,
      'imageLink': imageLink,
      'isSugerFree': isSugerFree,
      'isHighprotine': isHighprotine,
      'isHighcarbs': isHighcarbs,
      'isHighIron': isHighIron,
    }; //to Create doucumant
    await theCollectionReference!.doc().set(json);
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
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    "$e",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              )
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
}
