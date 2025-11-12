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
  final Function(String)? onSearchChanged; // callback للبحث
  final bool enableSearch; // لو عايزة تفعل البحث

  const CustomScaffold({
    super.key,
    required this.title,
    required this.actions,
    required this.body,
    this.onSearchChanged,
    this.enableSearch = true,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: !isSearching
            ? Text(
          widget.title,
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        )
            : SizedBox(
          height: 45,
          child: TextField(
            controller: searchController,
            autofocus: true,
            onChanged: widget.onSearchChanged,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: isDarkMode ? Colors.white54 : Colors.black54,
              ),
              filled: true,
              fillColor: isDarkMode
                  ? Colors.grey.shade900
                  : Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.light : AppColors.dark,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.light : AppColors.dark,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.light : AppColors.dark,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        actions: [
          if (!isSearching && widget.enableSearch)
            IconButton(
              icon: Icon(Icons.search_outlined,
                  color: isDarkMode ? AppColors.light : AppColors.dark),
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
            ),
          if (isSearching)
            IconButton(
              icon: Icon(Icons.close,
                  color: isDarkMode ? AppColors.light : AppColors.dark),
              onPressed: () {
                setState(() {
                  isSearching = false;
                  searchController.clear();
                  if (widget.onSearchChanged != null) {
                    widget.onSearchChanged!(""); // إعادة النتائج الأصلية
                  }
                });
              },
            ),
          ...widget.actions,
        ],
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
