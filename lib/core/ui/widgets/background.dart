
import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/assets_manager.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration:  BoxDecoration(
              image: DecorationImage(
                image:const AssetImage(
                  AssetsManager.background
                ),
                repeat: ImageRepeat.repeat,
                scale:3,
                  colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
