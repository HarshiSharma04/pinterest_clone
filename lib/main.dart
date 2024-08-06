import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PinterestHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PinterestHomePage extends StatefulWidget {
  @override
  _PinterestHomePageState createState() => _PinterestHomePageState();
}

class _PinterestHomePageState extends State<PinterestHomePage> {
  int selectedIndex = 0;
  int _selectedBottomIndex = 0;

  List<String> categories = ['All', 'Art', 'Food', 'Travel', 'Fashion', 'Music'];
  List<String> imageUrls = [
    // Add your image URLs here
    'https://images.pexels.com/photos/12749678/pexels-photo-12749678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12749678/pexels-photo-12749678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/7336928/pexels-photo-7336928.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/27425117/pexels-photo-27425117/free-photo-of-i-cant-see.jpeg',
    'https://images.pexels.com/photos/27555579/pexels-photo-27555579/free-photo-of-a-woman-with-white-wings-is-sitting-on-the-rocks.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/22602394/pexels-photo-22602394/free-photo-of-lake-fields-and-village-in-countryside.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/17467392/pexels-photo-17467392/free-photo-of-a-sleeping-cat-wearing-a-knitted-hat.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/9583269/pexels-photo-9583269.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/20360857/pexels-photo-20360857/free-photo-of-cold-beverage-in-summer.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/27309231/pexels-photo-27309231/free-photo-of-sweet-encounter-bee-enjoying-sugar-crystals-in-itatiba-sp.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/26732874/pexels-photo-26732874/free-photo-of-a-couple-in-love-embrace-in-the-woods.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/27236797/pexels-photo-27236797/free-photo-of-a-woman-sitting-in-a-chair-in-front-of-a-chandelier.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/24017562/pexels-photo-24017562/free-photo-of-purple-blossoms-on-tree.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/27302823/pexels-photo-27302823/free-photo-of-blueberries-on-and-near-plate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/17410093/pexels-photo-17410093/free-photo-of-woman-lying-down-on-beach.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/27402086/pexels-photo-27402086/free-photo-of-a-large-fish-swimming-in-the-water.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18930654/pexels-photo-18930654/free-photo-of-smiling-girl-making-bubbles.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/27531362/pexels-photo-27531362/free-photo-of-sunflower-in-the-garden.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/11233815/pexels-photo-11233815.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    // More image URLs...
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onBottomNavigationTapped(int index) {
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      setState(() {
        _selectedBottomIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.map((category) {
            int index = categories.indexOf(category);
            return GestureDetector(
              onTap: () {
                onTabTapped(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedIndex == index ? Colors.black : Colors.grey,
                      fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (selectedIndex == index)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      height: 2,
                      width: 20,
                      color: Colors.black,
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrls[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomIndex,
        onTap: onBottomNavigationTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'), // Replace with profile image URL
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Pins',
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedTabIndex == 0 ? Colors.black : Colors.grey,
                          fontWeight: selectedTabIndex == 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      if (selectedTabIndex == 0)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Boards',
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedTabIndex == 1 ? Colors.black : Colors.grey,
                          fontWeight: selectedTabIndex == 1 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      if (selectedTabIndex == 1)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search your pins',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    PopupMenuButton<String>(
    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
    itemBuilder: (BuildContext context) => [
    PopupMenuItem<String>(
    value: 'sort_by',
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Sort by'),
    ListTile(
    title: Text('A to Z'),
    onTap: () {
    // Handle sorting A to Z
    Navigator.pop(context);
    },
    ),
    ListTile(
    title: Text('Reorder'),
    onTap: () {
    // Handle reordering
    Navigator.pop(context);
    },
    ),
    ListTile(
    title: Text('Last saved to'),
    onTap: () {
    // Handle last saved to
    Navigator.pop(context);
    },
    ),
    ListTile(
    title: Text('Newest'),
    onTap: () {
    // Handle newest
    Navigator.pop(context);
    },
    ),
    ListTile(
    title: Text('Oldest'),
    onTap: () {
    // Handle oldest
    Navigator.pop(context);
    },
    ),
    SizedBox(height: 10),
    Align(
    alignment: Alignment.centerRight,
    child: TextButton(
    onPressed: () {
    // Handle close action
    Navigator.pop(context);
    },
    child: Text('Close', style: TextStyle(color: Colors.grey)),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: 10, // Adjust based on your data
              itemBuilder: (context, index) {
                return BoardTile(
                  title: 'Art',
                  images: [
                    'https://images.pexels.com/photos/3246665/pexels-photo-3246665.png?auto=compress&cs=tinysrgb&w=600', // Replace with image URLs
                    //'https://images.pexels.com/photos/1646953/pexels-photo-1646953.jpeg?auto=compress&cs=tinysrgb&w=600',
                    'https://images.pexels.com/photos/1762851/pexels-photo-1762851.jpeg?auto=compress&cs=tinysrgb&w=600',
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Keep this index selected
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class BoardTile extends StatelessWidget {
  final String title;
  final List<String> images;

  BoardTile({required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: images.map((image) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
