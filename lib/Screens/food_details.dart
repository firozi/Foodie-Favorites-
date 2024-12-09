import 'package:delicious_food/Data/AllMeals.dart';
import 'package:delicious_food/module/FoodCardModule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//FOOD DETAILS SCREEN
class FoodDetails extends ConsumerStatefulWidget {
  FoodDetails({Key? key, required this.food}) : super(key: key);
  FoodCard food;

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends ConsumerState<FoodDetails> {
  int total = 0;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final add = ref.read(allFoodCartProvider.notifier);
    final subtract = ref.watch(walletProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food details"),
      ),
      body: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                widget.food.imagePath,
                height: 400,
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Price \$${widget.food.ItemPrice}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "${widget.food.ItemName}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    if (total == 0) {
                      total = 0;
                      return;
                    }
                    total = total - 1;
                    totalPrice = totalPrice - int.parse(widget.food.ItemPrice);
                    setState(() {});
                  },
                  icon: const Icon(Icons.minimize)),
              Text("Quantity: ${total}"),
              IconButton(
                  onPressed: () {
                    if (total < 0) {
                      total = 0;
                      return;
                    }
                    total = total + 1;
                    totalPrice = totalPrice + int.parse(widget.food.ItemPrice);
                    setState(() {});
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          Text(
            "Total : \$${totalPrice}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          TextButton(
              onPressed: () {
                subtract.Subtract(totalPrice, context);
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87),
                  child: const Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ))),
          GestureDetector(
              onTap: () {
                add.addFood(widget.food, context);

              },
              child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )))),
        ],
      ),
    );
  }
}
