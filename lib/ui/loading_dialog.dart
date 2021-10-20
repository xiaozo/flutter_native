import '../channel/dialog_channel.dart';

// void _showLoadDialog(BuildContext context) {
//   final Dialog alert = Dialog(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     child: UnconstrainedBox(
//       constrainedAxis: Axis.vertical,
//       child: Container(
//         padding: EdgeInsets.all(20.h),
//         decoration: BoxDecoration(
//             color: '#444444'.toColor(),
//             borderRadius: BorderRadius.circular(3.h)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               width: 50.h,
//               height: 50.h,
//               child: const CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 backgroundColor: Colors.black54,
//               ),
//             ),
//             Container(
//                 margin: EdgeInsets.only(top: 5.h),
//                 child: Text(
//                   "正在加载",
//                   style: TextStyle(fontSize: 15.sph, color: Colors.white),
//                 )),
//           ],
//         ),
//       ),
//     ),
//   );
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// void _hideLoadDialog(BuildContext context) {
//   Navigator.of(context).pop();
// }

// const _kShowDialogKey = "showDialog";

Future<void> showGlobalDialog({String? pageUniqueId, String? msg}) async {
  // if (Platform.isAndroid) {
  //   // android 对话框由原生显示
  //   callNative(
  //       pageUniqueId != null ? pageUniqueId : "", {_kShowDialogKey: true},
  //       canPop: false);
  //   return;
  // }
  // final context = appContext;
  // if (context != null) _showLoadDialog(context);
  FDialog dialog = FDialog();
  dialog.msg = msg;
  dialog.uniqueId = pageUniqueId;
  try {
    await DialogHostApi().show(dialog);
  } catch (e) {}
}

void hideGlobalDialog({String? pageUniqueId}) {
  // if (Platform.isAndroid) {
  //   // android 对话框由原生显示
  //   callNative(
  //       pageUniqueId != null ? pageUniqueId : "", {_kShowDialogKey: false},
  //       canPop: false);
  //   return;
  // }
  // final context = appContext;
  // if (context != null) _hideLoadDialog(context);
  try {
    DialogHostApi().hide();
  } catch (e) {}
}
