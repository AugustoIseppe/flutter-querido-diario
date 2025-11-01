import 'package:flutter/material.dart';
import 'package:querido_diario/app/app_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://hqqnjztffebcbigvexbs.supabase.co',  // Removido o "db."
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhxcW5qenRmZmViY2JpZ3ZleGJzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEyMTg2NzMsImV4cCI6MjA3Njc5NDY3M30.MDKlYOb5wU7GzjwGSMHZ2W5eU7QADVA_ZsDJnUVQjSs',
  );
  runApp(const AppWidget());
}

