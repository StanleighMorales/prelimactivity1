import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ContactListPage(),
    );
  }
}

class Contact {
  final String fullName;
  final String contactNumber;
  final String email;

  Contact({
    required this.fullName,
    required this.contactNumber,
    required this.email,
  });
}

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Contact selectedContact = Contact(
    fullName: 'Your Name',
    contactNumber: '+1 234-567-8900',
    email: 'your.email@email.com',
  );

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(
        fullName: 'John Smith',
        contactNumber: '+1 234-567-8901',
        email: 'john.smith@email.com',
      ),
      Contact(
        fullName: 'Sarah Johnson',
        contactNumber: '+1 234-567-8902',
        email: 'sarah.johnson@email.com',
      ),
      Contact(
        fullName: 'Michael Brown',
        contactNumber: '+1 234-567-8903',
        email: 'michael.brown@email.com',
      ),
      Contact(
        fullName: 'Emily Davis',
        contactNumber: '+1 234-567-8904',
        email: 'emily.davis@email.com',
      ),
      Contact(
        fullName: 'David Wilson',
        contactNumber: '+1 234-567-8905',
        email: 'david.wilson@email.com',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Contacts'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.deepPurple.shade50,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  selectedContact.fullName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  selectedContact.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  selectedContact.contactNumber,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade200,
                    child: Text(
                      contact.fullName[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(contact.fullName),
                  subtitle: Text('${contact.contactNumber}\n${contact.email}'),
                  isThreeLine: true,
                  onTap: () {
                    setState(() {
                      selectedContact = contact;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
