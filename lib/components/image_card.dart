import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:terra_galery/models/image_model.dart';

class GalleryCard extends StatelessWidget {
  final ImageModel curImage;

  GalleryCard({
    required this.curImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FullScreenImage(image: curImage)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: curImage.thumbnailurl,
                  height: 150,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 24, 65, 0),
                  )),
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      "assets/images/background-pic.png",
                      height: 150,
                      fit: BoxFit.contain,
                    );
                  },
                )),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 6),
            child: Text(
              curImage.shortTitle != ""
                  ? curImage.shortTitle[0].toUpperCase() +
                      curImage.shortTitle.substring(1).toLowerCase()
                  : curImage.title[0].toUpperCase() +
                      curImage.title.substring(1).toLowerCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            curImage.description,
            maxLines: 3, // Número máximo de líneas a mostrar
            overflow: TextOverflow
                .ellipsis, // Agrega elipsis al final si el texto excede las líneas máximas
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class FullScreenImage extends StatefulWidget {
  final ImageModel image;

  FullScreenImage({required this.image});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  bool _snackBarShown = false;
  late ImageModel _image;
  @override
  void initState() {
    _image = widget.image;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_snackBarShown) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "Consejo: amplía la imagen y observa hasta el último detalle.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color.fromARGB(255, 62, 54, 54),
          ),
        );
        setState(() {
          _snackBarShown = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          _image.title.toUpperCase(),
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff3b7d24),
          ),
          maxLines: 2,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xff144C27),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // border: Border.all(color: Colors.black, width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.1), // Color y opacidad de la sombra
                  spreadRadius:
                      1, // Cuánto se extiende la sombra desde el contenedor
                  blurRadius: 2, // Cuánto se desenfoca la sombra
                  offset: Offset(0, 2), // Desplazamiento de la sombra (x, y)
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImageView(image: _image),
                    ),
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: _image.url,
                  height: 150,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 24, 65, 0),
                  )),
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      "assets/images/background-pic.png",
                      height: 150,
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          //   width: double.infinity,
          //   child: Text(
          //     image.title.toUpperCase(),
          //     style: const TextStyle(
          //       fontFamily: "Poppins",
          //       fontSize: 18,
          //       fontWeight: FontWeight.w600,
          //       color: Color(0xff1b2028),
          //     ),
          //     textAlign: TextAlign.left,
          //   ),
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            width: double.infinity,
            child: Text(
              _image.description,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      )),
    );
  }
}

class FullScreenImageView extends StatelessWidget {
  final ImageModel image;

  FullScreenImageView({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          image.title.toUpperCase(),
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff3b7d24),
          ),
          maxLines: 2,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xff144C27),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(image.url),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2.5,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
        ),
        pageController: PageController(),
      ),
    );
  }
}
// PhotoView(
//                 imageProvider: NetworkImage(_image.url),
//                 minScale: PhotoViewComputedScale.contained,
//                 maxScale: PhotoViewComputedScale.covered * 2.5,
//                 loadingBuilder: (context, url) => Center(
//                     child: CircularProgressIndicator(
//                   color: Color.fromARGB(255, 24, 65, 0),
//                 )),
//                 enableRotation: false,
//                 backgroundDecoration: BoxDecoration(color: Colors.white),
//               ),