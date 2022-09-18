import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/assets/lover_colors.dart';
import 'package:lover_challenge/common/custom_icon.dart';
import 'package:lover_challenge/common/custom_icon_button.dart';
import 'package:lover_challenge/common/grid_loading.dart';
import 'package:lover_challenge/data/enums/custom_icons.dart';
import 'package:lover_challenge/data/model/breed/breed.dart';
import 'package:lover_challenge/presentation/cats/cats_page_controller.dart';

class CatsPage extends GetView<CatsPageController> {
  const CatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
        backgroundColor: LoverColors.desire2,
      ),
      body: SafeArea(
        child: Center(
          child: Obx(() => controller.loading
              ? GridLoading(
                  size: Get.width / 3,
                )
              : _BreedsList(
                  breeds: controller.breeds,
                  onTapDeleted: (breed) => controller.deleteBreed(breed),
                )),
        ),
      ),
    );
  }
}

class _BreedsList extends StatelessWidget {
  final Function(Breed) onTapDeleted;

  const _BreedsList(
      {super.key, required this.breeds, required this.onTapDeleted});

  final List<Breed> breeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: breeds.length,
        itemBuilder: ((context, index) {
          final breed = breeds[index];

          return Card(
            child: Stack(
              children: [
                _CatPicture(breed: breed),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: LoverColors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                breed.name,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: LoverColors.lavender,
                                ),
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                breed.temperament,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: LoverColors.lavender,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomIconButton(
                          icon: CustomIcons.trash,
                          color: LoverColors.pleasureMain,
                          onPressed: () => onTapDeleted(breed),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}

class _CatPicture extends StatelessWidget {
  const _CatPicture({
    Key? key,
    required this.breed,
  }) : super(key: key);

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return breed.imageUrl != null
        ? Image.network(
            breed.imageUrl!,
            fit: BoxFit.cover,
          )
        : const _NoCatImage();
  }
}

class _NoCatImage extends StatelessWidget {
  const _NoCatImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: Svg(CustomIcons.cat.value),
    );
  }
}
