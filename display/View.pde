class View {
  Utility utility;
  MySQL mysql;
  PApplet main;
  
  Standings standings;
  Heat heat;
  Team team;
  
  int type;
  int type_id;
  
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
        // team 
        break;
      case 2:
        // heat
        break;
      case 3:
        standings.getStandings();
        break;
      default:
        break;
    }
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
