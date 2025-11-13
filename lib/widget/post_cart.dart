import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/constant.dart';

class PostCardBody extends StatelessWidget {
   PostCardBody({
    super.key,
    this.imagePath,
  });

  String? imagePath;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final haveImage = imagePath != null;

    return Column(
      children: [
        if (imagePath != null) 
                  Image.asset(
                    imagePath!,
                    width: size.width * 0.9,
                    fit: BoxFit.cover,
                  ),
        Container(
          width: size.width * 0.9,
          height: size.height * 0.1,
          padding: const EdgeInsets.all(16),    
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(standardBorderRadius),
              bottomRight: Radius.circular(standardBorderRadius),
              topLeft: haveImage ? Radius.circular(0): Radius.circular(standardBorderRadius),
              topRight: haveImage ? Radius.circular(0): Radius.circular(standardBorderRadius),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Column(
               spacing: 1,
                children: [
                  Expanded(                                
                    child: Text(
                      "Title",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                    ),
                  ),
                 Text("Author",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                ),
                ],
              ),
            Spacer(flex: 2,),
            Column(
              children: [
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.pink,
                size: 30,
              ),
              Text("28")
              ],
            ),
            SizedBox(width: 20,),
            Column(
              children: [
              Icon(
                Icons.comment_bank_outlined,
                color: Colors.pink,
                size: 30,
              ),
              Text("28"),
              ],
            )
            ],
          ),
        )
      ],
    );
  }
}
