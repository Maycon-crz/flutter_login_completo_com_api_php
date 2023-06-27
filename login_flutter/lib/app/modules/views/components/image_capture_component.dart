import 'package:flutter/material.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';

class ImageCaptureComponent extends StatefulWidget {
  final ValueChanged<FilePickerCross?> onImageSelected;
  Color buttonColor;

  ImageCaptureComponent(
      {super.key,
      required this.onImageSelected,
      this.buttonColor = Colors.green});

  @override
  _ImageCaptureComponentState createState() => _ImageCaptureComponentState();
}

class _ImageCaptureComponentState extends State<ImageCaptureComponent> {
  FilePickerCross? _selectedImage;

  void pickImageFromGallery() async {
    try {
      FilePickerCross? result = await FilePickerCross.importFromStorage();
      if (result != null) {
        // Uma imagem foi selecionada
        setState(() {
          _selectedImage = result;
        });
        widget.onImageSelected(result);
      } else {
        // A seleção foi cancelada
        // print("Operação cancelada");
      }
    } catch (e) {
      // Trate o cancelamento da seleção de arquivos aqui
      // print("Operação cancelada");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        elevatedButtomComponent(
          function: () async {
            pickImageFromGallery();
          },
          title: "Escolher uma imagem",
          buttonColor: widget.buttonColor,
          iconColor: Colors.white,
          icon: Icons.image_search,
          minimumSizeWidth: MediaQuery.of(context).size.width,
          maximumSizeWidth: MediaQuery.of(context).size.width,
        ),
        if (_selectedImage != null) ...[
          Text(_selectedImage!.path!),
        ],
      ],
    );
  }
}


// class _ImageCaptureComponentState extends State<ImageCaptureComponent> {
//   void pickImageFromGallery() async {
//     try {
//       FilePickerCross? result = await FilePickerCross.importFromStorage();
//       if (result != null) {
//         // Uma imagem foi selecionada
//         widget.onImageSelected(result);
//       } else {
//         // A seleção foi cancelada
//         print("Operação cancelada");
//       }
//     } catch (e) {
//       // Trate o cancelamento da seleção de arquivos aqui
//       print("Operação cancelada");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return elevatedButtomComponent(
//       function: () async {
//         pickImageFromGallery();
//       },
//       title: "Escolher uma imagem",
//       buttonColor: widget.buttonColor,
//       iconColor: Colors.white,
//       icon: Icons.image_search,
//       minimumSizeWidth: MediaQuery.of(context).size.width,
//       maximumSizeWidth: MediaQuery.of(context).size.width,
//     );
//   }
// }
