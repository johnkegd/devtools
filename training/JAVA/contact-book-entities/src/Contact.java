import java.util.Collection;
import java.util.HashSet;
import java.util.Objects;

public class Contact {
	private final String name;
	private final String address;
	private final Collection<PhoneEntry> numbers;

	public Contact(String name, String address) {
		this.name = name;
		this.address = address;
		this.numbers = new HashSet<PhoneEntry>();
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public void addPhoneEntry(PhoneEntry entry) {
		numbers.add(entry);
	}

	public Collection<PhoneEntry> getPhoneEntries() {
		return numbers;
	}

	@Override
	public String toString() {
		return "Contact [name=" + name + ", address=" + address + ", numbers= " + numbers + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, name, numbers);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Contact other = (Contact) obj;
		return Objects.equals(address, other.address) && Objects.equals(name, other.name)
				&& Objects.equals(numbers, other.numbers);
	}
}
