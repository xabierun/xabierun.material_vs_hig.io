import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassAppBar extends StatelessWidget {
  const GlassAppBar({
    this.title,
    this.onBackPressed,
    super.key,
  });

  final String? title;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              LiquidGlassLayer(
                settings: const LiquidGlassSettings(
                  blur: 15,
                  glassColor: Color(0x26FFFFFF),
                  lightIntensity: 0.9,
                  ambientStrength: 0.6,
                ),
                child: LiquidGlass(
                  shape: const LiquidRoundedSuperellipse(
                    borderRadius: 12,
                  ),
                  child: GlassGlow(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                      child: const Icon(
                        CupertinoIcons.back,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

