import 'package:flutter/material.dart';
import 'package:get/get.dart';


   SnackBar WSnackbar(texto) => SnackBar(
      content: texto,
      elevation: 9,
      behavior: SnackBarBehavior.floating,
      
      duration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
 
