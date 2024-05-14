import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seclob_task/controller/api_provider.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 8),
          itemCount: value.datas!.length,
          itemBuilder: (context, index) {
            final data = value.datas![index];
            print('${data.likeCount}');

            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${data.filePath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.favorite_border_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            '${data.likeCount}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            '${data.commentCount}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}