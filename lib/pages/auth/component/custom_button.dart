import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomButton extends StatelessWidget
{
    final VoidCallback onTap;
    final double? btnWidth;
    final double? btnHeight;
    final String btnText;
    final Color? btnTextColor;
    final double? fontSize;
    final Color btnColor;
    final FontWeight? fontWeight;
    const CustomButton({
        super.key,
        required this.onTap,
        required this.btnText,
        this.btnTextColor = Colors.white,
         this.fontSize = 14,
        this.btnWidth,
        this.btnHeight,
        this.btnColor = Colors.red,  this.fontWeight

    });

    @override
    Widget build(BuildContext context)
    {
        return SizedBox(
            width: btnWidth ?? MediaQuery.of(context).size.width,
          child: ElevatedButton(onPressed: onTap,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      btnWidth ?? MediaQuery.of(context).size.width,
                      btnHeight ?? MediaQuery.of(context).size.height * 0.06
                  ),
                backgroundColor: btnColor,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                )



              ),
              child: Center(

                  child: Text(btnText,
                      style: GoogleFonts.openSans(
                          fontSize: fontSize,
                          color: btnTextColor,
                          fontWeight: fontWeight

                      )
                  )
              )
          ),
        );
    }
}
