
import 'package:flutter/material.dart';

void main() => runApp(const RoutiyaApp());

class RoutiyaApp extends StatelessWidget {
  const RoutiyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routiya Jeevan Saathi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9B3155)),
        scaffoldBackgroundColor: const Color(0xFFFFFAF7),
        useMaterial3: true,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  final pages = const [HomePage(), SearchPage(), MatchesPage(), ChatPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Matches'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(children: [
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Namaste 👋', style: TextStyle(fontSize: 15, color: Colors.black54)),
            SizedBox(height: 4),
            Text('Routiya Jeevan Saathi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ])),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ]),
        const SizedBox(height: 18),
        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(children: [
              const CircleAvatar(radius: 30, child: Icon(Icons.person, size: 34)),
              const SizedBox(width: 14),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Complete your profile', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Add photo and preferences to get better matches.'),
              ])),
              FilledButton(onPressed: () {}, child: const Text('Edit')),
            ]),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Recommended for you', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const ProfileCard(name: 'Anita', age: 27, city: 'Rourkela', education: 'Graduate'),
        const ProfileCard(name: 'Pooja', age: 25, city: 'Raipur', education: 'Teacher'),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name, city, education;
  final int age;
  const ProfileCard({super.key, required this.name, required this.age, required this.city, required this.education});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          Container(
            width: 86, height: 100,
            decoration: BoxDecoration(color: const Color(0xFFF2D9E1), borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.person, size: 52, color: Color(0xFF9B3155)),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$name, $age', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('$education • $city'),
            const SizedBox(height: 10),
            Row(children: [
              OutlinedButton(onPressed: () {}, child: const Text('View')),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            ])
          ]))
        ]),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text('Find your match', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Search within the Routiya community'),
      const SizedBox(height: 20),
      const TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search by city or profession', border: OutlineInputBorder())),
      const SizedBox(height: 16),
      Wrap(spacing: 8, runSpacing: 8, children: ['Age 24–30', 'Nearby', 'Education', 'Profession'].map((x) => FilterChip(label: Text(x), onSelected: (_) {})).toList()),
      const SizedBox(height: 24),
      const ProfileCard(name: 'Sunita', age: 26, city: 'Bhubaneswar', education: 'B.Com'),
      const ProfileCard(name: 'Kiran', age: 29, city: 'Bilaspur', education: 'Engineer'),
    ],
  );
}

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text('Your Matches ❤️', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('People who may be a good match for you'),
      const SizedBox(height: 20),
      const ProfileCard(name: 'Neha', age: 27, city: 'Rourkela', education: 'M.A.'),
      const ProfileCard(name: 'Kavita', age: 28, city: 'Raipur', education: 'Nurse'),
    ],
  );
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text('Messages', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 20),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: const Text('Neha'),
        subtitle: const Text('Hello! Nice to connect with you.'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: const Text('Anita'),
        subtitle: const Text('Thanks for your interest.'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    ],
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Center(child: CircleAvatar(radius: 50, child: Icon(Icons.person, size: 54))),
      const SizedBox(height: 12),
      const Center(child: Text('My Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      const SizedBox(height: 22),
      Card(child: Column(children: [
        ListTile(leading: const Icon(Icons.edit), title: const Text('Edit profile'), onTap: () {}),
        ListTile(leading: const Icon(Icons.language), title: const Text('Language'), subtitle: const Text('Hindi • Odia • Chhattisgarhi • English'), onTap: () {}),
        ListTile(leading: const Icon(Icons.verified_user_outlined), title: const Text('Profile verification'), subtitle: const Text('Complete verification'), onTap: () {}),
        ListTile(leading: const Icon(Icons.workspace_premium_outlined), title: const Text('Premium membership'), subtitle: const Text('View plans'), onTap: () {}),
        ListTile(leading: const Icon(Icons.lock_outline), title: const Text('Privacy & Safety'), onTap: () {}),
      ])),
    ],
  );
}
