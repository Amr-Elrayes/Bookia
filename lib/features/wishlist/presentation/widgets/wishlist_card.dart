import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/wishlist/data/models/wishlistresponse/datum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.book, required this.onDelete});
  final Datum book;
  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),

      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.delete, color: AppColors.whiteColor, size: 30),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDelete();
      },
      child: Container(
        height: 140,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: book.image ?? "",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name ?? "",
                    style: TextStyles.size18(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(10),
                  Text("\$${book.price}", style: TextStyles.size15()),
                  Gap(10),
                  Text(
                    book.description ?? "",
                    style: TextStyles.size15(color: AppColors.graytextColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
