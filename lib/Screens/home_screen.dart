import 'package:delicious_food/Screens/food_details.dart';
import 'package:delicious_food/module/FoodCardModule.dart';
import 'package:delicious_food/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/AllMeals.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key, required this.name});

  final String name;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {


  @override
  Widget build(BuildContext context,) {
    Widget content = Text("No item Here,add item through admin panel");
    List AllFood = ref.watch(allFoodProvider);
    if (AllFood.isNotEmpty) {
      content = Container(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AllFood.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FoodDetails(
                             food: AllFood[index])));
                  },
                  child: ItemWidget(
                    ImagePath: AllFood[index].imagePath,
                    Title: AllFood[index].ItemName,
                    subTitle: AllFood[index].ItemDetails,
                    Price: AllFood[index].ItemPrice,
                  ));
            }),
      );
    }
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: widget.name == null
                      ? Text("Unknown")
                      : Text(
                          "Hello ${widget.name},",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Delicious food",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(
              "Discover and Get Great Food",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            showItem(),
            const SizedBox(
              height: 20,
            ),
            content,
            const SizedBox(
              height: 70,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Row(
                  children: [
                    Image.asset(
                      "images/salad2.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Text(
                            "Mediterranean Chicken Salad",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const Text(
                          "\$25",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "images/ice-cream.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: Colors.black,
            ),
          ),
        ),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "images/salad.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color:  Colors.black,
            ),
          ),
        ),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "images/burger.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color:  Colors.black,
            ),
          ),
        ),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "images/pizza.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color:  Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
