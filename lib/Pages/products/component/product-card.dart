// ignore_for_file: must_be_immutable, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../provider/product-provider.dart';
import '../../Home/home-page.dart';
import '../dialogs/UpdateProductDialog.dart';

class ProductCard extends StatefulWidget {
  int id;
  String name;
  double price;
  int quantity;
  String image;

  ProductCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.image})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomCardComp();
}

class _CustomCardComp extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool validURL = Uri.parse(widget.image).isAbsolute;

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return UpdateProductDialog(widget: widget);
            });
      },
      child: Card(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  widget.name,
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                subtitle: Text(
                  ' \$ ${widget.price}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                            ),
                            ElevatedButton(
                              child: Text("delete"),
                              onPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .deleteProduct(widget.id);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                            )
                          ],
                          title: SvgPicture.asset(
                            "assets/icons/warning.svg",
                            height: 50,
                            color: Colors.redAccent,
                          ),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              children: const [
                                Text(
                                  'Are you sure?',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    'Do you really want to delete these records? This process cannot be undone.')
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              (validURL)
                  ? SizedBox(
                      height: 150.0,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(
                      height: 150.0,
                      child: FlutterLogo(curve: Curves.elasticIn),
                    ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    child: const Text('add to cart'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                  TextButton(
                    child: const Text('LEARN MORE'),
                    onPressed: () {
                      /* ... */
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
