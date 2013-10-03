/**
 * The class TwilioSmsList.
 * 
 * For more information see http://www.twilio.com/docs/api/rest/sms
 */
global class TwilioSmsList extends TwilioResource.ListResource implements Iterable<TwilioSms> {
	
	/**
	 * Instantiates a new sms list.
	 *
	 * @param client the client
	 */
	public TwilioSmsList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new sms list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioSmsList(TwilioRestClient client, Map<String, String> filters) {
		super(client, filters);
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid() + '/SMS/Messages.json';
	}

	/* implements method from TwilioResource.ListResource */
	public override Object makeNew(TwilioRestClient client, Map<String, Object> params) {
		return new TwilioSms(client, params);
	}

	/* implements method from TwilioResource.ListResource */
	public override String getListKey() {
		return 'sms_messages';
	}
	
	/**
	 * Send a new SMS message using the supplied parameters
	 *
	 * See http://www.twilio.com/docs/api/rest/sending-sms
	 *   for a list of parameters
	 */
	public TwilioSms create(Map<String, String> params) {
		return (TwilioSms)this.createInstance(params);
	}
	
	public List<TwilioSms> getPageData() {
		List<TwilioSms> returnList = new List<TwilioSms>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioSms) {
				returnList.add((TwilioSms) o);
			}
		}
		return returnList;
	}
	
	global Iterator<TwilioSms> iterator() {
		return new TwilioIterator.SmsIterator(this);
	}

}
