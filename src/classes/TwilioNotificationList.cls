/**
 * The Class NotificationList.
 * 
 * For more information see http://www.twilio.com/docs/api/rest/notification
 */
global class TwilioNotificationList extends TwilioResource.ListResource
	implements Iterable<TwilioNotification> {

	private String parentCallSid;

	/**
	 * Instantiates a new notification list.
	 *
	 * @param client the client
	 */
	public TwilioNotificationList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new notification list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioNotificationList(TwilioRestClient client, Map<String, String> filters) {
		super(client, filters);
	}
	
	/**
	 * Instantiates a new notification list under a Call resource.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioNotificationList(TwilioRestClient client, String parentCallSid) {
		super(client);
		this.parentCallSid = parentCallSid;
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid()
				+ (this.parentCallSid!=null ? ('/Calls/'+this.parentCallSid) : '')
				+ '/Notifications.json';
	}

	/* implements method from TwilioResource.ListResource */
	public override Object makeNew(TwilioRestClient client,
			Map<String, Object> params) {
		return new TwilioNotification(client, params);
	}

	/* implements method from TwilioResource.ListResource */
	public override String getListKey() {
		return 'notifications';
	}
	
	/* returns the current response results page */
	public List<TwilioNotification> getPageData() {
		List<TwilioNotification> returnList = new List<TwilioNotification>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioNotification) {
				returnList.add((TwilioNotification) o);
			}
		}
		return returnList;
	}
	
	/* returns an iterator spanning all data pages */
	global Iterator<TwilioNotification> iterator() {
		return new TwilioIterator.NotificationIterator(this);
	}
}
