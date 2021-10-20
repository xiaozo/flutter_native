part of 'image_button.dart';

class ImageButtonBackground extends StatelessWidget {
  final Color overlayColor;
  final Color bodyColor;
  final double overlayBottom;
  final ImageProvider leftTopImage;

  const ImageButtonBackground(
      {Key? key,
      required this.overlayColor,
      required this.overlayBottom,
      required this.bodyColor,
      required this.leftTopImage})
      : super(key: key);

  ImageButtonBackground.color(
      {Key? key,
      required Color overlayColor,
      double? overlayBottom,
      required Color bodyColor})
      : this(
            key: key,
            bodyColor: bodyColor,
            overlayColor: overlayColor,
            overlayBottom: overlayBottom ?? 8.h,
            leftTopImage: const AssetImage("images/btn_left_top.webp"));

  ImageButtonBackground.disable({Key? key, double? overlayBottom})
      : this.color(
          key: key,
          bodyColor: '#cfcdd4'.toColor(),
          overlayColor: '#dcd9df'.toColor(),
          overlayBottom: overlayBottom,
        );

  ImageButtonBackground.orangeNormal({Key? key, double? overlayBottom})
      : this.color(
          key: key,
          bodyColor: '#ec5511'.toColor(),
          overlayColor: '#ff6f2e'.toColor(),
          overlayBottom: overlayBottom,
        );

  ImageButtonBackground.orangePress({Key? key, double? overlayBottom})
      : this.color(
          key: key,
          bodyColor: '#dd4c0b'.toColor(),
          overlayColor: '#f45c18'.toColor(),
          overlayBottom: overlayBottom,
        );

  ImageButtonBackground.yellowNormal({Key? key, double? overlayBottom})
      : this.color(
          key: key,
          bodyColor: '#ffa800'.toColor(),
          overlayColor: '#ffc75a'.toColor(),
          overlayBottom: overlayBottom,
        );

  ImageButtonBackground.yellowPress({Key? key, double? overlayBottom})
      : this.color(
          key: key,
          bodyColor: '#e99a00'.toColor(),
          overlayColor: '#f9b635'.toColor(),
          overlayBottom: overlayBottom,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: bodyColor,
            borderRadius: BorderRadius.circular(20.h),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          left: 0,
          bottom: overlayBottom,
          child: Container(
            decoration: BoxDecoration(
              color: overlayColor,
              borderRadius: BorderRadius.circular(20.h),
            ),
          ),
        ),
        Positioned(
          left: 9.h,
          top: 5.h,
          child: SizedBox.fromSize(
            size: Size(21.h, 11.h),
            child: FittedBox(
              child: Image(image: leftTopImage),
            ),
          ),
        ),
      ],
    );
  }
}
