import 'package:flutter/material.dart';

class HealthyFoodScreen extends StatefulWidget {
  const HealthyFoodScreen({Key? key}) : super(key: key);

  @override
  State<HealthyFoodScreen> createState() => _HealthyFoodScreenState();
}

class _HealthyFoodScreenState extends State<HealthyFoodScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<Map<String, dynamic>>> foodData = {
    'Breakfast': [
      {
        'image': 'assets/images/oatmeal.jpg',
        'title': 'Oatmeal',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/Smoothies.png',
        'title': 'Smoothies',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/fruit toast.jpg',
        'title': 'Fruit Toast',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/health pancake.jpg',
        'title': 'Health Pancake',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/granola bowl.jpg',
        'title': 'Granola Bowl',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/green juice.jpg',
        'title': 'Green Juice',
        'liked': false,
        'favorite': false
      },
    ],
    'Lunch': [
      {
        'image': 'assets/images/salad bowl.jpg',
        'title': 'Salad Bowl',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/grilled chicken.jpg',
        'title': 'Grilled Chicken',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/vegan wrap.jpg',
        'title': 'Vegan Wrap',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/quinoa salad.jpg',
        'title': 'Quinoa Salad',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/tuna sandwich.jpg',
        'title': 'Tuna Sandwich',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/pasta veggie.jpg',
        'title': 'Pasta Veggie',
        'liked': false,
        'favorite': false
      },
    ],
    'Dinner': [
      {
        'image': 'assets/images/steamed fish.jpeg',
        'title': 'Steamed Fish',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/viggie soup.jpg',
        'title': 'Veggie Soup',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/tofu stir fry.jpg',
        'title': 'Tofu Stir Fry',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/sushi roll.jpg',
        'title': 'Sushi Roll',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/salmon rice.jpg',
        'title': 'Salmon Rice',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/chicken soup.jpg',
        'title': 'Chicken Soup',
        'liked': false,
        'favorite': false
      },
    ],
    'Snack': [
      {
        'image': 'assets/images/fruit salad.jpg',
        'title': 'Fruit Salad',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/yogurt cup.jpg',
        'title': 'Yogurt Cup',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/nuts mix.jpg',
        'title': 'Nuts Mix',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/protein bar.jpg',
        'title': 'Protein Bar',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/energy ball.jpg',
        'title': 'Energy Ball',
        'liked': false,
        'favorite': false
      },
      {
        'image': 'assets/images/chia pudding.jpg',
        'title': 'Chia Pudding',
        'liked': false,
        'favorite': false
      },
    ],
  };

  bool showBanner = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: foodData.keys.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Food"),
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: foodData.keys.map((key) => Tab(text: key)).toList(),
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          if (showBanner)
            MaterialBanner(
              content: const Text(
                'Welcome! Try our healthy meals today!',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      showBanner = false;
                    });
                  },
                  child: const Text(
                    'DISMISS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: foodData.keys.map((category) {
                final items = foodData[category]!;

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final food = items[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                food['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              food['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(
                                  food['liked']
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      food['liked'] ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    food['liked'] = !food['liked'];
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        food['liked']
                                            ? 'Added to Favorite'
                                            : 'Removed from Favorite',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.share, color: Colors.grey),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Share'),
                                      content: Text(
                                          'Share ${food['title']} to your friends!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  food['favorite']
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: food['favorite']
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    food['favorite'] = !food['favorite'];
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        food['favorite']
                                            ? 'Saved to Bookmark'
                                            : 'Removed from Bookmark',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
