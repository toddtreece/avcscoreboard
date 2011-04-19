class Heat {
  
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  Heat(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.mysql = new MySQL(this.main, utility.db_host, utility.db_database, utility.db_user, utility.db_pass);
  }
  
  int getBotType(int heat_id) {
    String query;
    query = "SELECT bot_types_id FROM heats WHERE id = " + heat_id;
    this.mysql.query(query);
    this.mysql.next();
    return this.mysql.getInt("bot_types_id");
  }

  void drawLabel() {
    String labelText;
    labelText = "UP NEXT";
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

  void getHeat(int id) {
    this.drawLabel();
    if(this.mysql.connect()) {
      String query = "";
      query += "SELECT y.* ";
      query += "FROM ( ";
      query += "SELECT x.*, @rownum:=@rownum+1 AS rank ";
      query += "FROM ( ";
      query += "SELECT h.id as heat_id, b.id as bot_id, l.id as lap_id, b.name, l.lap_time, t.city, t.state, l.disqualified, ";
      query += "SEC_TO_TIME( ";
      query += "TIME_TO_SEC(l.lap_time) - ";
      query += "( ";
      query += "IF(l.bonus_landlot = 1, 10, 0) + ";
      query += "IF(l.bonus_landbox = 1, 30, 0) + ";
      query += "IF(l.bonus_takeoff = 1, 30, 0) + ";
      query += "IF(l.bonus_ring = 1, 30, 0) ";
      query += ") ";
      query += ") as bonus_time, ";
      query += "( ";
      query += "l.bonus_landlot + ";
      query += "l.bonus_landbox + ";
      query += "l.bonus_takeoff + ";
      query += "l.bonus_ring ";
      query += ") as bonus_count ";
      query += "FROM laps l ";
      query += "RIGHT JOIN bots b ON b.id = l.bots_id ";
      query += "RIGHT JOIN heats h ON h.id = b.heats_id ";
      query += "RIGHT JOIN teams t ON t.id = b.teams_id ";
      query += "WHERE h.bot_types_id = " + this.getBotType(id) + " ";
      query += "ORDER BY l.disqualified ASC, l.corners_completed DESC, ";
      query += "bonus_time ASC ";
      query += ") x, (SELECT @rownum := 0) AS r  ";
      query += ") y ";
      query += "WHERE heat_id = " + id + " ";
      query += "ORDER BY `name` ASC, lap_id ASC ";
      this.mysql.query(query);
      int x = 140;
      int y = 250;
      int last = 0;
      while (this.mysql.next()) {
        y = this.printRow(x,y,last);
        last = this.mysql.getInt("bot_id");
      }
      
    }
  }
  
  int printRow(int x, int y, int last) {
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(100)
      )
    );
    textAlign(LEFT);
    fill(utility.white);
    String tempText;
    tempText = this.mysql.getString("name");
    if(this.mysql.getInt("bot_id") != last) {
      text(
        tempText,
        utility.calculateWidth(x), 
        utility.calculateHeight(y)
      );
      y += 85;
    }
    if(this.mysql.getString("bonus_time") != null) {
       
    }
    return y;
  }
  
}
