import 'package:ecommercegetxyape/app/ui/global_widgets/wsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget methodpayW(BuildContext context, Icon icon, String texto) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).accentColor),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Text(
          texto,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        IconButton(
            onPressed: () {
              Clipboard.setData(new ClipboardData(text: texto));
              ScaffoldMessenger.of(context)
                  .showSnackBar(WSnackbar(Text("Copiado")));
            },
            icon: Icon(Icons.copy))
      ],
    ),
  );
}
