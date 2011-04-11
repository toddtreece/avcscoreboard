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
  
  void refresh() {
    if (this.mysql.connect()) {
      String query = "SELECT b.name, l.lap_time, t.city, t.state, l.disqualified ";
      query += "FROM laps l ";
      query += "JOIN heats h ON h.id = l.heats_id ";
      query += "JOIN bots b ON b.id = l.bots_id ";
      query += "JOIN teams t ON t.id = b.teams_id ";
      query += "WHERE h.bot_types_id = " + str(this.botType) + " ";
      query += "ORDER BY l.disqualified ASC, l.corners_completed DESC, l.lap_time ASC ";
      query += "LIMIT 0,4";
      this.mysql.query(query);
      int x = 150;
      int y = 250;
      while (this.mysql.next()) {
        this.printRow(x,y);
        y += 160;
      }
    } else {
      println("MySQL connection failed");
    }
  }
  
  void printRow(int x, int y) {
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(70)
      )
    );
    textAlign(LEFT);
    fill(utility.white);
    String tempText;
    int disqualified = this.mysql.getInt("l.disqualified");
    if(disqualified == 0) {
      tempText = this.mysql.getString("l.lap_time").substring(3,8) + "  ";
    } else {
      tempText = "DNF    "; 
    }
    tempText += this.mysql.getString("b.name");

    text(
      tempText,
      utility.calculateWidth(x), 
      utility.calculateHeight(y)
    );
    tempText = this.mysql.getString("t.city") + ", " + this.mysql.getString("t.state");
    text(
      tempText,
      utility.calculateWidth(x+255),
      utility.calculateHeight(y+70)
    );
  }
  
}
