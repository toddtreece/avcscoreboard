class Weather {
  Wind wind;
  float temperature;
  float pressure;
  float humidity;

  Weather() {
    this.temperature = 0.0;
    this.pressure = 0.0;
    this.humidity = 0.0;
  }
  
  void init() {
    this.wind = new Wind();
    this.wind.init();
  }
 
}
