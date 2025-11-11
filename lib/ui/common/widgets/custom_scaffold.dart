import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/routes.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/resources/designs/design.dart';
import 'package:provider/provider.dart';


class CustomScaffold extends StatefulWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.actions,
    required this.body,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: widget.actions,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: AppColors.dark,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.light),
              child: Center(
                child: Text(
                  "News App",
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.HomeScreen.route);
              },

              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.homeIcon,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        AppColors.light,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Go To Home",
                      style: GoogleFonts.inter(
                        color: AppColors.light,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: AppColors.light),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.themeIcon,
                    width: 26,
                    colorFilter: ColorFilter.mode(
                      AppColors.light,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Theme",
                    style: GoogleFonts.inter(
                      color: AppColors.light,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Container(
              width: 237,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.dark,
                border: Border.all(color: AppColors.light),
                borderRadius: BorderRadius.circular(16),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: AppColors.dark,
                  value: "Light",
                  items: [
                    DropdownMenuItem(
                      value: "Light",
                      child: Text(
                        "Light",
                        style: TextStyle(color: AppColors.light),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Dark",
                      child: Text(
                        "Dark",
                        style: TextStyle(color: AppColors.light),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == "Light") {
                      themeProvider.setThemeMode(ThemeMode.light);
                    } else {
                      themeProvider.setThemeMode(ThemeMode.dark);
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: AppColors.light),
            ),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.languageIcon,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.light,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Language",
                    style: GoogleFonts.inter(
                      color: AppColors.light,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: 237,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.dark,
                border: Border.all(color: AppColors.light),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: AppColors.dark,
                  value: "English",
                  items: [
                    DropdownMenuItem(
                      value: "English",
                      child: Text(
                        "English",
                        style: TextStyle(color: AppColors.light),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Arabic",
                      child: Text(
                        "Arabic",
                        style: TextStyle(color: AppColors.light),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
