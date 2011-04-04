class Weather {
  Wind wind;
  Temperature temperature;
  Pressure pressure;
  Humidity humidity;

  Weather() {
    this.pressure = new Pressure();
    this.humidity = new Humidity();
    this.temperature = new Temperature();
    this.wind = new Wind();
  }
  
  void init() {
    this.wind.init();
  }
  
}
