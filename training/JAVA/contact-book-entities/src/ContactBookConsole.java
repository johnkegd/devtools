import java.io.IOException;
import java.util.Scanner;

public class ContactBookConsole {
	public static void main(String[] args) {
		var book = new ContactBook();
		try (var scanner = new Scanner(System.in)) {
			var line = scanner.nextLine();
			while (!line.isEmpty()) {
				try {
					processLine(book, line);
				} catch (ContactBookException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				line = scanner.nextLine();
			}
		}
	}

	public static void processLine(ContactBook book, String line) throws ContactBookException, IOException, ClassNotFoundException {
		var parser = new CommandParser(line);
		if (parser.tryRead("load")) {
			parser.checkEnd();
			book.load();
		} else if (parser.tryRead("save")) {
			parser.checkEnd();
			book.addContact("Hans Meier", "Bahnhofstrasse 123, 8001 Zürich");
			book.addNumber("Hans Meier", "043 43 222 11 33", "office");
			book.addNumber("Hans Meier", "079 78 123 45 6", "mobile");
			book.save();
		} else if (parser.tryRead("add")) {
			if (parser.tryRead("contact")) {
				String name = parser.readString();
				String address = parser.readString();
				parser.checkEnd();
				book.addContact(name, address);
			} else if (parser.tryRead("number")) {
				String name = parser.readString();
				String number = parser.readString();
				String description = parser.readString();
				parser.checkEnd();
				book.addNumber(name, number, description);
			} else {
				throw new ContactBookException("Invalid add command");
			}
		} else if (parser.tryRead("find")) {
			var name = parser.readString();
			var contact = book.findContact(name);
			parser.checkEnd();
			if (contact == null) {
				System.out.println("not present");
			} else {
				System.out.println(contact);
			}
		} else {
			throw new ContactBookException("Invalid command");
		}
	}

	static class CommandParser {
		private String line;

		public CommandParser(String line) {
			this.line = line;
		}

		public boolean tryRead(String command) {
			if (line.startsWith(command)) {
				line = line.substring(command.length());
				skipBlanks();
				return true;
			} else {
				return false;
			}
		}

		private void skipBlanks() {
			while (line.startsWith(" ")) {
				line = line.substring(1);
			}
		}

		public void checkEnd() throws ContactBookException {
			if (line.length() == 1) {
				throw new ContactBookException("Premature end of command");
			}
		}

		public String readString() throws ContactBookException {
			if (!tryRead("\"")) {
				throw new ContactBookException("Opening double quote missing");
			}
			int index = line.indexOf('\"');
			if (index < 0) {
				throw new ContactBookException("closing double quote missing");
			}
			var text = line.substring(0, index);
			line = line.substring(index + 1);
			skipBlanks();
			return text;
		}
	}
}
