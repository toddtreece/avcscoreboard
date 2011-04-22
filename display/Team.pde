class Team {
  
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  Team(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.mysql = new MySQL(this.main, utility.db_host, utility.db_database, utility.db_user, utility.db_pass);
  }
  
  void getTeam(int id) {
    this.drawLabel();
        if(this.mysql.connect()) {
      String query = "";
      query += "SELECT y.* ";
      query += "FROM ( ";
      query += "SELECT x.*, @rownum:=@rownum+1 AS rank ";
      query += "FROM ( ";
      query += "SELECT t.id as teams_id, h.id as heat_id, b.id as bot_id, l.id as lap_id, b.pass, b.name, l.lap_time, t.city, t.state, ";
      query += "IF(l.disqualified IS NULL, 1, l.disqualified) as disqualified, ";
      query += "SEC_TO_TIME( ";
      query += "TIME_TO_SEC(l.lap_time) - ";
      query += "( ";
      query += "IF(l.bonus_landlot = 1, 10, 0) + ";
      query += "IF(l.bonus_landbox = 1, 30, 0) + ";
      query += "IF(l.bonus_takeoff = 1, 10, 0) + ";
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
      query += "ORDER BY disqualified ASC, corners_completed DESC, ";
      query += "bonus_time ASC ";
      query += ") x, (SELECT @rownum := 0) AS r  ";
      query += ") y ";
      query += "WHERE teams_id = " + id + " ";
      query += "ORDER BY `name` ASC, lap_id ASC ";
      String members = this.getMembers(id);
      this.mysql.query(query);
      int x = 140;
      int y = 265;
      int last = 0;
      while (this.mysql.next()) {
        y = this.printRow(x,y,last, members);
        last = this.mysql.getInt("bot_id");
      }
    }
  }
  
  int getBotType(int team_id) {
    String query;
    query = "SELECT h.bot_types_id ";
    query += "FROM heats h ";
    query += "JOIN bots b ON b.heats_id = h.id ";
    query += "JOIN teams t ON t.id = b.teams_id ";
    query += "WHERE t.id = " + team_id;
    this.mysql.query(query);
    this.mysql.next();
    return this.mysql.getInt("bot_types_id");
  }
  
  void drawLabel() {
    String labelText;
    labelText = "TEAM INFO";
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(115)
      )
    );
    textAlign(CENTER);
    fill(utility.white);
    pushMatrix();
    translate(
      utility.calculateWidth(1710),
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
  
  int printRow(int x, int y, int last, String members) {
     textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(110)
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
      textFont(
        createFont(
          "Arial-Black", 
          utility.calculateHeight(50)
        )
      );
      y += 62;
      text(
        members,
        utility.calculateWidth(x),
        utility.calculateHeight(y)
      );
      tempText = "From: " + this.mysql.getString("city") + ", " + this.mysql.getString("state");
      y += 56;
      text(
        tempText,
        utility.calculateWidth(x),
        utility.calculateHeight(y)
      );
      if(this.mysql.getString("bonus_time") != null) {
         y = drawRunsLabel(y);
         textFont(
          createFont(
            "Arial-Black", 
            utility.calculateHeight(50)
          )
        );
        textAlign(CENTER);
        fill(utility.white);
        y += 62;
        tempText = "Rank #" +  this.mysql.getString("rank") + " @ " + this.mysql.getString("bonus_time").substring(3,8);
        text(
          tempText,
          utility.calculateWidth(960),
          utility.calculateHeight(y)
        );
      }
    } else {
      if(this.mysql.getString("bonus_time") != null) {
         textFont(
          createFont(
            "Arial-Black", 
            utility.calculateHeight(50)
          )
        );
        textAlign(CENTER);
        fill(utility.white);
        y += 62;
        tempText = "Rank #" +  this.mysql.getString("rank") + " @ " + this.mysql.getString("bonus_time").substring(3,8);
        text(
          tempText,
          utility.calculateWidth(960),
          utility.calculateHeight(y)
        );
      }
    }
    return y;
  }
  
  int drawRunsLabel(int y) {
    String labelText;
    labelText = "RUNS";
    textFont(
      createFont(
        "Arial-Black", 
        utility.calculateHeight(75)
      )
    );
    textAlign(CENTER);
    fill(utility.white);
    y += 100;
    text(
      labelText,
      utility.calculateWidth(960),
      utility.calculateHeight(y)
    );
    return y;
  }
  
  String getMembers(int id) {
    String query;
    query = "SELECT firstname, lastname ";
    query += "FROM team_members ";
    query += "WHERE teams_id = " + id;
    this.mysql.query(query);
    String members = "";
    Boolean multiple = false;
    while (this.mysql.next()) {
      if(multiple == true) {
        members += ", "; 
      }
      members += this.mysql.getString("firstname") + " " + this.mysql.getString("lastname") ;
      multiple = true;
    }
    return members;
  }
  
}
