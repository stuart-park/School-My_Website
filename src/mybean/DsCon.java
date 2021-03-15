package mybean;

import javax.naming.*;
import java.sql.*;
import javax.sql.DataSource;

public class DsCon {
	
	public static Connection getConnection() throws SQLException, NamingException{
		Context initContext=new InitialContext();
		DataSource ds =(DataSource) initContext.lookup("java:/comp/env/jdbc/mydbTest");
		
		return ds.getConnection();
	}
}
