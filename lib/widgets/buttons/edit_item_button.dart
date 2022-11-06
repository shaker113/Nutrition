import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:path/path.dart';
import '../../data/data.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets.dart';

class editItemButtonFunction extends StatefulWidget {
  bool? isSugerFree, isHighProtein, isHighIron, isHighCrbs;
  String imageLink,
      name,
      calories,
      caloriesUnit,
      protein,
      proteinUnit,
      carbs,
      carbsUnit,
      fibers,
      fibersUnit,
      weight,
      suger,
      sugerUnit,
      fat,
      fatUnit,
      weightUnit,
      vitamins,
      vitaminsUnit,
      description,
      id,
      category;
  CollectionReference theCollectionReference;
  editItemButtonFunction(
      {super.key,
      required this.calories,
      required this.imageLink,
      required this.name,
      required this.caloriesUnit,
      required this.carbs,
      required this.carbsUnit,
      required this.fibers,
      required this.fibersUnit,
      required this.protein,
      required this.proteinUnit,
      required this.vitamins,
      required this.vitaminsUnit,
      required this.weight,
      required this.weightUnit,
      required this.fat,
      required this.fatUnit,
      required this.suger,
      required this.sugerUnit,
      required this.description,
      required this.id,
      required this.isHighCrbs,
      required this.isHighIron,
      required this.isHighProtein,
      required this.isSugerFree,
      required this.category,
      required this.theCollectionReference});

  @override
  State<editItemButtonFunction> createState() => _editItemButtonFunctionState();
}

class _editItemButtonFunctionState extends State<editItemButtonFunction> {
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
    bool isSugerFree = widget.isSugerFree ?? false,
        isHighProtein = widget.isHighProtein ?? false,
        isHighIron = widget.isHighIron ?? false,
        isHighCrbs = widget.isHighCrbs ?? false;
    File? image;
    var imagepiker = ImagePicker();
    var storgeRef;

    TextEditingController name = TextEditingController();
    name.text = widget.name;
    TextEditingController description = TextEditingController();
    description.text = widget.description;
    TextEditingController calories = TextEditingController();
    calories.text = widget.calories;
    TextEditingController caloriesUnit = TextEditingController();
    caloriesUnit.text = widget.caloriesUnit;
    TextEditingController protein = TextEditingController();
    protein.text = widget.protein;
    TextEditingController proteinUnit = TextEditingController();
    proteinUnit.text = widget.proteinUnit;
    TextEditingController carbs = TextEditingController();
    carbs.text = widget.carbs;
    TextEditingController carbsUnit = TextEditingController();
    carbsUnit.text = widget.carbsUnit;
    TextEditingController fibers = TextEditingController();
    fibers.text = widget.fibers;
    TextEditingController fibersUnit = TextEditingController();
    fibersUnit.text = widget.fibersUnit;
    TextEditingController weight = TextEditingController();
    weight.text = widget.weight;
    TextEditingController weightUnit = TextEditingController();
    weightUnit.text = widget.weightUnit;
    TextEditingController vitamins = TextEditingController();
    vitamins.text = widget.vitamins;
    TextEditingController vitaminsUnit = TextEditingController();
    vitaminsUnit.text = widget.vitaminsUnit;
    TextEditingController fat = TextEditingController();
    fat.text = widget.fat;
    TextEditingController fatUnit = TextEditingController();
    fatUnit.text = widget.fatUnit;
    TextEditingController suger = TextEditingController();
    suger.text = widget.suger;
    TextEditingController sugerUnit = TextEditingController();
    sugerUnit.text = widget.sugerUnit;
    chosenCategory = widget.category;
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
          "Updating Item",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              widget.theCollectionReference.doc(widget.id).delete();
              FirebaseStorage.instance.refFromURL(widget.imageLink).delete();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_outline),
          )
        ],
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
                  : Image(
                      image: NetworkImage(widget.imageLink),
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
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
                    String? imageUrl;
                    try {
                      if (image != null) {
                        await storgeRef.putFile(image!);
                        imageUrl = await storgeRef.getDownloadURL();
                      }
                      updateItem(
                        name: name.text,
                        id: widget.id,
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
                        fat: fat.text,
                        fatUnit: fatUnit.text,
                        suger: suger.text,
                        sugerUnit: sugerUnit.text,
                        vitaminsUnit: vitaminsUnit.text,
                        category: chosenCategory,
                        imageLink: image != null ? imageUrl : widget.imageLink,
                        isSugerFree: isSugerFree,
                        isHighprotine: isHighProtein,
                        isHighcarbs: isHighCrbs,
                        isHighIron: isHighIron,
                        collection: widget.theCollectionReference,
                      );
                      if (image != null) {
                        FirebaseStorage.instance
                            .refFromURL(widget.imageLink)
                            .delete();
                      }

                      Navigator.pop(context);
                    } catch (e) {
                      CustomSnakBar(
                          "There is something went wrong please try again",
                          context);
                    }
                  },
                  theText: "Update Item")
            ],
          );
        },
      ),
    );
  }

  Future updateItem(
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
      required String vitamins,
      required String suger,
      required String sugerUnit,
      required String fat,
      required String fatUnit,
      required String vitaminsUnit,
      required String category,
      required String? imageLink,
      required bool isSugerFree,
      required bool isHighprotine,
      required bool isHighcarbs,
      required bool isHighIron,
      required CollectionReference collection}) async {
    collection.doc(id).update({
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
    });
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
