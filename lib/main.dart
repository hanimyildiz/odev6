import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserForm(),
    );
  }
}

class UserForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kullanıcı Formu')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'İsim'),
                validator: (value) => value == null || value.isEmpty ? 'Gerekli' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-posta'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Gerekli';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Geçersiz e-posta';
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                validator: (value) => (value == null || value.length < 6) ? 'En az 6 karakter' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kaydedildi')));
                  }
                },
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
