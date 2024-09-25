import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String recipe;

  DetailsScreen({required this.recipe});

  final Map<String, Map<String, dynamic>> recipeDetails = {
    "Chipotle Steak": {
      "description": "Steak inspired by Chipotle Mexican Grill. (From: Culinaryhill.com)",
      "image": "https://www.culinaryhill.com/wp-content/uploads/2022/03/Chipotle-Steak-Copycat-Culinary-Hill-LR-08.jpg",
      "ingredients": [
        "2lb steak (ribeye or sirloin)",
        "6 cloves garlic",
        "2 tablespoons adobo sauce",
        "1 tablespoon ancho chile powder",
        "2 tablespoons ground cumin",
        "1 teaspoon dried oregano",
        "1 teaspoon kosher salt",
        "1 teaspoon black pepper",
        "1/4 cup olive oil"
        
      ],
      "instructions": [
        "1. Blend garlic, adobo, ancho chile powder, olive oil, cumin, oregano, salt, and pepper.",
        "2. Marinate steak for at least 30 minutes.",
        "3. Sear steak in a hot pan to desired doneness.",
        "4. Let rest, chop into pieces, and serve."
     ]
    },
    "Chipotle White Rice": {
      "description": "White Rice inspired by Chipotle Mexican Grill (From: Culinaryhill.com)",
      "image": "https://www.culinaryhill.com/wp-content/uploads/2022/10/Chipotle-Cilantro-Lime-Rice-Culinary-Hill-LR-10-1365x2048.jpg",
      "ingredients": [
        "2 cups basmati rice",
        "1 bay leaf",
        "2 teaspoons salt",
        "1 teaspoon olive oil (optional)",
        "2 tablespoons fresh cilantro, minced",
        "2 tablespoons fresh lime juice",
        "2 tablespoons fresh lemon juice"
      ],
      "instructions": [
        "1. Boil 8 cups of water, add rice, bay leaf, salt, and oil.",
        "2. Boil for 10-12 minutes, drain and rinse the rice.",
        "3. Stir in cilantro, lime juice, and lemon juice. Season with additional salt as needed."
      ]
    },
    "Chipotle Chicken": {
      "description": "Chicken inspired by Chipotle Mexican Grill. (From: Culinaryhill.com)",
      "image": "https://www.fromvalerieskitchen.com/wordpress/wp-content/uploads/2023/07/Chipotle-Chicken-Copycat-Recipe-13.jpg",
      "ingredients": [
        "1/2 medium red onion, coarsely chopped",
        "3 cloves garlic",
        "2 tablespoons adobo sauce",
        "2 tablespoons ancho chile powder",
        "2 tablespoons olive oil",
        "2 teaspoons ground cumin",
        "2 teaspoons dried oregano",
        "Salt and pepper",
        "4 pounds boneless, skinless chicken"
      ],
      "instructions": [
        "1. Blend all marinade ingredients until smooth.",
        "2. Marinate chicken for at least 30 minutes.",
        "3. Cook the chicken on a grill, skillet, or bake in the oven until done.",
        "4. Let rest, chop, and serve."
      ]
    },
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final recipeInfo = recipeDetails[recipe];

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipeInfo != null && recipeInfo["image"] != null) 
                Image.network(
                  recipeInfo["image"]!, 
                  height: 200, 
                  width: double.infinity,
                  fit: BoxFit.cover, 
                  errorBuilder: (context, error, stackTrace) {
                    return Text('Image failed to load.'); 
                  },
                ),
              SizedBox(height: 16.0),
              Text(
                recipeInfo != null ? recipeInfo["description"] ?? "No details available." : "Recipe not found.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              if (recipeInfo != null && recipeInfo["ingredients"] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients:",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    for (var ingredient in recipeInfo["ingredients"] as List<String>)
                      Text("- $ingredient", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              SizedBox(height: 20.0),
              if (recipeInfo != null && recipeInfo["instructions"] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Instructions:",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    for (var step in recipeInfo["instructions"] as List<String>)
                      Text("• $step", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
