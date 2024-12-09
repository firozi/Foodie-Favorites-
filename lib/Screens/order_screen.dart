import 'package:delicious_food/Data/AllMeals.dart';
import 'package:delicious_food/module/FoodCardModule.dart';
import 'package:delicious_food/widgets/cartitem_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/item_widget.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  void itemRemove(FoodCard food){
    final remove = ref.watch(allFoodCartProvider.notifier);
    remove.removeFood(food);
  }
  @override
  Widget build(BuildContext context) {
    List Cart = ref.watch(allFoodCartProvider);

    Widget content = Center(
      child: Text("Empty Food Order"),
    );
    if (Cart.isNotEmpty) {
      content = SingleChildScrollView(
        child: Wrap(
          spacing: 16, // Horizontal spacing between items
          runSpacing: 16, // Vertical spacing between rows
          children: [
            for (int i = 0; i < Cart.length; i++)
              Container(
               margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CartitemWiget(
                      remove: itemRemove,
                            food:Cart[i],
                            Title: Cart[i].ItemName,
                            subTitle: Cart[i].ItemDetails,
                            Price: Cart[i].ItemPrice,
                            ImagePath: Cart[i].imagePath),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.shopping_cart_outlined),
      ),
      body: content,
    );
  }
}
