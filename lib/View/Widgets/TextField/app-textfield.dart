import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';


class AppTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText; // ✅ default false rakhenge
  final String hintText;
  final Color borderside;
  final Color bordercolor;

  const AppTextfield({
    super.key,
    this.controller,
    this.obscureText = false, // ✅ by default normal text
    required this.hintText,
    required this.borderside,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 312,
      child: TextField(
        controller: controller,
        obscureText: obscureText, // ✅ apply here
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.09),
            borderSide: BorderSide(color: borderside),
          ),
          hintText: hintText,
          filled: true,
          fillColor: AppColors.white,

          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.dimblack,
          ),

          // ✅ ternary operator for eye icon (only password field)
          suffixIcon: obscureText
              ? Icon(Icons.visibility_off)
              : null,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.09),
            borderSide: BorderSide(color: bordercolor),
          ),
        ),
      ),
    );
  }
}

// Home Page
class HomeField extends StatelessWidget {
  final String hintText;
  final VoidCallback onPressed;
  final Function(String)? onChanged;
  const HomeField({super.key, required this.hintText, required this.onPressed, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 64,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.lightwhite),
          ),
          hintText: hintText,
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.lightwhite),
          ),
          prefixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.search, color: AppColors.pureblack, size: 20),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.lightYellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.tune, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}

// Employee
class employee extends StatelessWidget {
  final TextEditingController controller;
  const employee({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.lightwhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.lightwhite),
        ),
        filled: true,
        fillColor: AppColors.white,
        hintText: 'Search Employer....',
        hintStyle: TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: .w700,
        ),
        prefixIcon: Icon(Icons.search, color: AppColors.black),
      ),
    );
  }
}

// services
class ServicesTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const ServicesTextfield({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 271,
      height: 41,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.fieldcolor),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.lightBlack),
          ),
          enabledBorder: InputBorder.none,
          hintText: text,
          hintStyle: TextStyle(color: AppColors.lightBlack),
          filled: true,
          fillColor: AppColors.fieldcolor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.fieldcolor),
          ),
        ),
      ),
    );
  }
}

// bookfield
class bookfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final VoidCallback onPressed;
  const bookfield({
    super.key,
    required this.controller,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334,
      height: 46,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.fieldcolor),
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.keyboard_arrow_down),
          ),
          enabledBorder: InputBorder.none,
          filled: true,
          hint: Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: .w800,
            ),
          ),
          fillColor: AppColors.fieldcolor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.fieldcolor),
          ),
        ),
      ),
    );
  }
}

// Profile pro
class Profileprofield extends StatelessWidget {
  final String text;
  final String label;
  final TextEditingController controller;
  final IconData icon;
  const Profileprofield({
    super.key,
    required this.text,
    required this.label,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.fieldcolor),
        ),
        hintText: text,
        label: Text(label),
        filled: true,
        fillColor: AppColors.fieldcolor,
        suffixIcon: Icon(icon),
        enabledBorder: InputBorder.none,
        focusColor: AppColors.fieldcolor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.purple),
        ),
      ),
    );
  }
}

// Add Services field
class addservicea extends StatelessWidget {
  final String text;
  final String label;
  final TextEditingController controller;
  final IconData icon;
  const addservicea({
    super.key,
    required this.text,
    required this.label,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.white),
        ),
        enabledBorder: InputBorder.none,
        hintText: text,
        label: Text(label),
        filled: true,
        fillColor: AppColors.white,
        suffixIcon: Icon(icon),
        focusColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.purple),
        ),
      ),
    );
  }
}
