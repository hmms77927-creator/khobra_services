import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final IconData icon;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.iconBackgroundColor = Colors.white,
    required this.iconColor,
    this.icon = Icons.arrow_forward,
    this.borderRadius = 12,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 66,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40), // left side balance

            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.lightskin,
    this.textColor = AppColors.darkgrey,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 313,
      height: 36,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.lightskin,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8.76),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.27,
            fontWeight: .w600,
            color: AppColors.darkgrey,
          ),
        ),
      ),
    );
  }
}

// Agree button

class AgreeCircleButton extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const AgreeCircleButton({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? const Color(0xFF4CAF50) : Colors.transparent,
          border: Border.all(color: const Color(0xFF4CAF50), width: 2),
          boxShadow: [
            if (isChecked)
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 6,
                spreadRadius: 1,
              ),
          ],
        ),
        child: isChecked
            ? const Icon(Icons.check, color: Colors.white, size: 18)
            : null,
      ),
    );
  }
}

// leading Button
class LeadButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LeadButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.lightgrey,
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back, color: AppColors.neutral, size: 18),
    );
  }
}

// Arrow_Forward Button
class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ArrowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: onPressed,
      child: Icon(Icons.arrow_forward, color: AppColors.white, size: 25),
    );
  }
}

// Profile Button

class ProfileButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;
  final double w;
  final double h;

  const ProfileButton({
    super.key,
    required this.text,
    required this.image,
    required this.w,
    required this.h,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSvg = image.endsWith('.svg');

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                width: w,
                height: h,
                child: isSvg
                    ? SvgPicture.asset(image)
                    : Image.asset(image, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

// Delete Button
class DeleteButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const DeleteButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(Icons.delete, color: AppColors.red),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 15,
                  fontWeight: .w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Text+Button Detail
class TextButtonDetail extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const TextButtonDetail({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 15,
                fontWeight: .w600,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 100,
            height: 22,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: Text(
                'Complete',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: .w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Post ajob Buttons
class PostButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const PostButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: .w500,
        ),
      ),
    );
  }
}

// IntroScreen  Button

class CustomintroButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;

  const CustomintroButton({
    super.key,
    required this.text,

    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 🔹 Center Text
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// 🔹 Left Icon
            Positioned(left: 20, child: Image.asset(image, fit: BoxFit.cover)),

            /// 🔹 Right Arrow Circle
            Positioned(
              right: 10,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.purple,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomProfile Button
class CustomProfileButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;
  const CustomProfileButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(child: Image.asset(image)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 16,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.fullgrey),
          ],
        ),
      ),
    );
  }
}

// Book Services
class Bookbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Bookbutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: .w500,
        ),
      ),
    );
  }
}

// Assign handyman
class AssignButton extends StatelessWidget {
  final String text;
  final String subtitle;
  final String image;
  final bool isSelected;
  final VoidCallback onPressed;

  const AssignButton({
    super.key,
    required this.text,
    required this.subtitle,
    required this.image,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.fullgrey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Spacer(),
        // OutlinedButton as radio toggle
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: CircleBorder(),
            side: BorderSide(
              color: isSelected ? AppColors.purple : AppColors.purple,
              width: 2,
            ),
            padding: EdgeInsets.all(12),
            backgroundColor: Colors.transparent,
            minimumSize: Size(20, 20),
          ),
          child: isSelected
              ? Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    shape: BoxShape.circle,
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
