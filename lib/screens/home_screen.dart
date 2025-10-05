import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> restaurants = const [
    {
      "name": "Pizzaria do Zé",
      "category": "Pizza",
      "rating": 4.8,
      "image": "https://images.unsplash.com/photo-1594007654729-407eedc4be65",
    },
    {
      "name": "Burger House",
      "category": "Hambúrguer",
      "rating": 4.5,
      "image": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    },
    {
      "name": "Sushi Master",
      "category": "Japonês",
      "rating": 4.9,
      "image": "https://images.unsplash.com/photo-1553621042-f6e147245754",
    },
    {
      "name": "Taco Loco",
      "category": "Mexicano",
      "rating": 4.6,
      "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
    },
    {
      "name": "Bistro Francês",
      "category": "Francês",
      "rating": 4.4,
      "image": "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    },
    {
      "name": "Churrascaria Gaúcha",
      "category": "Churrasco",
      "rating": 4.8,
      "image": "https://images.unsplash.com/photo-1551183053-bf91a1d81141",
    },
    {
      "name": "Café Central",
      "category": "Café",
      "rating": 4.3,
      "image": "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
    },
    {
      "name": "Padaria do Bairro",
      "category": "Padaria",
      "rating": 4.6,
      "image": "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("iFood Fake"),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RestaurantScreen(
                      name: restaurant["name"],
                      category: restaurant["category"],
                      rating: restaurant["rating"],
                      image: restaurant["image"],
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.network(
                      restaurant["image"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(restaurant["name"]),
                      subtitle: Text(restaurant["category"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          Text(restaurant["rating"].toString()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RestaurantScreen extends StatelessWidget {
  final String name;
  final String category;
  final double rating;
  final String image;

  const RestaurantScreen({
    super.key,
    required this.name,
    required this.category,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "$name - $category (⭐ $rating)",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Pratos disponíveis:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: const Text("Pizza de Calabresa"),
                  subtitle: const Text("R\$ 30,00"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FeedbackScreen(
                          dishName: "Pizza de Calabresa",
                          feedbacks: const [
                            "Deliciosa! Melhor pizza que já comi.",
                            "Muito saborosa, mas poderia ter mais recheio.",
                            "Entrega rápida e pizza quentinha!",
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: const Text("Pizza de Queijo"),
                  subtitle: const Text("R\$ 28,00"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FeedbackScreen(
                          dishName: "Pizza de Queijo",
                          feedbacks: const [
                            "Queijo derretido na medida certa!",
                            "Muito boa, mas achei um pouco salgada.",
                            "Ótima opção para quem ama queijo.",
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  final String dishName;
  final List<String> feedbacks;

  const FeedbackScreen({
    super.key,
    required this.dishName,
    required this.feedbacks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedbacks - $dishName")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: feedbacks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                feedbacks[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
