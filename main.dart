import 'package:flutter/material.dart';

void main() {
  runApp(const CookingProfileApp());
}

class CookingProfileApp extends StatelessWidget {
  const CookingProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Profile',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'serif',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w300,
          ),
          displayMedium: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w300,
          ),
          displaySmall: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w300,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w400,
          ),
          titleLarge: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontFamily: 'serif',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const CookingProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CookingProfilePage extends StatefulWidget {
  const CookingProfilePage({super.key});

  @override
  State<CookingProfilePage> createState() => _CookingProfilePageState();
}

class _CookingProfilePageState extends State<CookingProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  String _profileName = "Chef Isabella";
  String _profileEmail = "chef.isabella@cooking.com";
  String _profileBio =
      "Passionate home cook who loves experimenting with flavors and creating memorable dining experiences for family and friends.";
  int _selectedAvatarIndex = 0;
  bool _hasChanges = false;

  // Updated color scheme - lighter and cleaner
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF4CAF50);
  static const Color lightCream = Color(0xFFFFFEF7);
  static const Color cream = Color(0xFFFAF9F6);
  static const Color cardColor = Color(0xFFFFFFFF);

  // List of cooking-themed avatar icons
  final List<IconData> _avatarIcons = [
    Icons.restaurant,
    Icons.local_pizza,
    Icons.cake,
    Icons.coffee,
    Icons.restaurant_menu,
    Icons.kitchen,
  ];

  @override
  void initState() {
    super.initState();
    _nameController.text = _profileName;
    _emailController.text = _profileEmail;
    _bioController.text = _profileBio;
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _bioController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    setState(() {
      _hasChanges =
          _nameController.text != _profileName ||
          _emailController.text != _profileEmail ||
          _bioController.text != _profileBio;
    });
  }

  void _showAvatarPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cardColor,
          title: const Text(
            'Choose Your Chef Avatar',
            style: TextStyle(
              color: darkGreen,
              fontWeight: FontWeight.w500,
              fontFamily: 'serif',
              fontSize: 18,
              letterSpacing: 0.3,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _avatarIcons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatarIndex = index;
                      _hasChanges = true;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          index == _selectedAvatarIndex
                              ? lightGreen.withValues(alpha: 0.2)
                              : cream,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color:
                            index == _selectedAvatarIndex
                                ? darkGreen
                                : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      _avatarIcons[index],
                      size: 40,
                      color: darkGreen,
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: darkGreen,
                  fontFamily: 'serif',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _updateProfile() {
    setState(() {
      _profileName = _nameController.text;
      _profileEmail = _emailController.text;
      _profileBio = _bioController.text;
      _hasChanges = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Profile updated successfully! 🍳'),
        backgroundColor: darkGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _goBack() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cardColor,
          title: const Text(
            'Exit App?',
            style: TextStyle(
              color: darkGreen,
              fontWeight: FontWeight.w500,
              fontFamily: 'serif',
              fontSize: 18,
              letterSpacing: 0.3,
            ),
          ),
          content: const Text(
            'Are you sure you want to exit the cooking profile?',
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'serif',
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: darkGreen,
                  fontFamily: 'serif',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: darkGreen,
                foregroundColor: cardColor,
              ),
              child: const Text('Stay'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightCream,
      appBar: AppBar(
        backgroundColor: darkGreen,
        foregroundColor: cardColor,
        title: Text(
          'Hi ${_profileName.split(' ').first}',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24,
            fontFamily: 'serif',
            letterSpacing: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _goBack,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Cooking-themed header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.restaurant_menu, size: 45, color: darkGreen),
                  const SizedBox(height: 15),
                  Text(
                    'Hi ${_profileName.split(' ').first}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: darkGreen,
                      fontFamily: 'serif',
                      letterSpacing: 1.0,
                    ),
                  ),
                  const Text(
                    'Master your cooking journey',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'serif',
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Profile Picture Section
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: darkGreen, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: lightGreen,
                      child: Icon(
                        _avatarIcons[_selectedAvatarIndex],
                        size: 80,
                        color: cardColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: _showAvatarPicker,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: darkGreen,
                        shape: BoxShape.circle,
                        border: Border.all(color: cardColor, width: 2),
                      ),
                      child: const Icon(Icons.edit, color: cardColor, size: 20),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Name Input Section
            _buildInputCard(
              icon: Icons.person,
              title: 'Chef Name',
              controller: _nameController,
              hintText: 'Enter your chef name',
            ),

            const SizedBox(height: 20),

            // Email Input Section
            _buildInputCard(
              icon: Icons.email,
              title: 'Email',
              controller: _emailController,
              hintText: 'Enter your email address',
            ),

            const SizedBox(height: 20),

            // Bio Input Section
            _buildInputCard(
              icon: Icons.description,
              title: 'Bio',
              controller: _bioController,
              hintText: 'Tell us about your cooking passion...',
              maxLines: 4,
            ),

            const SizedBox(height: 40),

            // Update Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _hasChanges ? _updateProfile : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _hasChanges ? darkGreen : Colors.grey.shade400,
                  foregroundColor: cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: _hasChanges ? 3 : 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _hasChanges ? Icons.save : Icons.check_circle,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _hasChanges ? 'Update Profile' : 'No Changes',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'serif',
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required IconData icon,
    required String title,
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: darkGreen, size: 24),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: darkGreen,
                  fontFamily: 'serif',
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontFamily: 'serif',
            ),
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: lightCream,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: darkGreen, width: 2),
              ),
              prefixIcon: Icon(Icons.edit, color: darkGreen),
            ),
          ),
        ],
      ),
    );
  }
}
