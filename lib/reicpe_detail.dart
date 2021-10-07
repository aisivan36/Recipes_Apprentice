import 'package:flutter/material.dart';
import 'package:hello_flutter/recipe.dart';

class RecipeDetail extends StatefulWidget {
  /// Defines Recipe Class here
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  /// Defines a State class
  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderVal here

  @override
  Widget build(BuildContext context) {
    /// [Scafold] defines the page's general structure.
    return Scaffold(
      appBar: AppBar(
        /// Passing title with recipe label to show it on the titile bar by each item
        title: Text(widget.recipe.label),
      ),

      /// In the [body] here is a [SafeArea], a [Column] with a [Container],
      /// a [SizedBox] and [Text] children.
      /// [SafeArea] keeps the app from getting too close to the operating system interface,
      /// such as the notch or the interactive area of most iPhones.
      body: SafeArea(
          child: Column(
        children: [
          /// [SizedBox] defines resizable bounds for the image.
          /// The height is fixed at 300 but the width will adjust to fit the aspect ratio,
          /// The unit of measurement in Flutter is [logical pixels]
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              /// To show the name of label on the appbar title by passing recipe
              image: AssetImage(widget.recipe.imageUrl),
            ),
          ),

          /// It's the spacer defines with [SizedBox]
          const SizedBox(
            height: 4,
          ),

          /// Label of text's recipe
          Text(
            widget.recipe.label,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),

          /// an [Expanded] widget expands to fill the space in a [Column]. This way,
          /// The ingredient list will take up space not filled by the other widgets.
          Expanded(
            /// a [ListView] with one row per ingredient.
            child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  //TODO: add ingredient.quantity
                  return Text(
                      '${ingredient.quantity} ${ingredient.measure} ${ingredient.name} ');
                }),
          ),

          // TODO: Add slider() here
        ],
      )),
    );
  }
}
