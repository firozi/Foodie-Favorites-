import 'package:delicious_food/module/FoodCardModule.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../widgets/item_widget.dart';
final walletProvider=StateNotifierProvider<Wallet,int>((ref){
  return Wallet();
});

class Wallet extends StateNotifier<int>{
 Wallet():super(0);

 void addInwallet(int amount){
   state=state+amount;
 }

 void Subtract(int amount,context){
   if(state>amount){
     if(amount==0){
       ScaffoldMessenger.of(context).clearSnackBars();
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quantity can't be 0, wallet: ${state} ")));
       return;
     }
     state=state-amount;
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bought , left in wallet ${state} ")));
   }
   else{
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Insufficient balance ")));
   }
 }
  

}

final allFoodProvider=StateNotifierProvider<allFood,List<FoodCard>>((ref){
  return allFood();
});


class allFood extends StateNotifier<List<FoodCard>>{
  allFood():super([]);

  void addfFood(FoodCard food){
      state=[...state,food];
  }

}


final allFoodCartProvider=StateNotifierProvider<allFoodCart,List<FoodCard>>((ref){
  return allFoodCart();
});


class allFoodCart extends StateNotifier<List<FoodCard>>{
  allFoodCart():super([]);

  void addFood(FoodCard food, BuildContext context){
    bool alreadyExists = state.any((item) => item.ItemName == food.ItemName);
   if(alreadyExists){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already exit ")));
  return;
  }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("added to cart")));

    state=[...state,food];
  }
  void removeFood(FoodCard food) {
    state = state.where((item) => item != food).toList();
  }

}


