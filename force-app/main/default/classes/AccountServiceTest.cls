@isTest
public class AccountServiceTest {
    @isTest
    static void testCreateAccountWithContact() {
        // Set up test data
        String testAccountName = 'Test Account';
        String testContactFirstName = 'John';
        String testContactLastName = 'Doe';

        // Call the method to test
        Account resultAccount = AccountService.createAccountWithContact(testAccountName, testContactFirstName, testContactLastName);

        // Query the database to verify the results
        Account queriedAccount = [SELECT Id, Name FROM Account WHERE Id = :resultAccount.Id LIMIT 1];
        Contact queriedContact = [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId = :resultAccount.Id LIMIT 1];

        // Assert that the account was created correctly
        System.assertNotEquals(null, queriedAccount, 'Account should be created');
        System.assertEquals(testAccountName, queriedAccount.Name, 'Account name should match');

        // Assert that the contact was created correctly
        System.assertNotEquals(null, queriedContact, 'Contact should be created');
        System.assertEquals(testContactFirstName, queriedContact.FirstName, 'Contact first name should match');
        System.assertEquals(testContactLastName, queriedContact.LastName, 'Contact last name should match');
        System.assertEquals(resultAccount.Id, queriedContact.AccountId, 'Contact should be related to the correct Account');
    }

    @isTest
    static void testCreateAccountWithContactWithEmptyNames() {
        // Set up test data with empty names
        String testAccountName = '';
        String testContactFirstName = '';
        String testContactLastName = '';

        // Call the method to test
        try {
            Account resultAccount = AccountService.createAccountWithContact(testAccountName, testContactFirstName, testContactLastName);
            System.assert(false, 'Exception should be thrown for empty names');
        } catch (DmlException e) {
            // Expected exception, check error message
            System.assert(e.getMessage().contains('required fields'), 'Error message should indicate required fields');
        }
       // Call the method to testdfawdWFD  
       /// other method following 
       ///versioning testing
    }
}