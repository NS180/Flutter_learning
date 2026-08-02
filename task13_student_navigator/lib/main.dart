import 'package:flutter/material.dart';

void main() {
  runApp(const StudentNavigatorApp());
}

class StudentNavigatorApp extends StatelessWidget {
  const StudentNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Information Navigator',
      // Defined Named Routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/editCourse': (context) => const EditCourseScreen(),
      },
    );
  }
}

// =============================================================================
// 1. HOME SCREEN (Enter Student Details)
// =============================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Pankaj Kapoor');
  final TextEditingController _rollController =
      TextEditingController(text: '101');
  String _selectedCourse = 'Flutter';
  String? _updatedCourseFromReturn;

  final List<String> _courses = ['Flutter', 'Java', 'Python', 'AI'];

  void _navigateToDetails() async {
    // Navigator.push - Passing data forward to StudentDetailsScreen
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailsScreen(
          name: _nameController.text,
          rollNo: _rollController.text,
          course: _selectedCourse,
        ),
      ),
    );

    // If a modified course is returned when popping back, update state
    if (result != null && result is String) {
      setState(() {
        _updatedCourseFromReturn = result;
        _selectedCourse = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E56A0),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Student Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Graduation Cap Graphic
            Center(
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/2997/2997321.png',
                height: 110,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.school, size: 90, color: Color(0xFF1E56A0)),
              ),
            ),
            const SizedBox(height: 20),

            // Form Container Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Student Name Field
                  const Text('Student Name',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Roll Number Field
                  const Text('Roll Number',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _rollController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Select Course Dropdown
                  const Text('Select Course',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    value: _selectedCourse,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: _courses.map((String course) {
                      return DropdownMenuItem<String>(
                        value: course,
                        child: Text(course),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedCourse = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // View Details Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _navigateToDetails,
                      icon: const Icon(Icons.open_in_new, size: 18, color: Colors.white),
                      label: const Text(
                        'View Details',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1652F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Updated Course Banner (Visible after returning edited course)
            if (_updatedCourseFromReturn != null) ...[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Updated Course :',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _updatedCourseFromReturn!,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// 2. STUDENT DETAILS SCREEN (View Student Details)
// =============================================================================
class StudentDetailsScreen extends StatefulWidget {
  final String name;
  final String rollNo;
  final String course;

  const StudentDetailsScreen({
    super.key,
    required this.name,
    required this.rollNo,
    required this.course,
  });

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  late String _currentCourse;

  @override
  void initState() {
    super.initState();
    _currentCourse = widget.course;
  }

  void _navigateToEditCourse() async {
    // Navigator.pushNamed - Passing current course via arguments to '/editCourse'
    final newCourse = await Navigator.pushNamed(
      context,
      '/editCourse',
      arguments: _currentCourse,
    );

    // Update local details state when edited course returns
    if (newCourse != null && newCourse is String) {
      setState(() {
        _currentCourse = newCourse;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B8A44),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Student Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Student Card Container
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Student Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B8A44),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Name Row
                  _buildDetailTile(
                    icon: Icons.person_outline,
                    iconBg: const Color(0xFFE8EAF6),
                    iconColor: Colors.indigo,
                    label: 'Name',
                    value: widget.name,
                  ),
                  const Divider(height: 24),

                  // Roll No Row
                  _buildDetailTile(
                    icon: Icons.assignment_ind_outlined,
                    iconBg: const Color(0xFFE8F5E9),
                    iconColor: Colors.green,
                    label: 'Roll No',
                    value: widget.rollNo,
                  ),
                  const Divider(height: 24),

                  // Course Row
                  _buildDetailTile(
                    icon: Icons.school_outlined,
                    iconBg: const Color(0xFFE1F5FE),
                    iconColor: Colors.blue,
                    label: 'Course',
                    value: _currentCourse,
                    valueColor: const Color(0xFF1B8A44),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Edit Course Button (Navigates to EditCourseScreen via pushNamed)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _navigateToEditCourse,
                icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                label: const Text(
                  'Edit Course',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5E35B1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Go Back Button (Pops back to HomeScreen returning updated course)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Navigator.pop - Return current course back to Home Screen
                  Navigator.pop(context, _currentCourse);
                },
                icon: const Icon(Icons.arrow_back,
                    size: 18, color: Color(0xFF1E56A0)),
                label: const Text(
                  'Go Back',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E56A0)),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1E56A0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: valueColor ?? Colors.black87,
              ),
            ),
          ],
        )
      ],
    );
  }
}

// =============================================================================
// 3. EDIT COURSE SCREEN (Select New Course)
// =============================================================================
class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  String? _selectedCourse;
  final List<String> _courseOptions = ['Flutter', 'Java', 'Python', 'AI'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve arguments passed via Navigator.pushNamed
    if (_selectedCourse == null) {
      final initialCourse =
          ModalRoute.of(context)?.settings.arguments as String?;
      _selectedCourse = initialCourse ?? 'Flutter';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEF6C00),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Edit Course',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Options Container Card
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Select New Course',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEF6C00),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: _courseOptions.map((course) {
                      return RadioListTile<String>(
                        title: Text(course,
                            style: const TextStyle(fontWeight: FontWeight.w500)),
                        value: course,
                        groupValue: _selectedCourse,
                        activeColor: const Color(0xFFEF6C00),
                        onChanged: (value) {
                          setState(() {
                            _selectedCourse = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Save Changes Button (Navigator.pop with selected course)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pop - Return selected course back to Details screen
                  Navigator.pop(context, _selectedCourse);
                },
                icon: const Icon(Icons.check, size: 18, color: Colors.white),
                label: const Text(
                  'Save Changes',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF6C00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}