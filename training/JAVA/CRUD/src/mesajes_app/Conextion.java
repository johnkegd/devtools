package mesajes_app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conextion {

	
	public Connection get_connection() {
		Connection conection = null;
		try {
			
			conection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mensajes","root","");
		
		
			
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("No he podido conectar la BD");
		}
		
		return conection;
		
		
		
	}
	
}
