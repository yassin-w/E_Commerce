// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/product-provider.dart';
import '../../../utils/validator/validator.dart';
import '../../Home/home-page.dart';
import '../component/product-card.dart';

class UpdateProductDialog extends StatelessWidget {
  const UpdateProductDialog({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.name);
    TextEditingController PriceController =
        TextEditingController(text: widget.price.toString());
    TextEditingController quantityController =
        TextEditingController(text: widget.quantity.toString());
    TextEditingController imageController =
        TextEditingController(text: widget.image);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: AlertDialog(
          actions: [
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ElevatedButton(
              onPressed: () async {
                double price = double.parse(PriceController.text);
                int quantity = int.parse(quantityController.text);
                Provider.of<ProductProvider>(context, listen: false)
                    .updateProduct(widget.id, nameController.text.trim(), price,
                        quantity, imageController.text.trim());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "update",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
          title: Text('product information'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 109, 108, 108).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    validator: Validators.validateSimpleString,
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "product name * ",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 109, 108, 108).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    validator: Validators.validateNumeric,
                    controller: PriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "product price*",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 109, 108, 108).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    validator: Validators.validateNumeric,
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "quantity",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 109, 108, 108).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    validator: Validators.validateSimpleString,
                    controller: imageController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "image url*",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
