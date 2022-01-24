import java.io.IOException;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;



public class Main {

	
	public static void main (String[] args) throws IOException{
		
		mainMenu();
		
	}
	
	public static void mainMenu() throws IOException {
		ImageIcon icon = new ImageIcon("icon/cat.png");
		String[] btn = {"Ver Gatos","Favoritos","Salir"};

		
		int respose = JOptionPane.showOptionDialog(null, "Elije una Opcion", "Menu", 0, JOptionPane.DEFAULT_OPTION, icon, btn, btn[0]);
		
		switch(respose) {
		case 0:
			GatosService.verGatos();
			break;
		case 1:
			GatosService.verFavoritos();
			break;
		case 2:
			System.out.println("saliendo");
			System.exit(0);
			break;
		default:
			System.out.println("Finalizando");
			break;
		
		
		
		}
	}
	
	
	
	
}
