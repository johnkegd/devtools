package mesajes_app;

import java.util.Scanner;


public class Main {

	public static void main(String [] args){
		
		Scanner sc = new Scanner(System.in);
		
		
		int opcion = 0;
		
		do {
			
			System.out.println("----------------");
			System.out.println("Aplicacion de mensajes");
			System.out.println("1. crear mensaje");
			System.out.println("2. listar mensajes");
			System.out.println("3. editar mensaje");
			System.out.println("4. eliminar mensaje");
			System.out.println("5. salir");
			
			opcion = Integer.parseInt(sc.nextLine());
			
			
			switch(opcion) {
			
			case 1:
				MensajeService.crearMensaje();
				break;
			case 2:
				MensajeService.listarMensajes();
				break;
			case 3:
				MensajeService.editarMensajes();
				break;
			case 4:
				MensajeService.borrarMensajes();
				break;
				
			default:
				System.out.println("Opcion No incluida (Error)");
				break;
			
			
			
			}
			
			
			
		}while(opcion !=5);
		
		
		
		
		
		
		
	}
	
	
	
}
