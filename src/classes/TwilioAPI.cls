/**
 * Entry point for accessing Twilio resources that are pre-configured
 * with credentials from the Twilio Config custom setting (TwilioConfig__c).
 *
 * To set up your Twilio credentials:
 *   1. Get a Twilio account at http://www.twilio.com/try-twilio
 *   2. Find your Twilio Account Sid and Auth Token at https://www.twilio.com/user/account
 *   3. Log into Salesforce and go to:  Setup | Develop | Custom Settings | Manage Twilio Config
 *   4. Create a new Twilo Config instance
 *   5. Copy and paste your Account Sid and Auth Token and click Save
 *
 * NOTE: The Application Sid field is for use with the Twilio Client softphone
 *       SDK for Javascript.  It is not required for the rest of the Twilio API.
 *
 * Now you can get easy access to Twilio from your Apex code by calling:
 *
 *   TwilioRestClient restClient = TwilioAPI.getDefaultClient();
 *   restClient.getAccount().getCalls(); 
 *   // etc.  
 */
global class TwilioAPI {

	private class MissingTwilioConfigCustomSettingsException extends Exception {}

	private static TwilioRestClient client;
	
    private TwilioAPI() {}
    
    /**
     * Get a TwilioRestClient pre-populated with your TwilioConfig credentials
     */
    public static TwilioRestClient getDefaultClient() {
    	if (client==null) {
    		TwilioConfig__c twilioCfg = getTwilioConfig();
	    	TwilioAPI.client = new TwilioRestClient(twilioCfg.AccountSid__c, twilioCfg.AuthToken__c);
    	}
	   	return TwilioAPI.client;
    }
    
    /**
     * Get your primary account using your TwilioConfig credentials
     */
    public static TwilioAccount getDefaultAccount() {
    	return getDefaultClient().getAccount();
    }
    
    /**
     * Get a new Twilio Client capability token generator pre-populated
     * with your TwilioConfig credentials
     */
    public static TwilioCapability createCapability() {
		TwilioConfig__c twilioCfg = getTwilioConfig();
		return new TwilioCapability(twilioCfg.AccountSid__c, twilioCfg.AuthToken__c);    	
    }
    
    /**
     * Get a new TwilioRestClient authorized with the credentials provided
     */
    public static TwilioRestClient createClient(String accountSid, String authToken) {
    	return new TwilioRestClient(accountSid, authToken);
    }
    
    /**
     * Load the org default TwilioConfig record
     */
    public static TwilioConfig__c getTwilioConfig() {
    	TwilioConfig__c twilioCfg;
    	if (Test.isRunningTest()) {
    		twilioCfg = new TwilioConfig__c();
    		twilioCfg.AccountSid__c = 'ACba8bc05eacf94afdae398e642c9cc32d'; // dummy sid
    		twilioCfg.AuthToken__c = '12345678901234567890123456789012';    // dummy token
    	} else {
    		twilioCfg = TwilioConfig__c.getOrgDefaults();
	    	if (twilioCfg==null)
	    		throw new MissingTwilioConfigCustomSettingsException('Please enter your Twilio account credentials under Twilio Config custom settings (go to Setup | Develop | Custom Settings | Manage Twilio Config)');
    	}
   		return twilioCfg;
    }

    
    @isTest
    static void test_TwilioAPI() {
		System.assertEquals('ACba8bc05eacf94afdae398e642c9cc32d', TwilioAPI.getTwilioConfig().AccountSid__c);
		System.assertEquals('12345678901234567890123456789012', TwilioAPI.getTwilioConfig().AuthToken__c);
		System.assertEquals('ACba8bc05eacf94afdae398e642c9cc32d', TwilioAPI.getDefaultClient().getAccountSid());
		System.assertEquals('ACba8bc05eacf94afdae398e642c9cc32d', TwilioAPI.getDefaultClient().getAccount().getSid());
		System.assertEquals('ACba8bc05eacf94afdae398e642c9cc32d', TwilioAPI.getDefaultAccount().getSid());
	}
	
}
