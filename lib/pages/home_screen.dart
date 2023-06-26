import 'package:flutter/material.dart';
import 'ayam_page.dart';
import 'profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eFarmery',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xFF3C4046),
            ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<IconData> _icons = [
    Icons.home,
    Icons.account_circle,
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: size.width > 600 ? 4 : 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CategoryCard(
                      title: "Ayam",
                      imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42cec2cb-dfb9-4ec0-8eb9-8ad9324e5cd0/dg0sc7w-60242cc4-ce0d-4967-ad32-e788adde2603.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQyY2VjMmNiLWRmYjktNGVjMC04ZWI5LThhZDkzMjRlNWNkMFwvZGcwc2M3dy02MDI0MmNjNC1jZTBkLTQ5NjctYWQzMi1lNzg4YWRkZTI2MDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.JRPBeJL1ZgTZJWkbFw_ds8BHDRlUxqtYh0bpCHwN2xE",
                      onPress: () => _onCategoryPressed(context, "Ayam"),
                    ),
                    CategoryCard(
                      title: "Sapi",
                      imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42cec2cb-dfb9-4ec0-8eb9-8ad9324e5cd0/dg0sc8j-c8191bf3-d2e9-4d16-9e10-9bc4e1a7e373.png/v1/fill/w_1280,h_1200/sapi_by_aiueotio7_dg0sc8j-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTIwMCIsInBhdGgiOiJcL2ZcLzQyY2VjMmNiLWRmYjktNGVjMC04ZWI5LThhZDkzMjRlNWNkMFwvZGcwc2M4ai1jODE5MWJmMy1kMmU5LTRkMTYtOWUxMC05YmM0ZTFhN2UzNzMucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.6swKSu5mBGfMJE-hpH7UbkpsoHP6yPMIP6IgiUtUVMo",
                      onPress: () => _onCategoryPressed(context, "Sapi"),
                    ),
                    CategoryCard(
                      title: "Lele",
                      imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42cec2cb-dfb9-4ec0-8eb9-8ad9324e5cd0/dg0sc8g-fe6b543b-25ad-411a-9b62-d1a3af894459.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQyY2VjMmNiLWRmYjktNGVjMC04ZWI5LThhZDkzMjRlNWNkMFwvZGcwc2M4Zy1mZTZiNTQzYi0yNWFkLTQxMWEtOWI2Mi1kMWEzYWY4OTQ0NTkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2bzODwpBaGYIxbPQuxnTbjAzzDMSYn9uodDlOOwQ3zI",
                      onPress: () => _onCategoryPressed(context, "Lele"),
                    ),
                    CategoryCard(
                      title: "Kambing",
                      imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42cec2cb-dfb9-4ec0-8eb9-8ad9324e5cd0/dg0sc7z-396cad93-2aa5-4b66-8fd7-e87eeb48aa4f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQyY2VjMmNiLWRmYjktNGVjMC04ZWI5LThhZDkzMjRlNWNkMFwvZGcwc2M3ei0zOTZjYWQ5My0yYWE1LTRiNjYtOGZkNy1lODdlZWI0OGFhNGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.IaLFERXvHbDwFm3lGfJBNaq-dyWUBS9bjP9yE8DESOM",
                      onPress: () => _onCategoryPressed(context, "Kambing"),
                    ),
                    CategoryCard(
                      title: "Domba",
                      imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42cec2cb-dfb9-4ec0-8eb9-8ad9324e5cd0/dg0sc35-4a61520a-6af3-4010-a4ef-c25a5efc0bd0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQyY2VjMmNiLWRmYjktNGVjMC04ZWI5LThhZDkzMjRlNWNkMFwvZGcwc2MzNS00YTYxNTIwYS02YWYzLTQwMTAtYTRlZi1jMjVhNWVmYzBiZDAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.9XrvuBrbK-Kk11UXAmcvDIM69vtgvGl2nHkeDzb-enQ",
                      onPress: () => _onCategoryPressed(context, "Domba"),
                    ),
                    CategoryCard(
                      title: "Burung",
                      imageUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42cec2cb-dfb9-4ec0-8eb9-8ad9324e5cd0/dg0sc33-cf518b96-f965-43d7-9838-292da491d092.png/v1/fill/w_1280,h_959/burung_by_aiueotio7_dg0sc33-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTU5IiwicGF0aCI6IlwvZlwvNDJjZWMyY2ItZGZiOS00ZWMwLThlYjktOGFkOTMyNGU1Y2QwXC9kZzBzYzMzLWNmNTE4Yjk2LWY5NjUtNDNkNy05ODM4LTI5MmRhNDkxZDA5Mi5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.MKCqvfV8uaQGvQVSVyMyyERH9_ve4-Vw593pF8vEfkQ",
                      onPress: () => _onCategoryPressed(context, "Burung"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons.map((icon) {
              return IconButton(
                icon: icon == Icons.home || icon == Icons.account_circle
                    ? Transform.scale(
                        scale: 1.7,
                        child: Icon(icon),
                      )
                    : Icon(icon), 
                onPressed: () => _onIconPressed(context, icon),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _onCategoryPressed(BuildContext context, String category) {
    // Perform the desired action when a category is pressed
    if (category == "Ayam") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AyamPage()),
      );
    }
    print('Category $category pressed');
  }

  void _onIconPressed(BuildContext context, IconData icon) {
    if (icon == Icons.home) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (icon == Icons.account_circle) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double imageSize;
  final VoidCallback onPress;

  const CategoryCard({
    required this.title,
    required this.imageUrl,
    this.imageSize = 100,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: Colors.black.withOpacity(0.16),
            ),
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 0,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: imageSize,
              height: imageSize,
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
