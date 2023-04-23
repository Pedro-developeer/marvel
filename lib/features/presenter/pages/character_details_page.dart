import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_mottu/features/domain/entities/character_entity.dart';
import 'package:marvel_mottu/features/presenter/controllers/home_controller.dart';

class CharacterDetailsPage extends StatelessWidget {
  CharacterDetailsPage({super.key});

  final controller = Get.find<HomeController>();
  final CharacterEntity character = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: character.id,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    child: Image.network(
                      character.characterThumbnailEntity.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontFamily: '.SF UI Display',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        character.description.isEmpty
                            ? 'Sem descrição'
                            : character.description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: '.SF UI Display',
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Séries',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: '.SF UI Display',
                        ),
                      ),
                      const SizedBox(height: 12),
                      character.series.isEmpty
                          ? const Text(
                              'No series',
                              style: TextStyle(
                                fontFamily: '.SF UI Display',
                                fontSize: 18,
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: character.series.map((item) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: '.SF UI Display',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    )
                                  ],
                                );
                              }).toList(),
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 12,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                size: 28,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
