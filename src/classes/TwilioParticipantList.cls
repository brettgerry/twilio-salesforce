/**
 * The class TwilioParticipantList.
 * 
 * For more information see http://www.twilio.com/docs/api/rest/participant
 */
global class TwilioParticipantList extends TwilioResource.ListResource
	implements Iterable<TwilioParticipant> {
	
	/** The conference sid. */
	private String conferenceSid;

	/**
	 * Instantiates a new participant list.
	 *
	 * @param client the client
	 */
	public TwilioParticipantList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new participant list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioParticipantList(TwilioRestClient client, Map<String, String> filters) {
		super(client, filters);
	}

	/**
	 * Instantiates a new participant list.
	 *
	 * @param client the client
	 * @param conferenceSid the conference sid
	 */
	public TwilioParticipantList(TwilioRestClient client, String conferenceSid) {
		super(client);
		this.conferenceSid = conferenceSid;
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid() + '/Conferernces/'
				+ this.conferenceSid + '/Participants.json';
	}

	/* implements method from TwilioResource.ListResource */
	public override Object makeNew(TwilioRestClient client,
			Map<String, Object> params) {
		return new TwilioParticipant(client, params);
	}

	/* implements method from TwilioResource.ListResource */
	public override String getListKey() {
		return 'participants';
	}
	
	public List<TwilioParticipant> getPageData() {
		List<TwilioParticipant> returnList = new List<TwilioParticipant>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioParticipant) {
				returnList.add((TwilioParticipant) o);
			}
		}
		return returnList;
	}
	
	global Iterator<TwilioParticipant> iterator() {
		return new TwilioIterator.ParticipantIterator(this);
	}
}
