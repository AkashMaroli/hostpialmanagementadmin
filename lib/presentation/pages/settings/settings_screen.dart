import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  String selectedLanguage = 'English/USA';
  String selectedDateFormat = 'DD/MM/YYYY';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Manage our Personal Informations',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Exports'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add New'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Navigation Tabs
              SettingsTabBar(
                tabController: _tabController,
                onTabSelected: (index) {
                  setState(() {
                    _tabController.animateTo(index);
                  });
                },
              ),
              const SizedBox(height: 20),
              // Main Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // My Profile Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // General Information Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'General Information',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Photos
                                const InfoRow(
                                  title: 'Photos',
                                  content: ProfileAvatar(),
                                ),
                                // Name
                                const InfoRow(
                                  title: 'Name',
                                  content: Text('Brooklyn Simmons'),
                                ),
                                // Email
                                const InfoRow(
                                  title: 'Email Address',
                                  content: Text('hi@brooklynsimmons.co'),
                                  isLast: false,
                                ),
                                // Linked Team Accounts
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 14.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          'Linked Team Accounts',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TeamMemberRow(
                                              name: 'Jenny Wilson',
                                              imageUrl:
                                                  'https://i.pravatar.cc/150?img=1',
                                            ),
                                            SizedBox(height: 8),
                                            TeamMemberRow(
                                              name: 'Natasha Romanoff',
                                              imageUrl:
                                                  'https://i.pravatar.cc/150?img=5',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Preferences Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Preference',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Language
                                InfoRow(
                                  title: 'Language',
                                  content: DropdownButton<String>(
                                    value: selectedLanguage,
                                    icon:
                                        const Icon(Icons.keyboard_arrow_down),
                                    isDense: true,
                                    underline: const SizedBox(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedLanguage = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'English/USA',
                                      'Spanish',
                                      'French'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            if (value == 'English/USA')
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 8),
                                                width: 20,
                                                height: 20,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://flagcdn.com/w20/us.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            Text(value),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                // Date Format
                                InfoRow(
                                  title: 'Date Format',
                                  content: DropdownButton<String>(
                                    value: selectedDateFormat,
                                    icon:
                                        const Icon(Icons.keyboard_arrow_down),
                                    isDense: true,
                                    underline: const SizedBox(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedDateFormat = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'DD/MM/YYYY',
                                      'MM/DD/YYYY',
                                      'YYYY/MM/DD'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  isLast: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Save Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.save_outlined),
                              label: const Text('Save'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Export History',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Export history list
                                ListTile(
                                  title: const Text('Account Data'),
                                  subtitle:
                                      const Text('April 15, 2025 • CSV'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.download),
                                    onPressed: () {},
                                  ),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  title: const Text('Complete Backup'),
                                  subtitle:
                                      const Text('March 22, 2025 • JSON'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.download),
                                    onPressed: () {},
                                  ),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  title: const Text('Activity History'),
                                  subtitle:
                                      const Text('February 8, 2025 • PDF'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.download),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Delete Account Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.red.shade100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.warning_amber_rounded,
                                          color: Colors.red.shade700),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Delete Account',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                    height: 1, color: Colors.red.shade100),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Warning: This action cannot be undone',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Deleting your account will permanently remove all your data, settings, team connections, and access to our services. This action is irreversible.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                          height: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      const Text(
                                        'Please select reason for deleting account:',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      // Reason dropdown
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: 'Select a reason',
                                            items: [
                                              'Select a reason',
                                              'No longer using the service',
                                              'Privacy concerns',
                                              'Moving to a different service',
                                              'Technical issues',
                                              'Other'
                                            ].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {},
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      // Confirmation checkbox
                                      CheckboxListTile(
                                        title: const Text(
                                          'I understand that this action cannot be undone and all my data will be permanently deleted',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        value: false,
                                        onChanged: (bool? value) {},
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      const SizedBox(height: 24),
                                      // Delete button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red.shade50,
                                            foregroundColor:
                                                Colors.red.shade700,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: Colors.red.shade200),
                                            ),
                                          ),
                                          icon: const Icon(Icons.delete_outline),
                                          label: const Text('Delete My Account'),
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
                    ),
                    // Security Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Security Settings',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Password
                                const InfoRow(
                                  title: 'Password',
                                  content: Text('••••••••••'),
                                ),
                                // Two-Factor Auth
                                ListTile(
                                  title: const Text(
                                      'Two-Factor Authentication'),
                                  subtitle: const Text(
                                      'Enhance your account security'),
                                  trailing: Switch(
                                    value: true,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                // Login History
                                const ListTile(
                                  title: Text('Login History'),
                                  subtitle: Text(
                                      'Review your recent sign-in activities'),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                                // Sessions
                                const ListTile(
                                  title: Text('Active Sessions'),
                                  subtitle: Text(
                                      'Manage devices where you are logged in'),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Privacy',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Data Sharing
                                ListTile(
                                  title: const Text('Data Sharing'),
                                  subtitle: const Text(
                                      'Control how your data is shared'),
                                  trailing: Switch(
                                    value: false,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                // Privacy Policy
                                const ListTile(
                                  title: Text('Privacy Policy'),
                                  subtitle: Text(
                                      'Read our latest privacy policy'),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Save Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.save_outlined),
                              label: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Notifications Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Notification Preferences',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Email Notifications
                                ListTile(
                                  title: const Text('Email Notifications'),
                                  subtitle: const Text(
                                      'Receive emails about activity and updates'),
                                  trailing: Switch(
                                    value: true,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                // Push Notifications
                                ListTile(
                                  title: const Text('Push Notifications'),
                                  subtitle: const Text(
                                      'Receive notifications on your devices'),
                                  trailing: Switch(
                                    value: true,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                // SMS Notifications
                                ListTile(
                                  title: const Text('SMS Notifications'),
                                  subtitle: const Text(
                                      'Receive text messages for important updates'),
                                  trailing: Switch(
                                    value: false,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Notification Types',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Account Notifications
                                ListTile(
                                  title: const Text('Account Notifications'),
                                  subtitle: const Text(
                                      'Security alerts and account updates'),
                                  trailing: Switch(
                                    value: true,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                // Marketing Notifications
                                ListTile(
                                  title: const Text('Marketing'),
                                  subtitle: const Text(
                                      'New features and promotional offers'),
                                  trailing: Switch(
                                    value: false,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                                // Team Activity
                                ListTile(
                                  title: const Text('Team Activity'),
                                  subtitle: const Text(
                                      'Updates from your team members'),
                                  trailing: Switch(
                                    value: true,
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Save Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.save_outlined),
                              label: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Data Export Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Export Your Data',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Select data to export',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      // Checkboxes for export options
                                      CheckboxListTile(
                                        title:
                                            const Text('Account Information'),
                                        value: true,
                                        onChanged: (bool? value) {},
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      CheckboxListTile(
                                        title:
                                            const Text('Activity History'),
                                        value: true,
                                        onChanged: (bool? value) {},
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      CheckboxListTile(
                                        title:
                                            const Text('Team Connections'),
                                        value: false,
                                        onChanged: (bool? value) {},
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      CheckboxListTile(
                                        title:
                                            const Text('Saved Preferences'),
                                        value: true,
                                        onChanged: (bool? value) {},
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      const SizedBox(height: 24),
                                      const Text(
                                        'Format',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      // Format options
                                      Wrap(
                                        spacing: 12,
                                        children: [
                                          ChoiceChip(
                                            label: const Text('CSV'),
                                            selected: true,
                                            selectedColor: Colors.deepPurple
                                                .shade100,
                                            onSelected: (bool selected) {},
                                          ),
                                          ChoiceChip(
                                            label: const Text('JSON'),
                                            selected: false,
                                            onSelected: (bool selected) {},
                                          ),
                                          ChoiceChip(
                                            label: const Text('PDF'),
                                            selected: false,
                                            onSelected: (bool selected) {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(height: 1),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: const Text('Schedule Export'),
                                      ),
                                      const SizedBox(width: 12),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepPurple,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        icon:
                                            const Icon(Icons.download, size: 16),
                                        label: const Text('Export Now'),
                                      ),
                                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTabSelected;

  const SettingsTabBar({
    Key? key,
    required this.tabController,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab('My Profile', 0),
            _buildTab('Security', 1),
            _buildTab('Notifications', 2),
            _buildTab('Data Export', 3),
            _buildTab('Delete Account', 4, isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index, {bool isDestructive = false}) {
    final isActive = tabController.index == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isDestructive
                    ? Colors.red
                    : (isActive ? Colors.deepPurple : Colors.grey[700]),
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),
            if (isActive)
              Container(
                height: 2,
                width: 20,
                color:
                    isDestructive ? Colors.red : Colors.deepPurple,
              ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final Widget content;
  final bool isLast;

  const InfoRow({
    Key? key,
    required this.title,
    required this.content,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 14.0),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
              Expanded(child: content),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            color: Colors.grey.shade200,
          ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.deepPurple.shade100,
      child: Text(
        'BS',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade800,
        ),
      ),
    );
  }
}

class TeamMemberRow extends StatelessWidget {
  final String name;
  final String imageUrl;

  const TeamMemberRow({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, 30),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Text(
            'Manage Team',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}