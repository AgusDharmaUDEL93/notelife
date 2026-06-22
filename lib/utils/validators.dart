class Validators {
  static String? notEmpty(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName tidak boleh kosong";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email tidak boleh kosong";
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return "Format email tidak valid";
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Nomor tidak boleh kosong";
    }

    final phoneRegex = RegExp(r"^[0-9]{9,15}$");

    if (!phoneRegex.hasMatch(value.trim())) {
      return "Nomor tidak valid";
    }

    return null;
  }

  static String? numeric(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName tidak boleh kosong";
    }

    final numberRegex = RegExp(r"^[0-9]+$");

    if (!numberRegex.hasMatch(value.trim())) {
      return "$fieldName harus berupa angka";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password tidak boleh kosong";
    }

    if (value.length < 8) {
      return "Password minimal 8 karakter";
    }

    return null;
  }

  static String? confirmPassword({
    required String? password,
    required String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Konfirmasi password tidak boleh kosong";
    }

    if (password != confirmPassword) {
      return "Password tidak sama";
    }

    return null;
  }
}
