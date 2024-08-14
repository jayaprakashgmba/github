public class AccountService {
    public static Account createAccountWithContact(String accountName, String contactFirstName, String contactLastName) {
        // Create a new Account
        Account acc = new Account(Name = accountName);
        insert acc;

        // Create a new Contact related to the Account
        Contact con = new Contact(FirstName = contactFirstName, LastName = contactLastName, AccountId = acc.Id);
        insert con;

        return acc;

    /// testing code
    }
}