    val proPath = System.getProperty("user.dir")
    val url = s"jdbc:sqlite://$proPath/cs.db"
    val con = DriverManager.getConnection(url)
    val stmt = con.createStatement()
    stmt.execute("CREATE TABLE cs (id int, name varchar(20))")
    stmt.close()
    con.close()