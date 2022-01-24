package mesajes_app;
import java.util.Scanner;


public class MensajeService {
	
	
	public static void crearMensaje() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Escribe tu mensaje: ");
		String mensaje = sc.nextLine();
		
		System.out.println("Tu nombre: ");
		String nombre = sc.nextLine();
		
		
		Mensajes registro = new Mensajes();
		registro.setMensaje(mensaje);
		registro.setAutor_mensaje(nombre);
		
		MensajesDAO.crearMensajesDB(registro);
		
	}
	
	public static void listarMensajes() {
	
		MensajesDAO.leerMensajesDB();
		
	}
	
	public static void borrarMensajes() {
		System.out.println("Borrar un Mensaje");
		Scanner sc = new Scanner(System.in);
		System.out.println("Introduce el Id: ");
		
		int id = Integer.parseInt(sc.nextLine());
		MensajesDAO.borrarMensajeDB(id);
		
		
	}
	
	public static void editarMensajes() {
		System.out.println("editando mensaje xd");
		Scanner sc = new Scanner(System.in);
		System.out.println("Introduce el id para Modificar: ");
		int id_update = Integer.parseInt(sc.nextLine());
		System.out.println("Nuevo mensaje: ");
		String mensaje = sc.nextLine();
		System.out.println("Autor: ");
		String autor = sc.nextLine();
		
		Mensajes updater = new Mensajes();
		updater.setMensaje(mensaje);
		updater.setAutor_mensaje(autor);
		updater.setId_mensaje(id_update);
		
		MensajesDAO.actualizarMensajesDB(updater);
		
		
		
	}
	
	
	

}
