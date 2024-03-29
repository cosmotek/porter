import 'package:flutter/material.dart';

class RecipeComponent {
  String name;
  bool optional;
  String notes;

  double quantityOunces;
  String productLink;
  String previewImage;
}

class RecipeStep {
  int stepNum;
  String name;
  String description;
  String optional;
}

enum CategoryTag {
  COCKTAIL,
  DRINK,
  LUNCH,
  BRUNCH,
  DINNER,
  BREAKFAST,
  SNACK,
  POTLUCK,

  ASIAN,
  FRENCH,
  AMERICAN,
  LATIN,
  GREEK,
  CHINESE,
  THAI,
  VIETNAMESE,
  ITALIAN,
  MEXICAN,
  CAJUN
}

class Recipe {
  String title;
  String description;
  String previewImageUrl;

  int servingQuantity;
  List<CategoryTag> categories;
  List<String> authors;
  String sourceCredits;

  List<RecipeComponent> ingredients;
  List<RecipeStep> steps;
  List<String> notes;

  Duration prepTime;
  Duration cookTime;
}

Widget DocPage({ Recipe recipe }) {
  return Builder(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(5),
                    // margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/20),
                Text(
                  recipe.title,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Text(recipe.categories.map((a) => a.toString()).reduce((value, element) => value + ", " + element)),
            Text(recipe.title),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.timer),
                Text("prep time"),
                Text(recipe.prepTime.toString()),
                Icon(Icons.timer),
                Text("cook time"),
                Text(recipe.cookTime.toString()),
                Icon(Icons.people),
                Text("cook time"),
                Text(recipe.servingQuantity.toString()),
              ],
            ),
            Text(recipe.authors.toString()),
            SizedBox(height: 40),
            Text("Ingredients"),
            SizedBox(height: 40),
            Text("Instructions"),
          ],
        ),
      );
    },
  );
}