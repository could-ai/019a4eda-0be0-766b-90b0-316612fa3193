import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: !isDesktop
            ? IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              )
            : null,
        title: const Text(
          'Forensic Expo Organisation',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: isDesktop ? _navBarItems() : [],
      ),
      drawer: !isDesktop ? _buildDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildAboutSection(),
            _buildCallForPaperSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  List<Widget> _navBarItems() {
    return [
      _navBarItem('Home'),
      _navBarItem('About Us'),
      _navBarItem('Editorial Board'),
      _navBarItem('Call for Paper'),
      _navBarItem('Paper Submission'),
      _navBarItem('Review Process'),
      _navBarItem('FAQ'),
      _navBarItem('Contact Us'),
    ];
  }

  Widget _navBarItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Forensic Expo Organisation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ..._navBarItems().map((item) => ListTile(
                title: (item as Padding).child,
                onTap: () {
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      color: Colors.amber[100],
      child: Column(
        children: [
          const Text(
            'Welcome to Forensic Expo Organisation',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'An International Peer Reviewed, Open Access Journal',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text(
              'Submit Your Paper',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About The Journal',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Forensic Expo Organisation is a leading international journal for high-quality research in all fields of forensic science. We publish original research articles, review articles, and case studies that contribute to the advancement of knowledge in the field. Our mission is to provide a platform for researchers, practitioners, and students to share their work and to promote excellence in forensic science.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCallForPaperSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: Colors.grey[200],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Call for Papers - Volume X, Issue Y',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 16),
          Text(
            'We are now accepting submissions for the upcoming issue. We welcome high-quality manuscripts from all areas of forensic science.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text('Submission Deadline: DD-MM-YYYY'),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.blue[800],
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // This can be more complex with columns for links
              Text('Quick Links', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Contact Us', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Policies', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white54),
          const SizedBox(height: 20),
          const Text(
            '© 2024 Forensic Expo Organisation. All Rights Reserved.',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            'Contact: forensicexpo392@gmail.com',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
