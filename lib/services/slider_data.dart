
import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliders(){
  List<SliderModel> sliders = [];


  sliders.add(SliderModel(image: 'assets/images/health.jpg', name: 'Bow To The Authority of Silenforce.'));
  sliders.add(SliderModel(image: 'assets/images/sports.jpg', name: 'Bow To The Authority of Silenforce.'));
  sliders.add(SliderModel(image: 'assets/images/business.jpg', name: 'Bow To The Authority of Silenforce.'));
  sliders.add(SliderModel(image: 'assets/images/entertainment.jpg', name: 'Bow To The Authority of Silenforce.'));

  return sliders;
}