import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  static String SUPABASE_URL = dotenv.env["SUPABASE_URL"] ?? "";
  static String SUPABASE_ANON_KEY = dotenv.env["SUPABASE_ANON_KEY"] ?? "";
}
