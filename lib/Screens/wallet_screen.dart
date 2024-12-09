import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Data/AllMeals.dart';

class WalletScreen extends ConsumerStatefulWidget {
   WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  void displayDialog() {
    final Amount=TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add money"),
            content: TextField(
              controller: Amount,
              cursorColor: Colors.green,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                )
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                int money=int.parse(Amount.text.toString());
                final addSubwallet=ref.watch(walletProvider.notifier);
                addSubwallet.addInwallet(money);
                Navigator.of(context).pop();
              }, child:Text("Add money",style: TextStyle(color: Colors.green),))
            ],
          );
        });
  }




  @override
  Widget build(BuildContext context,) {
    final wallet=ref.watch(walletProvider);
    final addSubwallet=ref.watch(walletProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Material(
              elevation: 5,
              child: Center(
                child: Container(
                  child: Text(
                    "Wallet",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 100,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "\$${wallet.toString()}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Add money",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    addSubwallet.addInwallet(50);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "\$50",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addSubwallet.addInwallet(100);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "\$100",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addSubwallet.addInwallet(500);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "\$500",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addSubwallet.addInwallet(1000);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "\$1000",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                displayDialog();
              },
              child: Text(
                "Add money",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Less rounded corners
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *
                      0.8, // 80% of screen width
                  50, // Height of the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
