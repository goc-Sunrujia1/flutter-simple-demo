import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/animalDetailPage.dart';
import '../../pages/articleDetailPage.dart';
import '../../theme/theme.dart';
import '../networkImageLoader.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.avatarPath,
      required this.avatarName,
      required this.brief,
      required this.imageUrl,
      required this.comments,
      required this.likes});

  final String avatarPath;
  final String avatarName;
  final String brief;
  final String imageUrl;
  final int comments;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ArticleDetailPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Card(
          color: AppColors.cardColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => AnimalDetailPage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(avatarPath),
                      ),
                    ),

                    SizedBox(width: 8.0),
                    Text(avatarName,
                        style: AppTheme.themeData.textTheme.headline2),
                  ],
                ),
                SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(brief),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.comment),
                        SizedBox(width: 8),
                        Text(
                          '评论：$comments',
                          style: AppTheme.themeData.textTheme.headline3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '喜欢：$likes',
                          style: AppTheme.themeData.textTheme.headline3,
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.favorite),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
