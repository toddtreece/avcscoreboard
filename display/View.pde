class View {
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  Standings standings;
  Heat heat;
  Team team;
  
  int type;
  int type_id;
  boolean dev;
  PImage bg;
 
  
  View(PApplet p) {
    this.main = p;
    this.utility = new Utility();
    this.heat = new Heat(this.main);
    this.standings = new Standings(this.main);
    this.team = new Team(this.main);
    this.mysql = new MySQL(this.main, utility.db_host, utility.db_database, utility.db_user, utility.db_pass);
  }
  
  void refresh() {
    this.getType();
    switch(this.type) {
      case 1:
        this.getBackground(false);
        break;
      case 2:
        this.getBackground(false);
        heat.getHeat(this.type_id);
        break;
      case 3:
        this.getBackground(false);
        standings.getStandings();
        break;
      case 4:
        this.getBackground(true);
      default:
        break;
    }
  }

  void getBackground(boolean showWelcome) {
    if(height == 1080) {
      if(showWelcome) {
        this.bg = loadImage("bg_welcome.png");
      } else {
        this.bg = loadImage("bg.png");
      }
    } else {
      if(showWelcome) {
        this.bg = loadImage("bg_welcome_dev.png");
      } else {
        this.bg = loadImage("bg_dev.png");
      }
    }
    background(this.bg);    
  }
  
  void getType() {
    if(this.mysql.connect()) {
      String query;
      query = "SELECT type, type_id ";
      query += "FROM views ";
      query += "WHERE active = 1 ";
      query += "ORDER BY id DESC ";
      query += "LIMIT 1";
      this.mysql.query(query);
      this.mysql.next();
      this.type = this.mysql.getInt("type");
      if(this.type != 3) {
        this.type_id = this.mysql.getInt("type_id");
      } else {
        this.type_id = 0; 
      }
    } else {
      println("MySQL connection failed");
    }
  }
  
}
