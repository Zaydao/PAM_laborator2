import 'package:flutter/material.dart';

void main() {
  runApp(WineApp());
}

class WineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WineHomePage(),
    );
  }
}

class WineHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildSearchBar(),
              _buildShopWinesBy(),
              _buildWineTypeGrid(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('view all', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                children: [
                  _buildWineCard(
                    'Ocone Bozzovich Beneventano Bianco IGT',
                    'Red wine (Green and Flinty)',
                    'From Champagne Blanc...',
                    '₹ 23,256,596',
                    'Available',
                    Colors.red[100]!,
                    false,
                    94,
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT72ubhWhe0Gowjkj9e3NeczWPwxiAGw50PTQ&s', // URL imagine vin
                  ),
                  _buildWineCard(
                    '2021 Petit Chablis - Passy Le Clou',
                    'White wine (Green and Flinty)',
                    'From Champagne Blanc...',
                    '₹ 23,256,596',
                    'Available',
                    Colors.green[100]!,
                    false,
                    94,
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrORRabUAk5NhqpdkERyVdDK-oqlfbHGheA&s', // URL imagine vin
                  ),
                  _buildWineCard(
                    'Philippe Fontaine Champagne Brut Rosé',
                    'Sparkling wine (Green and Flinty)',
                    'From Champagne Blanc...',
                    '₹ 23,256,596',
                    'Unavailable',
                    Colors.orange[100]!,
                    true,
                    94,
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5kJQGPC24RwC2VbKyMwheTh-T8qSLsc4UzQ&s', // URL imagine vin
                  ),
                  _buildWineCard(
                    '2021 Cicada\'s Song Rosé',
                    'Rose wine (Green and Flinty)',
                    'From Champagne Blanc...',
                    '₹ 23,256,596',
                    'Available',
                    Colors.blue[100]!,
                    false,
                    94,
                    'https://southern-napa-fine-wine-house.myshopify.com/cdn/shop/products/grassroots-wine-cicada-s-song-rose-28023400202303_600x.png?v=1616451553', // URL imagine vin
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey),
              SizedBox(width: 8),
              Text('Donnerville Drive ▼', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Stack(
            children: [
              Icon(Icons.notifications_outlined, size: 30),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(minWidth: 14, minHeight: 14),
                  child: Text(
                    '12',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildShopWinesBy() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shop wines by', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              _buildFilterChip('Type', isSelected: true),
              SizedBox(width: 8),
              _buildFilterChip('Style'),
              SizedBox(width: 8),
              _buildFilterChip('Countries'),
              SizedBox(width: 8),
              _buildFilterChip('Grape'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Chip(
      label: Text(label),
      backgroundColor: isSelected ? Colors.red[100] : Colors.grey[200],
      labelStyle: TextStyle(color: isSelected ? Colors.red : Colors.black),
    );
  }

  Widget _buildWineTypeGrid() {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildWineTypeCard(
            'Red wines',
            '123',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE2SVNhkAliucaRic92dcV9aiaXtv7-C1Gyg&s'
            ),
          _buildWineTypeCard(
            'White wines',
            '123',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfhmf7dud6Cp0B2qXhXlHbqjiNLV1Ptdd9mQ&s', // Exemplu URL imagine
          ),
          _buildWineTypeCard(
            'Sparkling wines',
            '123',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvFBIXtUrldXbmu0klIlMWMBr9_LrQvOLetA&s', // Exemplu URL imagine
          ),
          _buildWineTypeCard(
            'Rosé wines',
            '123',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRif2vZDkw0QjikZmCzPOGvDDBPZ4p_wl4lIg&s', // Exemplu URL imagine
          ),
        ],
      ),
    );
  }

  Widget _buildWineTypeCard(String title, String count, String imageUrl) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover, // Imaginea ocupă întregul card
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                count,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54, // Fundal semitransparent pentru text
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWineCard(String title, String type, String origin, String price, String availability, Color color, bool isAdded, int score, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Transform.scale(
                  scale: 1, // Factorul de scalare (0.8 = 80% din dimensiunea originală)
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover, // Imaginea ocupă întregul card
                ),
              ),
            ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(availability, style: TextStyle(color: availability == 'Available' ? Colors.green : Colors.red)),
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(type, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(origin),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(isAdded ? Icons.favorite : Icons.favorite_border, color: color),
                        onPressed: () {
                          // Acțiunea la apăsarea butonului de favorite
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(score.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
