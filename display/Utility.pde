class Utility {
  
  color lightRed = #EE3524;
  color darkRed = #8A1F03;
  color grey = #D0D2D3;
  color white = #FFFFFF;
  
  int calculateHeight(int pixel_height) {
    float h = pixel_height / 1080.0;
    h = height * h;
    return round(h);
  }
  
  int calculateWidth(int pixel_width) {
    float w = pixel_width / 1920.0;
    w = width * w;
    return round(w);
  }
  
}
