import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      protein,
      carbs,
      fibers,
      weight,
      suger,
      fat,
      vitamins,
      description,
      id,
      category;
  CollectionReference theCollectionReference;
  editItemButtonFunction(
      {super.key,
      required this.calories,
      required this.imageLink,
      required this.name,
      required this.carbs,
      required this.fibers,
      required this.protein,
      required this.vitamins,
      required this.weight,
      required this.fat,
      required this.suger,
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
    "Fruits",
    "Vegetables",
    "Dairy",
    "Meat",
    "junk Food",
    "White meat"
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
    TextEditingController protein = TextEditingController();
    protein.text = widget.protein;
    TextEditingController carbs = TextEditingController();
    carbs.text = widget.carbs;
    TextEditingController fibers = TextEditingController();
    fibers.text = widget.fibers;
    TextEditingController weight = TextEditingController();
    weight.text = widget.weight;
    TextEditingController vitamins = TextEditingController();
    vitamins.text = widget.vitamins;
    TextEditingController fat = TextEditingController();
    fat.text = widget.fat;
    TextEditingController suger = TextEditingController();
    suger.text = widget.suger;

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
              try {
                widget.theCollectionReference.doc(widget.id).delete();
                FirebaseStorage.instance.refFromURL(widget.imageLink).delete();
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
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
                      theItemController: calories, theItemName: "calories"),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                      theItemController: protein, theItemName: "protein"),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(theItemController: carbs, theItemName: "carbs"),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                    theItemName: "fibers",
                    theItemController: fibers,
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  ItemInfoRow(
                    theItemName: "Weight",
                    theItemController: weight,
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
                  ),
                  addHorizantalSpace(5),
                  ItemInfoRow(
                    theItemName: "fat",
                    theItemController: fat,
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
                        protein: protein.text,
                        carbs: carbs.text,
                        fibers: fibers.text,
                        weight: weight.text,
                        vitamins: vitamins.text,
                        fat: fat.text,
                        suger: suger.text,
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
      required String protein,
      required String carbs,
      required String fibers,
      required String weight,
      required String vitamins,
      required String suger,
      required String fat,
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


}
