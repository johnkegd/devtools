package mesajes_app;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MensajesDAO {

	
	
	public static void crearMensajesDB(Mensajes registro) {
	
		Conextion db_connect = new Conextion();
		
		try(Connection conexion = db_connect.get_connection()){
			
			PreparedStatement ps = null;
			
			try{
				String query = "INSERT INTO mensaje (mensaje, autor_mensaje) VALUES (?, ?)";
				ps = conexion.prepareStatement(query);
				ps.setString(1, registro.getMensaje());
				ps.setString(2,	registro.getAutor_mensaje());
				ps.executeUpdate();
				System.out.println("Mensaje Creado Correctamente");
				
			} catch (SQLException ex) {
				System.out.println(ex);
			}
			
		} catch(SQLException e){
			System.out.println(e);
		}
		
		
		
	}
	
	
	public static void leerMensajesDB() {
		Conextion db_connect = new Conextion();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try(Connection conexion = db_connect.get_connection()){
			
			String query = "SELECT * FROM mensaje";
			ps = conexion.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				System.out.println("ID: " + rs.getInt("id_mensajes"));
				System.out.println("Mensaje: " + rs.getString("mensaje"));
				System.out.println("Autor" + rs.getString("autor_mensaje"));
				System.out.println("Fecha: " + rs.getString("fecha_mensaje"));
				System.out.println("");
			}
			
			
		} catch (SQLException e) {
			System.out.println("no se pudieron recuperar los mensajes");
			System.out.println(e);
		}
		
	}
	
	
	public static void borrarMensajeDB(int id_mensaje) {
		
		Conextion db_connect = new Conextion();
		
		
		try(Connection conexion = db_connect.get_connection()){
			
			try {
				PreparedStatement ps = null;
				String query = "DELETE FROM mensaje WHERE id_mensajes = ?";
				ps = conexion.prepareStatement(query);
				ps.setInt(1, id_mensaje);
				ps.executeUpdate();
				System.out.println("Mensaje Eliminado correctamente");
				
				
			} catch (SQLException e) {
				System.out.println(e);
				System.out.println("Error borrando");
				// TODO: handle exception
			}
			
			
		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("Borrado Fallido");
			// TODO: handle exception
		}
		
		
	}
	
	public static void actualizarMensajesDB(Mensajes updater) {
		
		Conextion db_connect = new Conextion();
		
		try(Connection conexion = db_connect.get_connection()){
			PreparedStatement ps = null;
			String query = "UPDATE mensaje SET mensaje = ?, autor_mensaje = ? WHERE id_mensajes = ?";
			ps = conexion.prepareStatement(query);
			ps.setString(1, updater.getMensaje());
			ps.setString(2, updater.getAutor_mensaje());
			ps.setInt(3, updater.getId_mensaje());
			ps.executeUpdate();
			
			System.out.println("Mensaje Aactualizado");
			
		} catch (SQLException e) {
			
			System.out.println(e);
			System.out.println("Falla Acualizando id: " + updater.getId_mensaje());
			// TODO: handle exception
		}
		
		
		
	}
	
	
	
	
}
