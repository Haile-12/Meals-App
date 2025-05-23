import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Habesha Staples',
    color: Color.fromARGB(255, 184, 72, 32), // Warm, earthy
  ),
  Category(
    id: 'c2',
    title: 'Habesha Vegetarian Wots',
    color: Colors.lime, // Fresh greens/lentils
  ),
  Category(
    id: 'c3',
    title: 'Habesha Meat & Poultry',
    color: Colors.deepOrange, // Rich meat stews
  ),
  Category(
    id: 'c4',
    title: 'Habesha Raw & Sautéed', // For Kitfo, Gored Gored, Tibs
    color: Colors.redAccent,
  ),
  Category(
    id: 'c5',
    title: 'Habesha Sides & Vegetables', // For Gomen, Salata, Fasolia
    color: Color.fromARGB(255, 58, 181, 169),
  ),
  // International Cuisine
  Category(id: 'c6', title: 'Italian', color: Colors.purple),
  Category(id: 'c7', title: 'German', color: Colors.amber),
  Category(id: 'c8', title: 'Asian', color: Colors.lightGreen),
  Category(id: 'c9', title: 'French', color: Colors.pink),
  Category(
    id: 'c10',
    title: 'American Classics',
    color: Colors.orange,
  ), // Hamburgers
  // Meal Types & Dietary Considerations
  Category(id: 'c11', title: 'Quick & Easy', color: Colors.red),
  Category(
    id: 'c12',
    title: 'Light & Fresh',
    color: Colors.blue,
  ), // Salads, lighter dishes
  Category(
    id: 'c13',
    title: 'Desserts & Sweets',
    color: Colors.brown,
  ), // Mousse, Pancakes (as sweet dishes)
  Category(id: 'c14', title: 'Breakfast', color: Colors.lightBlue),
];

// --- Dummy Meals organized by new categories ---
const dummyMeals = [
  //
  Meal(
    id: 'h2',
    categories: [
      'c1',
      'c11', // Habesha Staples, Quick & Easy (as per your provided categories)
    ],
    title: 'Shiro Wot (Chickpea Stew)',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/shrowot.png',
    duration: 45,
    ingredients: [
      '1 cup Shiro Powder (spiced chickpea flour)',
      '2 Medium Red Onions (finely chopped)',
      '3 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '2-3 Tablespoons Oil (or Niter Kibbeh for richness)',
      '1-2 Tablespoons Berbere (optional, for spicier shiro)',
      '3-4 cups Water or Vegetable Broth',
      'Salt to taste',
      'Fresh Green Chili (optional, for garnish)',
    ],
    steps: [
      'Sauté chopped onions in oil (or niter kibbeh) in a pot over medium heat until very soft and translucent, about 8-10 minutes.',
      'Add minced garlic and grated ginger; cook for another 2-3 minutes until fragrant.',
      'If using, stir in Berbere and cook for 2 minutes, stirring.',
      'Gradually whisk in the Shiro powder (about 1/4 cup at a time) into the onion mixture, stirring constantly to avoid lumps, until a thick paste forms.',
      'Slowly add water or vegetable broth, about 1/2 cup at a time, whisking vigorously to incorporate and create a smooth, creamy consistency. Continue adding liquid until desired consistency is reached.',
      'Bring the mixture to a simmer, then reduce heat to low, cover, and cook for 15-20 minutes, stirring occasionally to prevent sticking, until the shiro thickens and flavors meld.',
      'Season with salt to taste. If too thick, add a little more hot water. Serve hot with Injera, garnished with fresh green chili if desired.',
    ],
    isGlutenFree:
        true, // Shiro powder is typically gluten-free (chickpeas/fava beans)
    isVegan: true, // If made with oil and no niter kibbeh
    isVegetarian: true,
    isLactoseFree: true, // If made with oil
    videoUrl: 'Assets/videos/shiro.mp4', // Example video URL
  ),
  Meal(
    id: 'h3',
    categories: [
      'c3', // Habesha Meat & Poultry (as per your provided categories)
    ],
    title: 'Tibs (Sautéed Beef/Lamb)',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/tibs.png',
    duration: 30,
    ingredients: [
      '500g Beef or Lamb (cubed or thinly sliced)',
      '2 Medium Red Onions (sliced)',
      '1-2 Bell Peppers (sliced, any color)',
      '3 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '2-3 Tablespoons Oil (or Niter Kibbeh)',
      '1-2 Tablespoons Berbere (optional, for spicy tibs)',
      'Fresh Rosemary (a few sprigs, optional but common)',
      'Salt and Black Pepper to taste',
      'A splash of Awaze (spicy berbere paste) or Mitmita (optional)',
    ],
    steps: [
      'Heat oil (or niter kibbeh) in a large pan or wok over medium-high heat until shimmering.',
      'Add beef or lamb cubes/slices and sear quickly on all sides until nicely browned. Do this in batches if necessary to avoid overcrowding. Remove meat and set aside.',
      'Add sliced onions to the same pan and sauté until softened and lightly caramelized, about 5-7 minutes.',
      'Add minced garlic and grated ginger; cook for another 3-5 minutes until vegetables are tender-crisp.',
      'Return the seared meat to the pan. If using, stir in Berbere and fresh rosemary.',
      'Cook for an additional 5-10 minutes, stirring constantly, until meat is cooked to your desired doneness and flavors are well combined. For softer meat, you can add a splash of water and cover briefly.',
      'Season generously with salt and black pepper to taste. For extra heat, mix in a little Awaze or sprinkle with Mitmita. Serve hot, often sizzling, with Injera.',
    ],
    isGlutenFree: true, // Meat and vegetables are naturally gluten-free
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false, // Niter Kibbeh contains clarified butter
    videoUrl: 'Assets/videos/shiro.mp4', // Example video URL
  ),
  Meal(
    id: 'h4',
    categories: [
      'c1', // Habesha Staples
    ],
    title: 'Misir Wot (Spicy Red Lentil Stew)',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/misr.png',
    duration: 60,
    ingredients: [
      '1 cup Red Lentils (rinsed)',
      '3 Medium Red Onions (finely chopped)',
      '1/4 cup Oil (or Niter Kibbeh)',
      '3 Tablespoons Berbere',
      '4 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '4 cups Water or Vegetable Broth',
      'Salt to taste',
    ],
    steps: [
      'Rinse red lentils thoroughly under cold water until water runs clear. Set aside.',
      'Finely chop onions and dry-sauté in a large pot until all moisture evaporates and they start to brown (about 15-20 minutes).',
      'Add oil (or niter kibbeh) and continue to sauté until onions are very soft and caramelized.',
      'Stir in Berbere and cook for 5-7 minutes, stirring constantly, adding a splash of water if sticking.',
      'Add minced garlic and grated ginger; cook for 2-3 minutes until fragrant.',
      'Add rinsed lentils and stir to coat. Pour in water or vegetable broth. Bring to a boil, then reduce heat to low.',
      'Cover and simmer for 30-40 minutes, stirring occasionally, until lentils are very tender and the stew has thickened to a creamy consistency. Add more water if it becomes too thick.',
      'Season with salt to taste. Serve hot with Injera.',
    ],
    isGlutenFree: true,
    isVegan: true, // If made with oil
    isVegetarian: true,
    isLactoseFree: true, // If made with oil
  ),
  Meal(
    id: 'h5',
    categories: [
      'c5', // Habesha Sides & Vegetables
      'c2', // Habesha Vegetarian Wots
    ],
    title: 'Gomen (Braised Collard Greens)',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/gomen.png',
    duration: 45,
    ingredients: [
      '1 kg Collard Greens (or kale), tough stems removed, chopped',
      '1 Large Red Onion (chopped)',
      '4 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '2-3 Tablespoons Oil (or Niter Kibbeh)',
      '1/2 teaspoon Turmeric Powder (optional)',
      '1/4 teaspoon Black Pepper',
      '1/2 cup Water or Vegetable Broth',
      'Salt to taste',
    ],
    steps: [
      'Thoroughly wash collard greens, remove tough stems, and chop into bite-sized pieces.',
      'Heat oil (or niter kibbeh) in a large pot or Dutch oven over medium heat.',
      'Add chopped onion and sauté until softened, about 5-7 minutes.',
      'Add minced garlic and grated ginger; cook for 2 minutes until fragrant.',
      'Add the chopped collard greens (they will fill the pot but cook down significantly). Stir to combine with aromatics.',
      'Add turmeric powder, black pepper, and water or broth. Bring to a simmer, then reduce heat to low.',
      'Cover and simmer for 30-40 minutes, or until greens are tender but still vibrant. Stir occasionally to prevent sticking.',
      'Season with salt to taste. Serve hot as a side dish or part of a Beyaynetu (vegetarian platter).',
    ],
    isGlutenFree: true,
    isVegan: true, // If made with oil
    isVegetarian: true,
    isLactoseFree: true, // If made with oil
  ),
  Meal(
    id: 'h6',
    categories: [
      'c4', // Habesha Raw & Sautéed
    ],
    title: 'Kitfo (Minced Raw Beef)',
    affordability: Affordability.luxurious, // Often a premium dish
    complexity:
        Complexity
            .simple, // Preparation is simple but requires quality ingredients
    imageUrl: 'Assets/images/kitfo.png',
    duration: 15,
    ingredients: [
      '500g Very Lean Beef (tenderloin or round, very fresh, minced)',
      '1/2 cup Niter Kibbeh (warmed, spiced clarified butter)',
      '2-3 Tablespoons Mitmita (Ethiopian Chili Powder Blend)',
      '1-2 Tablespoons Korerima (Ethiopian Cardamom, ground)',
      'Salt to taste',
      'Ayib (Ethiopian fresh cheese, optional)',
      'Gomen (braised collard greens, optional)',
    ],
    steps: [
      'Ensure beef is extremely fresh and has been minced (or finely chopped) just before preparation.',
      'In a bowl, combine the minced beef with warmed Niter Kibbeh, Mitmita, and ground Korerima.',
      'Mix thoroughly by hand until all ingredients are well combined and the meat is evenly coated. Adjust Mitmita and Korerima to your spice preference.',
      'Season with salt to taste. For "Leb Leb" (lightly cooked), you can briefly warm the mixture in a pan, stirring constantly for 1-2 minutes until just warmed through but still very rare.',
      'Serve immediately, typically with Injera, a side of Ayib (fresh cheese), and Gomen (collard greens).',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false, // Contains Niter Kibbeh and optionally Ayib
  ),
  Meal(
    id: 'h7',
    categories: [
      'c4', // Habesha Raw & Sautéed
      'c3', // Habesha Meat & Poultry
    ],
    title: 'Dullet (Spicy Tripe and Liver Stir-fry)',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging, // Cleaning tripe can be challenging
    imageUrl: 'Assets/images/dullet.png', // Placeholder
    duration: 60,
    ingredients: [
      '500g Lamb Tripe (cleaned and chopped)',
      '250g Lamb Liver (chopped)',
      '150g Lean Beef (minced, optional)',
      '2 Large Red Onions (chopped)',
      '1/4 cup Niter Kibbeh (Spiced Clarified Butter)',
      '3-4 Tablespoons Berbere (or Mitmita for more heat)',
      '4 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      'Fresh Green Chili (sliced, optional)',
      'Salt to taste',
    ],
    steps: [
      'Thoroughly clean and chop tripe. Boil tripe for 30-40 minutes until tender. Drain and chop finely. Chop liver and beef (if using) into small pieces.',
      'Heat Niter Kibbeh in a large pan or pot over medium heat. Add chopped onions and sauté until softened and translucent, about 5-7 minutes.',
      'Add minced garlic and grated ginger; cook for 3-5 minutes, stirring constantly, until fragrant and spices are toasted.',
      'Add the chopped tripe, liver, and minced beef (if using) to the pan. Stir well to combine with the spice mixture.',
      'Cook over medium-high heat, stirring frequently, until the meats are cooked through and slightly browned, about 15-20 minutes.',
      'Add sliced fresh green chili (if using) during the last few minutes of cooking.',
      'Season with salt to taste. Serve hot with Injera.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false, // Contains Niter Kibbeh
  ),
  Meal(
    id: 'h8',
    categories: [
      'c3', // Habesha Meat & Poultry
    ],
    title: 'Zilzil Tibs (Strip-Cut Beef Sauté)',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/zilzil_tibs.png', // Placeholder
    duration: 35,
    ingredients: [
      '600g Beef (sirloin or tenderloin), cut into long strips',
      '2 Medium Red Onions (sliced into strips)',
      '1 Bell Pepper (sliced, optional)',
      '3 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '3-4 Tablespoons Oil (or Niter Kibbeh)',
      '1-2 Tablespoons Awaze (spicy berbere paste) or Berbere powder',
      'Fresh Rosemary (a few sprigs, optional)',
      'Salt and Black Pepper to taste',
    ],
    steps: [
      'Season beef strips with salt and black pepper.',
      'Heat oil (or niter kibbeh) in a large pan or cast-iron skillet over medium-high heat until very hot.',
      'Add beef strips and sear quickly on all sides until browned and cooked to your preference (typically medium-rare to medium). Do not overcrowd the pan. Remove beef and set aside.',
      'Add sliced onions and bell pepper (if using) to the same pan. Sauté until softened and slightly caramelized, about 5-7 minutes.',
      'Add minced garlic and grated ginger; cook for 1 minute until fragrant.',
      'Return the seared beef to the pan. Stir in Awaze or Berbere powder, and fresh rosemary (if using).',
      'Toss everything together for 2-3 minutes to combine flavors. Do not overcook the beef.',
      'Serve hot, often sizzling in the pan it was cooked in, with Injera.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false, // Niter Kibbeh contains clarified butter
  ),
  Meal(
    id: 'h9',
    categories: [
      'c1', // Habesha Staples
    ],
    title: 'Ater Kik Alicha (Mild Split Pea Stew)',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/ater_kik_alicha.png', // Placeholder
    duration: 50,
    ingredients: [
      '1 cup Split Peas (yellow or green, rinsed)',
      '2 Medium Red Onions (finely chopped)',
      '2 Tablespoons Oil (or Niter Kibbeh)',
      '3 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '1/2 teaspoon Turmeric Powder',
      '3-4 cups Water or Vegetable Broth',
      'Salt to taste',
      'Fresh Green Chili (optional)',
    ],
    steps: [
      'Rinse split peas thoroughly until water runs clear. Soak for 30 minutes if desired (optional, reduces cooking time slightly).',
      'Heat oil (or niter kibbeh) in a pot over medium heat. Add finely chopped onions and sauté until very soft and translucent, about 8-10 minutes.',
      'Add minced garlic and grated ginger; cook for 2 minutes until fragrant.',
      'Stir in turmeric powder and cook for 1 minute.',
      'Add rinsed split peas and water or vegetable broth. Bring to a boil, then reduce heat to low.',
      'Cover and simmer for 30-40 minutes, stirring occasionally, until peas are very tender and have broken down to a creamy consistency. Add more water if needed.',
      'Season with salt to taste. If desired, add a sliced fresh green chili for mild heat. Serve hot with Injera.',
    ],
    isGlutenFree: true,
    isVegan: true, // If made with oil
    isVegetarian: true,
    isLactoseFree: true, // If made with oil
  ),
  Meal(
    id: 'h10',
    categories: [
      'c5', // Habesha Sides & Vegetables
      'c2', // Habesha Vegetarian Wots
    ],
    title: 'Fasolia (Green Bean and Carrot Stir-fry)',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/fasoila.png', // Placeholder
    duration: 35,
    ingredients: [
      '500g Green Beans (trimmed, cut into 1-inch pieces)',
      '3-4 Carrots (peeled, sliced into rounds or matchsticks)',
      '1 Large Red Onion (chopped)',
      '3 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '2 Tablespoons Oil (or Niter Kibbeh)',
      '1/2 teaspoon Turmeric Powder',
      'Salt and Black Pepper to taste',
      '1/4 cup Water (optional, for steaming)',
    ],
    steps: [
      'Heat oil (or niter kibbeh) in a large skillet or wok over medium heat.',
      'Add chopped onion and sauté until softened and translucent, about 5-7 minutes.',
      'Add minced garlic and grated ginger; cook for 2 minutes until fragrant.',
      'Stir in turmeric powder. Add the green beans and carrots to the pan.',
      'Stir well to combine all ingredients. If desired, add 1/4 cup of water and cover the pan to steam the vegetables for 5-7 minutes until tender-crisp. Alternatively, continue to stir-fry uncovered until tender-crisp.',
      'Season with salt and black pepper to taste. Cook until vegetables are tender but still retain some bite and vibrant color.',
      'Serve hot as a mild side dish, often part of a Beyaynetu.',
    ],
    isGlutenFree: true,
    isVegan: true, // If made with oil
    isVegetarian: true,
    isLactoseFree: true, // If made with oil
  ),
  Meal(
    id: 'h11',
    categories: [
      'c2', // Habesha Vegetarian Wots
      'c5', // Habesha Sides & Vegetables
    ],
    title: 'Dinich Wot (Potato and Carrot Stew)',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/dinich_wot.png', // Placeholder
    duration: 40,
    ingredients: [
      '3 Medium Potatoes (peeled, cubed)',
      '2 Medium Carrots (peeled, sliced)',
      '1 Large Red Onion (chopped)',
      '2 Tablespoons Oil (or Niter Kibbeh)',
      '3 cloves Garlic (minced)',
      '1-inch Ginger (grated)',
      '1-2 Tablespoons Alicha Kimem (mild Ethiopian spice mix) or Turmeric/Cumin',
      '2 cups Water or Vegetable Broth',
      'Salt and Black Pepper to taste',
    ],
    steps: [
      'Heat oil (or niter kibbeh) in a pot over medium heat. Add chopped onion and sauté until very soft and translucent, about 8-10 minutes.',
      'Add minced garlic and grated ginger; cook for 2 minutes until fragrant.',
      'Stir in Alicha Kimem (or turmeric and cumin) and cook for 1 minute.',
      'Add cubed potatoes and sliced carrots to the pot. Stir well to coat with the spices and aromatics.',
      'Pour in water or vegetable broth. Bring to a boil, then reduce heat to low.',
      'Cover and simmer for 20-30 minutes, or until potatoes and carrots are tender. Stir occasionally to prevent sticking.',
      'Season with salt to taste. Serve warm with Injera.',
    ],
    isGlutenFree: true,
    isVegan: true, // If made with oil
    isVegetarian: true,
    isLactoseFree: true, // If made with oil
  ),

  // --- International Cuisine ---
  Meal(
    id: 'm1',
    categories: ['c6', 'c11'], // Italian, Quick & Easy
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/spahageti.png',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)',
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/dash-and-chums.mp4', // Example video URL
  ),
  Meal(
    id: 'm2',
    categories: ['c11'], // Quick & Easy (Toast Hawaii is quick to make)
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/twohast.png',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter',
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: ['c10', 'c11'], // American Classics, Quick & Easy
    title: 'Classic Hamburger',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/burgur.png',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns',
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: ['c7'], // German
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl: 'Assets/images/wiener.png',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices',
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: ['c12'], // Light & Fresh
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/salad.png',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper',
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: ['c13'], // Desserts & Sweets
    title: 'Delicious Orange Mousse',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'Assets/images/orange.png',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: ['c13', 'c14'], // Desserts & Sweets, Breakfast
    title: 'Pancakes',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'Assets/images/pankrase.png',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.',
    ],
    isGlutenFree: false, // Pancakes typically contain gluten from flour
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: ['c8'], // Asian
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'Assets/images/chikenkurry.png',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: ['c9', 'c13'], // French, Desserts & Sweets
    title: 'Chocolate Souffle',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'Assets/images/chokolata.png',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'Whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
    ],
    isGlutenFree: false, // Contains all-purpose flour
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false, // Contains butter, milk
  ),
];
