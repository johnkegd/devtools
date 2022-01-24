import java.util.Objects;

public class PhoneEntry {
	private final String number;
	private final String description;

	public PhoneEntry(String number, String description) {
		this.number = number;
		this.description = description;
	}

	public String getNumber() {
		return number;
	}

	public String getDescription() {
		return description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, number);
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
		PhoneEntry other = (PhoneEntry) obj;
		return Objects.equals(description, other.description) && Objects.equals(number, other.number);
	}

	@Override
	public String toString() {
		return description + ": " + number;
	}
}
