import 'dart:io';

import 'package:delicious_food/Data/AllMeals.dart';
import 'package:delicious_food/module/FoodCardModule.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddFooditem extends ConsumerStatefulWidget {
  const AddFooditem({Key? key}) : super(key: key);

  @override
  _AddFooditemState createState() => _AddFooditemState();
}

class _AddFooditemState extends ConsumerState<AddFooditem> {

  final foodName = TextEditingController();
  final foodPrice = TextEditingController();
  final foodDetails = TextEditingController();

  void AddItem() {
    final name = foodName.text;
    final price = foodPrice.text;
    final detail = foodDetails.text;

    if (name == '' || price == '' || detail == '') {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("not Added , refresh home page")));
      return;
    }
    final addItem = ref.read(allFoodProvider.notifier);

    addItem.addfFood(FoodCard(ItemName: name, ItemDetails: detail, ItemPrice: price, imagePath: ClickedImage!));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Added")));
  }

  File? ClickedImage;

  void TakeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      ClickedImage = File(pickedImage.path);
    });
  }

  //void UploadImage(){
  // if(ClickedImage!=null&&foodName.text!=''&&foodPrice!=''&&foodDetails!=''){

  //final upload= FirebaseStorage.instance.ref().child("Images").child();
  //}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Food Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClickedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          ClickedImage!,
                          fit: BoxFit.fill,
                        ))
                    : const Center(child: Text("No image selected")),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  TakeImage();
                },
                child: const Text("Upload Image"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: foodName,
                decoration: const InputDecoration(labelText: "Item Name"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: foodPrice,
                decoration: const InputDecoration(labelText: "Item Price"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: foodDetails,
                decoration: const InputDecoration(labelText: "Item Details"),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  AddItem();
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
