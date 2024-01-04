import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/services/predict_services.dart';
import 'package:njha_bird_detect/app/shared/widgets/toast.dart';

class PredictProvider extends ChangeNotifier {
  File? _imageFile;
  File? get imageFile => _imageFile;

  final _picker = ImagePicker();
  ImagePicker get picker => _picker;

  List<Bird> _result = [];
  List<Bird> get result => _result;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future getImage(ImageSource src, context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final pickedFile = await picker.pickImage(source: src);
      if (pickedFile != null) {
        Navigator.pushNamed(context, '/result');
        final file = File(pickedFile.path);
        var resultPredict = await handlePrediction(file);
        _imageFile = file;
        _result = resultPredict;
        _isLoading = false;
        notifyListeners();
      } else {
        showToast(context, "You did not select the image");
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      Navigator.pop(context);
      showToast(context, "Something went wrong...");
      _isLoading = false;
      notifyListeners();
    }
  }

  void backToHome(context) {
    Navigator.pop(context);
    _isLoading = false;
    _imageFile = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _imageFile = null;
    _result = [];
    notifyListeners();
    super.dispose();
  }
}
