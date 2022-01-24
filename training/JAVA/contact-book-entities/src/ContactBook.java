import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class ContactBook implements Serializable {
	private final Map<String, Contact> contactBook = new HashMap<>();

	public void load() throws ContactBookException, IOException, ClassNotFoundException {
		// TODO: Implement
		FileInputStream fileIn = new FileInputStream("contacs.sf");
		ObjectInputStream in = new ObjectInputStream(fileIn);
		Contact contact = (Contact) in.readObject();
		System.out.println(contact.toString());
		in.close();
		fileIn.close();
	}

	public void save() throws ContactBookException, IOException {
		// TODO: Implement
		FileOutputStream fileOut = new FileOutputStream("contacs.sf");
		ObjectOutputStream out = new ObjectOutputStream(fileOut);
		out.writeObject(contactBook);
		out.close();
		fileOut.close();
		System.out.println("Data Saved");
	}

	public void addContact(String name, String address) {
		if (contactBook.containsKey(name)) {
			throw new IllegalArgumentException("Name already exists");
		}
		contactBook.put(name, new Contact(name, address));
	}

	public void addNumber(String name, String number, String description) {
		if (!contactBook.containsKey(name)) {
			throw new IllegalArgumentException("Name does not exist");
		}
		Contact contact = contactBook.get(name);
		contact.addPhoneEntry(new PhoneEntry(number, description));
	}

	public Contact findContact(String name) {
		return contactBook.get(name);
	}
}