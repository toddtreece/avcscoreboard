class Standings {
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  int botType = 1;
  String user = "root";
  String pass = "";
  String database = "avc_development";
  String host = "localhost";
  
  Standings(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.mysql = new MySQL(this.main, this.host, this.database, this.user, this.pass);
  } 
  
  void getStandings() {
    if (this.mysql.connect()) {
      /*this.mysql.query("SELECT ");
      while (msql.next()) {
        String s = msql.getString("bots_name");
        int n = msql.getInt("");
      }*/
    } else {
      println("MySQL connection failed");
    }
  }
}
