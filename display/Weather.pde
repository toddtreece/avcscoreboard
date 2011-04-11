class Weather {
  Wind wind;
  Temperature temperature;
  Pressure pressure;
  Humidity humidity;
  PApplet main;
  Serial usbPort;

  int lf = 10;
  String data = null;
  
  Weather(PApplet p) {
    this.main = p;
    this.pressure = new Pressure();
    this.humidity = new Humidity();
    this.temperature = new Temperature();
    this.wind = new Wind();
    this.usbPort = new Serial(this.main, Serial.list()[0], 9600);
    this.usbPort.clear();
  }
  
  void init() {
    this.wind.init();
    this.readData();
  }
  
  void readData() {
    while (this.usbPort.available() > 0) {
      this.data = this.usbPort.readStringUntil(this.lf);
    }
    this.processData();
  }
  
  void processData() {
    if(this.data != null) {
      int end = this.data.indexOf("$");
      String tempData = this.data.substring(1, end);
      String[] dataArray = split(tempData,',');
      this.wind.setDirection(float(dataArray[7]));
      this.wind.setSpeed(float(dataArray[6]));
      this.temperature.setTemperature(float(dataArray[2]));
      this.humidity.setHumidity(float(dataArray[1]));
      this.pressure.setPressure(float(dataArray[3]));
    }
  }
  
}
