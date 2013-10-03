/**
 * The Class MediaList.
 *
 *  For more information see https://www.twilio.com/docs/api/rest/media
 */
global class MediaList extends TwilioResource.ListResource implements Iterable<TwilioMedia> {

	private String requestMessageSid;

	/**
	 * Instantiates a new media list.
	 *
	 * @param client the client
	 */
	public TwilioMediaList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new media list.
	 *
	 * @param client the client
	 * @param messageSid the sid of the parent message requesting media
	 */
	public TwilioMediaList(TwilioRestClient client, String messageSid) {
		super(client);
		this.requestMessageSid = messageSid;
	}

	/**
	 * Instantiates a new media list.
	 *
	 * @param client the client
	 * @param properties the properties
	 */
	public TwilioMediaList(TwilioRestClient client, Map<String, String> filters) {
		super(client, filters);
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		if (this.requestMessageSid != null) {
			return '/' + TwilioRestClient.DEFAULT_VERSION
				+ '/Accounts/' + this.getRequestAccountSid()
				+ '/Messages/' + this.getRequestMessageSid()
				+ '/Media.json';

		} else {
			return '/' + TwilioRestClient.DEFAULT_VERSION
				+ '/Accounts/' + this.getRequestAccountSid()
				+ '/Media.json';
		}
	}

	/* implements method from TwilioResource */
	public override TwilioMedia makeNew(TwilioRestClient client, Map<String, Object> params) {
		return new TwilioMedia(client, params);
	}

	/* implements method from TwilioResource */
	public override String getListKey() {
		return 'media';
	}

	/**
	 * Gets the message sid of this media *if* it was initially referenced
	 * as the child of a message.
	 *
	 * @return the message sid of the parent message
	 */
	public String getRequestMessageSid() {
		return this.requestMessageSid;
	}

	public List<TwilioMedia> getPageData() {
		List<TwilioMedia> returnList = new List<TwilioMedia>();

		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioMedia) {
				returnList.add((TwilioMedia) o);
			}
		}
		return returnList;
	}

	global Iterator<TwilioMedia> iterator() {
		return new TwilioIterator.MediaIterator(this);
	}

}
