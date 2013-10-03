/**
 * The class TwilioMessage
 * 
 * For more information see http://www.twilio.com/docs/api/rest/sms
 */
global class TwilioMessage extends TwilioResource.InstanceResource {

	/** The Constant SID_PROPERTY. */
	private static final String SID_PROPERTY = 'sid';

	/**
	 * Instantiates a new message.
	 *
	 * @param client the client
	 */
	public TwilioMessage(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new message.
	 *
	 * @param client the client
	 * @param sid the sid
	 */
	public TwilioMessage(TwilioRestClient client, String sid) {
		super(client);
		this.setProperty(SID_PROPERTY, sid);
	}

	/**
	 * Instantiates a new message.
	 *
	 * @param client the client
	 * @param properties the properties
	 */
	public TwilioMessage(TwilioRestClient client, Map<String, Object> properties) {
		super(client, properties);
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
			+ this.getRequestAccountSid() + '/Messages/' + this.getSid() + '.json';
	}

	/*
	 * Property getters
	 */

	/**
	 * Gets the sid.
	 *
	 * @return the sid
	 */
	public String getSid() {
		return this.getProperty(SID_PROPERTY);
	}


	/**
	 * Returns the a list of media.
	 *
	 * @return the MediaList associated with this message
	 */
	public TwilioMediaList getMedia() {
		TwilioMediaList mediaList = new TwilioMediaList(this.getClient(), this.getSid());
		mediaList.setRequestAccountSid(this.getRequestAccountSid());
		return mediaList;
	}


	/**
	 * Returns the a list of media.
	 *
	 * @param the sid of a media instance associated with this message
	 * @return the MediaList associated with this message
	 */
	public TwilioMedia getMedia(String mediaSid) {
		TwilioMedia media = new TwilioMedia(this.getClient(), this.getSid(), mediaSid);
		media.setRequestAccountSid(this.getRequestAccountSid());
		return media;
	}

	/**
	 * Gets the date created.
	 *
	 * @return the date created
	 */
	public Datetime getDateCreated() {
		return this.getPropertyDatetime('date_created');
	}

	/**
	 * Gets the date updated.
	 *
	 * @return the date updated
	 */
	public Datetime getDateUpdated() {
		return this.getPropertyDatetime('date_updated');
	}

	/**
	 * Gets the date sent.
	 *
	 * @return the date sent
	 */
	public Datetime getDateSent() {
		return this.getPropertyDatetime('date_sent');
	}

	/**
	 * Gets the account sid.
	 *
	 * @return the account sid
	 */
	public String getAccountSid() {
		return this.getProperty('account_sid');
	}

	/**
	 * Gets the to.
	 *
	 * @return the to
	 */
	public String getTo() {
		return this.getProperty('to');
	}

	/**
	 * Gets the from.
	 *
	 * @return the from
	 */
	public String getFrom() {
		return this.getProperty('from');
	}

	/**
	 * Gets the body.
	 *
	 * @return the body
	 */
	public String getBody() {
		return this.getProperty('body');
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public String getStatus() {
		return this.getProperty('status');
	}

	/**
	 * Gets the price.
	 *
	 * @return the price
	 */
	public String getPrice() {
		return this.getProperty('price');
	}

	/**
	 * Gets the price.
	 *
	 * @return the price
	 */
	public String getPriceUnit() {
		return this.getProperty('price_unit');
	}

	/**
	 * Gets the number of segments used to deliver this message.
	 *
	 * @return the number of segments
	 */
	public Integer getNumSegments() {
		return this.getPropertyInteger('num_segments'));
	}

	/**
	 * Gets the number of media associated with the message.
	 *
	 * @return the number of segments
	 */
	public Integer getNumMedia() {
		return this.getPropertyInteger('num_media'));
	}

	/**
	 * Gets the direction.
	 *
	 * @return the direction
	 */
	public String getDirection() {
		return this.getProperty('direction');
	}

	/**
	 * Gets the api version.
	 *
	 * @return the api version
	 */
	public String getApiVersion() {
		return this.getProperty('api_version');
	}

}
