import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_vs_hig/tokens/colors/material_colors.dart';
import 'package:material_vs_hig/tokens/text_styles/material_text_styles.dart';

class MaterialExample extends StatelessWidget {
  const MaterialExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: MaterialColors.primary,
          primary: MaterialColors.primary,
          onPrimary: MaterialColors.onPrimary,
          surface: MaterialColors.surface,
          onSurface: MaterialColors.onSurface,
        ),
      ),
      home: Scaffold(
        backgroundColor: MaterialColors.background,
        appBar: AppBar(
          backgroundColor: MaterialColors.surface,
          foregroundColor: MaterialColors.onSurface,
          title: Text(
            'Material App',
            style: MaterialTextStyles.bodyOnSurface,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              'Material Design',
              style: MaterialTextStyles.headingOnSurface,
            );
          },
        ),
      ),
    );
  }
}
