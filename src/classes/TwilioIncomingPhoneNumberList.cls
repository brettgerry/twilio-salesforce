/**
 * The class TwilioIncomingPhoneNumberList.
 * 
 * For more information see http://www.twilio.com/docs/api/rest/incoming-phone-numbers
 */
global class TwilioIncomingPhoneNumberList extends TwilioResource.ListResource
		implements Iterable<TwilioIncomingPhoneNumber> {

	/**
	 * Instantiates a new incoming phone number list.
	 *
	 * @param client the client
	 */
	public TwilioIncomingPhoneNumberList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new incoming phone number list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioIncomingPhoneNumberList(TwilioRestClient client,
			Map<String, String> filters) {
		super(client, filters);
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid() + '/IncomingPhoneNumbers.json';
	}

	/* implements method from TwilioResource.ListResource */
	public override Object makeNew(TwilioRestClient client,
			Map<String, Object> params) {
		return new TwilioIncomingPhoneNumber(client, params);
	}

	/* implements method from TwilioResource.ListResource */
	public override String getListKey() {
		return 'incoming_phone_numbers';
	}
	
	public TwilioIncomingPhoneNumber create(Map<String, String> params) {
		return (TwilioIncomingPhoneNumber)this.createInstance(params);
	}
	
	public List<TwilioIncomingPhoneNumber> getPageData() {
		List<TwilioIncomingPhoneNumber> returnList = new List<TwilioIncomingPhoneNumber>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioIncomingPhoneNumber) {
				returnList.add((TwilioIncomingPhoneNumber) o);
			}
		}
		return returnList;
	}
	
	global Iterator<TwilioIncomingPhoneNumber> iterator() {
		return new TwilioIterator.IncomingPhoneNumberIterator(this);
	}
}
