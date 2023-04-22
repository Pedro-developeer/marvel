import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marvel_mottu/features/domain/entities/character_entity.dart';
import 'package:marvel_mottu/features/presenter/components/character_card_widget.dart';
import 'package:marvel_mottu/features/presenter/components/footer_home_widget.dart';
import 'package:marvel_mottu/features/presenter/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          'Marvel Comics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: '.SF UI Display',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoadingAllData.value
              ? Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Theme.of(context).primaryColor,
                    size: 35,
                  ),
                )
              : Column(
                  children: [
                    controller.obx(
                      onLoading: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 3),
                        child: Center(
                          child: LoadingAnimationWidget.inkDrop(
                            color: Theme.of(context).primaryColor,
                            size: 35,
                          ),
                        ),
                      ),
                      (state) {
                        late List<CharacterEntity> listCharacters;

                        if (controller.listCharactersSearched.isNotEmpty) {
                          listCharacters =
                              List.from(controller.listCharactersSearched);
                        } else {
                          listCharacters = state ?? [];
                        }

                        return SizedBox(
                          height: 600,
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            children: List.generate(
                              listCharacters.length,
                              (index) {
                                final item = listCharacters[index];

                                return GestureDetector(
                                  onTap: () => controller.goToDetailsPage(
                                    characterEntity: item,
                                  ),
                                  child: Hero(
                                    tag: item.id,
                                    child: Material(
                                      child: CharacterCardWidget(
                                        name: item.name,
                                        imageUrl: item
                                            .characterThumbnailEntity.imageUrl,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    FooterHomeWidget()
                  ],
                ),
        ),
      ),
    );
  }
}
