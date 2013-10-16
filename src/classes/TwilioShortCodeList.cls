/**
 * The class TwilioShortCodeList
 * 
 * For more information see http://www.twilio.com/docs/api/rest/shortcodes
 */
global class TwilioShortCodeList extends TwilioResource.ListResource 
	implements Iterable<TwilioShortCode> {

	/**
	 * Instantiates a new incoming phone number list.
	 *
	 * @param client the client
	 */
	public TwilioShortCodeList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new incoming phone number list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioShortCodeList(TwilioRestClient client,
			Map<String, String> filters) {
		super(client, filters);
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid() + '/ShortCodes.json';
	}

	/* implements method from TwilioResource.ListResource */
	public override Object makeNew(TwilioRestClient client,
			Map<String, Object> params) {
		return new TwilioShortCode(client, params);
	}

	/* implements method from TwilioResource.ListResource */
	public override String getListKey() {
		return 'short_codes';
	}
	
	/* returns the current response results page */
	public List<TwilioShortCode> getPageData() {
		List<TwilioShortCode> returnList = new List<TwilioShortCode>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioShortCode) {
				returnList.add((TwilioShortCode) o);
			}
		}
		return returnList;
	}
	
	/* returns an iterator spanning all data pages */
	global Iterator<TwilioShortCode> iterator() {
		return new TwilioIterator.ShortCodeIterator(this);
	}
	
}
