import 'package:flutter/material.dart';

import 'AppCustomDialog.dart';
import 'ShImageConstants.dart';
const verticalmargin20 =  SizedBox(height: 20.0,);

showAlert(String message,BuildContext context)
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) =>
        CustomDialog(
          title: "Alert",
          description: message,
          buttonText: "Okay",
          image: ic_alert,
          onTap: () {
            Navigator.pop(context);
          },
          colors: Colors.red,
        ),
  );


}

// showAlertSuccess(String message,BuildContext context)
// {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) =>
//         CustomDialog(
//           title: "Alert",
//           description: message,
//           buttonText: "Okay",
//           image: ic_success,
//           onTap: () {
//             Navigator.pop(context);
//             Navigator.pop(context);
//           },
//           colors: Colors.red,
//         ),
//   );
// }