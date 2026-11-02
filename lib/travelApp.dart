
import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Explorer',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const TravelHome(),
    );
  }
}

class Destination {
  final String name;
  final String country;
  final String image;
  final String price;
  final String description;
  final double rating;

  const Destination({
    required this.name,
    required this.country,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
  });
}

const destinations = [
  Destination(
    name: 'Bali',
    country: 'Indonesia',
    image:
        'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
    price: '₹25,000',
    rating: 4.9,
    description:
        'Discover beautiful beaches, tropical forests, '
        'ancient temples and unforgettable sunsets in Bali.',
  ),
  Destination(
    name: 'Manali',
    country: 'India',
    image:
        'https://images.unsplash.com/photo-1626621341517-bbf3d9990a23?w=800',
    price: '₹12,000',
    rating: 4.8,
    description:
        'Enjoy snow-covered mountains, scenic valleys, '
        'adventure activities and peaceful hill stations.',
  ),
  Destination(
    name: 'Paris',
    country: 'France',
    image:
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
    price: '₹65,000',
    rating: 4.7,
    description:
        'Explore the Eiffel Tower, beautiful streets, '
        'cafes and the artistic charm of Paris.',
  ),
  Destination(
    name: 'Maldives',
    country: 'Maldives',
    image:
        'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
    price: '₹40,000',
    rating: 4.9,
    description:
        'Relax in crystal-clear waters, white sand beaches '
        'and luxurious tropical island resorts.',
  ),
];

class TravelHome extends StatefulWidget {
  const TravelHome({super.key});

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  int selectedIndex = 0;
  String searchText = '';
  final Set<String> favorites = {};

  List<Destination> get filteredDestinations {
    if (selectedIndex == 2) {
      return destinations
          .where((d) => favorites.contains(d.name))
          .toList();
    }

    return destinations.where((d) {
      return d.name.toLowerCase().contains(
            searchText.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isFavorites = selectedIndex == 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Travel Explorer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                  title: Text('My Profile'),
                  content: Text('Welcome, Traveler!'),
                ),
              );
            },
          ),
        ],
      ),
      body: selectedIndex == 1
          ? const Center(
              child: Text(
                'Explore beautiful destinations!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Discover the World 🌍',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Find your next unforgettable journey.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search destinations...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        isFavorites
                            ? 'Your Favorites'
                            : 'Popular Destinations',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: filteredDestinations.isEmpty
                      ? const Center(
                          child: Text('No destinations found'),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          itemCount: filteredDestinations.length,
                          itemBuilder: (context, index) {
                            final destination =
                                filteredDestinations[index];

                            return DestinationCard(
                              destination: destination,
                              isFavorite:
                                  favorites.contains(destination.name),
                              onFavorite: () {
                                setState(() {
                                  if (favorites
                                      .contains(destination.name)) {
                                    favorites.remove(destination.name);
                                  } else {
                                    favorites.add(destination.name);
                                  }
                                });
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DestinationDetails(
                                      destination: destination,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  destination.image,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 190,
                    color: Colors.teal.shade100,
                    child: const Icon(
                      Icons.landscape,
                      size: 60,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: onFavorite,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '⭐ ${destination.rating}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          destination.country,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        destination.price,
                        style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'per person',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationDetails extends StatelessWidget {
  final Destination destination;

  const DestinationDetails({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(destination.name),
              background: Image.network(
                destination.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const ColoredBox(color: Colors.teal),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.country,
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    destination.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Starting from ${destination.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Your trip selection is confirmed!',
                            ),
                          ),
                        );
                      },
                      child: const Text('Book Your Trip'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}