import 'package:flutter/material.dart';
import 'package:porter/pages/doc.dart';
import 'package:porter/pages/settings.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

var myrecipe = (Recipe()
  ..title = "Mermaid Water Cocktail"
  ..description = "A sweet and tropical blue-green cocktail with fruit juices and rum"
  ..previewImageUrl = "https://www.troprockin.com/wp-content/uploads/2020/02/mermaid-water-drink.jpg.webp"
  ..servingQuantity = 1
  ..categories = [CategoryTag.DRINK, CategoryTag.COCKTAIL]
  ..authors = ["Seth Moeckel <seth.moeckel@gmail.com>"]
  ..sourceCredits = "Tammy from TropRockin.com https://www.troprockin.com/recipes/mermaid-water-drink-recipe/"
  ..ingredients = [
    (RecipeComponent()
      ..name = "Spiced Rum"
      ..quantityOunces = 1.5
      ..previewImage = ""
      ..productLink = ""
    ),
    (RecipeComponent()
      ..name = "Coconut Rum"
      ..quantityOunces = 1.5
      ..previewImage = ""
      ..productLink = ""
    ),
    (RecipeComponent()
      ..name = "Blue Curacao"
      ..quantityOunces = 1.0
      ..previewImage = ""
      ..productLink = ""
    ),
    (RecipeComponent()
      ..name = "Pineapple Juice"
      ..quantityOunces = 6.0
      ..previewImage = ""
      ..productLink = ""
    ),
    (RecipeComponent()
      ..name = "Lime Juice"
      ..notes = "usually one large lime"
      ..quantityOunces = 1.0
      ..previewImage = ""
      ..productLink = ""
    ),
    (RecipeComponent()
      ..name = "Lime Wheels"
      ..notes = "for garnish"
      ..quantityOunces = 0
      ..optional = true
      ..previewImage = ""
      ..productLink = ""
    )
  ]
  ..steps = []
  ..notes = []
  ..prepTime = Duration(minutes: 5)
  ..cookTime = Duration(seconds: 0)
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: DocPage(recipe: myrecipe),
    );
  }
}
