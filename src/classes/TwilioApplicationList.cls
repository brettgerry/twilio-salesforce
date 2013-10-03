/**
 * The Class ApplicationList.
 * 
 * For more information see http://www.twilio.com/docs/api/rest/applications
 */
global class TwilioApplicationList extends TwilioResource.ListResource
		implements Iterable<TwilioApplication> {

	/**
	 * Instantiates a new application list.
	 *
	 * @param client the client
	 */
	public TwilioApplicationList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new application list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioApplicationList(TwilioRestClient client, Map<String, String> filters) {
		super(client, filters);
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid() + '/Applications.json';
	}

	/* 
	 * see TwilioResource.ListResource#makeNew()
	 */
	public override Object makeNew(TwilioRestClient client,
			Map<String, Object> params) {
		return new TwilioApplication(client, params);
	}

	/* 
	 * see TwilioResource.ListResource#getListKey()
	 */
	public override String getListKey() {
		return 'applications';
	}

	public TwilioApplication create(Map<String, String> params) {
		return (TwilioApplication)this.createInstance(params);
	}
	
	public List<TwilioApplication> getPageData() {
		List<TwilioApplication> returnList = new List<TwilioApplication>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioApplication) {
				returnList.add((TwilioApplication) o);
			}
		}
		return returnList;
	}
	
	global Iterator<TwilioApplication> iterator() {
		return new TwilioIterator.ApplicationIterator(this);
	}
	
	/**
	 * Delete.
	 *
	 * @return true, if successful
	 * @throws TwilioRestException the twilio rest exception
	 */
	public boolean deleteResource(String sid) {
		TwilioAccount requestAccount = getClient().getAccount(getRequestAccountSid());
		TwilioApplication app = requestAccount.getApplication(sid);
		return app.deleteResource();
	}
}
