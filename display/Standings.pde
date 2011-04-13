class Standings {
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  int botType = 2;
  
  Standings(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.mysql = new MySQL(this.main, utility.db_host, utility.db_database, utility.db_user, utility.db_pass);
  } 
  
  void drawLabel() {
    String labelText;
    if(this.botType == 1) {
      labelText = "AERIAL";
    } else {
      labelText = "GROUND";
    }

    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(150)
      )
    );
    textAlign(CENTER);
    fill(utility.white);
    pushMatrix();
    translate(
      utility.calculateWidth(1690),
      utility.calculateHeight(475)
    );
    rotate(radians(90));
    text(
      labelText,
      0, 
      0
    );
    popMatrix();
  }
  
  void getStandings() { 
    this.drawLabel();
    if (this.mysql.connect()) {
      String query;
      query = "SELECT x.*, @rownum:=@rownum+1 AS rank ";
      query += "FROM ( ";
      query += "SELECT b.name, l.lap_time, t.city, t.state, l.disqualified, ";
      query += "CalculateBonusTime(l.lap_time, l.bonus_landlot, l.bonus_landbox, l.bonus_takeoff, l.bonus_ring) as bonus_time ";
      query += "FROM laps l ";
      query += "JOIN bots b ON b.id = l.bots_id ";
      query += "JOIN heats h ON h.id = b.heats_id ";
      query += "JOIN teams t ON t.id = b.teams_id ";
      query += "WHERE h.bot_types_id = " + str(this.botType) + " ";
      query += "ORDER BY l.disqualified ASC, l.corners_completed DESC, ";
      query += "bonus_time ASC ";
      query += "LIMIT 0,4 ) x, (SELECT @rownum := 0) AS r";
      this.mysql.query(query);
      int x = 140;
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
    int disqualified = this.mysql.getInt("disqualified");
    tempText = "#" + this.mysql.getString("rank") + "  ";
    tempText += this.mysql.getString("name");
    text(
      tempText,
      utility.calculateWidth(x), 
      utility.calculateHeight(y)
    );
    tempText = this.mysql.getString("city") + ", " + this.mysql.getString("state");
    if(disqualified == 0) {
      tempText += " (" + this.mysql.getString("bonus_time").substring(3,8) + ")";
    } else {
      tempText += " (DNF)";
    }
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(50)
      )
    );
    text(
      tempText,
      utility.calculateWidth(x+142),
      utility.calculateHeight(y+55)
    );
  }
  
}
