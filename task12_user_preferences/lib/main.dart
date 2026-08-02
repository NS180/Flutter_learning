import 'package:flutter/material.dart';

void main() {
  runApp(const UserPreferencesApp());
}

class UserPreferencesApp extends StatelessWidget {
  const UserPreferencesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: const Color(0xFF512DA8),
      ),
      home: const UserPreferencesScreen(),
    );
  }
}

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  // 1. Enable Notifications (Switch)
  bool _notificationsEnabled = true;

  // 2. Choose Theme (ToggleButtons)
  final List<bool> _themeSelections = [false, true]; // [Light, Dark]

  // 3. Select Gender (Radio)
  String _selectedGender = 'Female';

  // 4. Terms & Conditions (Checkbox)
  bool _termsAccepted = true;

  // 5. Font Size (Slider)
  double _fontSize = 20.0;

  // 6. Choose Your Interests (ChoiceChips)
  final List<String> _interests = [
    'Flutter',
    'AI',
    'Web Development',
    'Game Development'
  ];
  String _selectedInterest = 'Flutter';

  // 7. Quick Actions Status Banner
  bool _showSuccessBanner = true;

  // 8. Profile Completion (Stepper)
  int _currentStep = 1;

  // -------------------------------------------------------------
  // HELPER METHODS (Declared as class methods)
  // -------------------------------------------------------------
  Widget _buildSectionIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 22),
    );
  }

  Widget _buildRadioOption(String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: _selectedGender,
          activeColor: const Color(0xFF4A148C),
          onChanged: (val) {
            setState(() {
              _selectedGender = val!;
            });
          },
        ),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'User Preferences',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------
            // 1. Enable Notifications
            // -------------------------------------------------------------
            Row(
              children: [
                _buildSectionIcon(Icons.notifications_none, Colors.deepPurple),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enable Notifications',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          text: 'Notifications : ',
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                          children: [
                            TextSpan(
                              text: _notificationsEnabled ? 'Enabled' : 'Disabled',
                              style: TextStyle(
                                color: _notificationsEnabled ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: _notificationsEnabled,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF4A148C),
                  onChanged: (val) {
                    setState(() {
                      _notificationsEnabled = val;
                    });
                  },
                ),
              ],
            ),
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 2. Choose Theme
            // -------------------------------------------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionIcon(Icons.palette_outlined, Colors.orange),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose Theme',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ToggleButtons(
                        isSelected: _themeSelections,
                        borderRadius: BorderRadius.circular(12),
                        selectedColor: Colors.white,
                        fillColor: const Color(0xFF4A148C),
                        color: Colors.black87,
                        constraints: const BoxConstraints(minWidth: 120, minHeight: 40),
                        onPressed: (index) {
                          setState(() {
                            for (int i = 0; i < _themeSelections.length; i++) {
                              _themeSelections[i] = i == index;
                            }
                          });
                        },
                        children: const [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wb_sunny_outlined, size: 18, color: Colors.orange),
                              SizedBox(width: 6),
                              Text('Light'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.nightlight_round, size: 18, color: Colors.amber),
                              SizedBox(width: 6),
                              Text('Dark'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          text: 'Selected Mode : ',
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                          children: [
                            TextSpan(
                              text: _themeSelections[0] ? 'Light' : 'Dark',
                              style: const TextStyle(
                                color: Color(0xFF4A148C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 3. Select Gender
            // -------------------------------------------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionIcon(Icons.person_outline, Colors.pink),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Gender',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          _buildRadioOption('Male'),
                          _buildRadioOption('Female'),
                          _buildRadioOption('Other'),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Selected Gender : ',
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                          children: [
                            TextSpan(
                              text: _selectedGender,
                              style: const TextStyle(
                                color: Color(0xFF4A148C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 4. Terms & Conditions
            // -------------------------------------------------------------
            Row(
              children: [
                _buildSectionIcon(Icons.check_box_outlined, Colors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _termsAccepted,
                            activeColor: Colors.green,
                            onChanged: (val) {
                              setState(() {
                                _termsAccepted = val ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: 'I accept the ',
                                style: const TextStyle(fontSize: 14, color: Colors.black87),
                                children: [
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: TextStyle(
                                      color: Colors.purple[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text.rich(
                          TextSpan(
                            text: 'Status : ',
                            style: const TextStyle(color: Colors.grey, fontSize: 13),
                            children: [
                              TextSpan(
                                text: _termsAccepted ? 'Accepted' : 'Pending',
                                style: TextStyle(
                                  color: _termsAccepted ? Colors.green : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 5. Font Size
            // -------------------------------------------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionIcon(Icons.text_fields, Colors.blue),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Font Size (Sample Text)',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text('10', style: TextStyle(color: Colors.grey)),
                          Expanded(
                            child: Slider(
                              value: _fontSize,
                              min: 10,
                              max: 30,
                              activeColor: const Color(0xFF4A148C),
                              inactiveColor: Colors.grey[300],
                              onChanged: (val) {
                                setState(() {
                                  _fontSize = val;
                                });
                              },
                            ),
                          ),
                          const Text('30', style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 8),
                          Text.rich(
                            TextSpan(
                              text: 'Current Size : ',
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                              children: [
                                TextSpan(
                                  text: '${_fontSize.toInt()}',
                                  style: const TextStyle(
                                    color: Color(0xFF4A148C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          'Flutter is Awesome!',
                          style: TextStyle(
                            fontSize: _fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 6. Choose Your Interests
            // -------------------------------------------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionIcon(Icons.favorite_border, Colors.purple),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose Your Interests (Select One)',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: _interests.map((interest) {
                          final isSelected = _selectedInterest == interest;
                          return ChoiceChip(
                            label: Text(interest),
                            selected: isSelected,
                            selectedColor: const Color(0xFF4A148C),
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : const Color(0xFF4A148C),
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Color(0xFF4A148C)),
                            ),
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedInterest = interest;
                                });
                              }
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          text: 'Selected Interest : ',
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                          children: [
                            TextSpan(
                              text: _selectedInterest,
                              style: const TextStyle(
                                color: Color(0xFF4A148C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 7. Quick Actions & Status Banner
            // -------------------------------------------------------------
            Row(
              children: [
                _buildSectionIcon(Icons.bolt, Colors.amber),
                const SizedBox(width: 12),
                const Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _notificationsEnabled = true;
                      _themeSelections[0] = false;
                      _themeSelections[1] = true;
                      _selectedGender = 'Female';
                      _termsAccepted = true;
                      _fontSize = 20.0;
                      _selectedInterest = 'Flutter';
                      _showSuccessBanner = false;
                      _currentStep = 1;
                    });
                  },
                  icon: const Icon(Icons.refresh, size: 16),
                  label: const Text('Reset'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF4A148C),
                    side: const BorderSide(color: Color(0xFF4A148C)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _showSuccessBanner = true;
                    });
                  },
                  icon: const Icon(Icons.save, size: 16, color: Colors.white),
                  label: const Text('Save', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A148C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            if (_showSuccessBanner) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: Colors.white),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Preferences Saved Successfully!',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showSuccessBanner = false;
                        });
                      },
                      child: const Text(
                        'DISMISS',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const Divider(height: 24),

            // -------------------------------------------------------------
            // 8. Profile Completion (Stepper)
            // -------------------------------------------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionIcon(Icons.list_alt, Colors.blue),
                const SizedBox(width: 12),
                const Text(
                  'Profile Completion',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 180,
              child: Theme(
                data: ThemeData(
                  colorScheme: const ColorScheme.light(primary: Color(0xFF4A148C)),
                ),
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  currentStep: _currentStep,
                  elevation: 0,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  onStepContinue: () {
                    if (_currentStep < 2) {
                      setState(() {
                        _currentStep += 1;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep -= 1;
                      });
                    }
                  },
                  steps: [
                    Step(
                      title: const Text('Personal Details', style: TextStyle(fontSize: 11)),
                      content: const SizedBox.shrink(),
                      isActive: _currentStep >= 0,
                      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Preferences', style: TextStyle(fontSize: 11)),
                      content: const SizedBox.shrink(),
                      isActive: _currentStep >= 1,
                      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Finish', style: TextStyle(fontSize: 11)),
                      content: const SizedBox.shrink(),
                      isActive: _currentStep >= 2,
                      state: StepState.indexed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}