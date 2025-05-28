import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<String> favoriteRecipes = [
    'Creamy Carbonara',
    'Tom Yum Soup',
    'Avocado Toast',
    'Chicken Biryani',
  ];

  final List<String> recentRecipes = [
    'Pancakes',
    'Grilled Cheese',
    'Ramen Bowl',
  ];

  final List<String> savedRecipes = [
    'Lasagna',
    'Korean BBQ',
    'Veggie Stir Fry',
  ];

  final String recipeOfTheDay = 'Salmon Teriyaki';

  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry Pal'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed:
                () => Navigator.pushReplacementNamed(context, '/UserProfile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, Alysha!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Recipe of the Day'),
            _buildHighlightCard(recipeOfTheDay),
            const SizedBox(height: 20),
            _buildSectionTitle('Favorite Recipes'),
            _buildRecipeGrid(favoriteRecipes),
            const SizedBox(height: 20),
            _buildSectionTitle('Recently Cooked'),
            _buildHorizontalList(recentRecipes),
            const SizedBox(height: 20),
            _buildSectionTitle('Saved for Later'),
            _buildHorizontalList(savedRecipes),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildHighlightCard(String recipe) {
    return Card(
      color: Colors.orange.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.star, size: 30, color: Colors.orange),
            const SizedBox(width: 12),
            Text(
              recipe,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeGrid(List<String> recipes) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.green.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              recipes[index],
              style: const TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalList(List<String> recipes) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.yellow.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  recipes[index],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
