/**
 * The class TwilioTranscriptionList.
 * 
 * For more information see http://www.twilio.com/docs/api/rest/transcription
 */
global class TwilioTranscriptionList extends TwilioResource.ListResource
	implements Iterable<TwilioTranscription> {

	private String parentCallSid;

	/**
	 * Instantiates a new transcription list.
	 *
	 * @param client the client
	 */
	public TwilioTranscriptionList(TwilioRestClient client) {
		super(client);
	}

	/**
	 * Instantiates a new transcription list.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioTranscriptionList(TwilioRestClient client,
			Map<String, String> filters) {
		super(client, filters);
	}
	
	/**
	 * Instantiates a new recording list under a Call resource.
	 *
	 * @param client the client
	 * @param filters the filters
	 */
	public TwilioTranscriptionList(TwilioRestClient client, String parentCallSid) {
		super(client);
		this.parentCallSid = parentCallSid;
	}

	/* implements method from TwilioResource */
	public override String getResourceLocation() {
		return '/' + TwilioRestClient.DEFAULT_VERSION + '/Accounts/'
				+ this.getRequestAccountSid()
				+ (this.parentCallSid!=null ? ('/Recordings/'+this.parentCallSid) : '')
				+ '/Transcriptions.json';
	}

	/* implements method from TwilioResource.ListResource */
	public override Object makeNew(TwilioRestClient client,
			Map<String, Object> params) {
		return new TwilioTranscription(client, params);
	}

	/* implements method from TwilioResource.ListResource */
	public override String getListKey() {
		return 'transcriptions';
	}
	
	/* returns the current response results page */
	public List<TwilioTranscription> getPageData() {
		List<TwilioTranscription> returnList = new List<TwilioTranscription>();
		
		for (Object o : this.getObjectPageData()) {
			if (o instanceof TwilioTranscription) {
				returnList.add((TwilioTranscription) o);
			}
		}
		return returnList;
	}
	
	/* returns an iterator spanning all data pages */
	global Iterator<TwilioTranscription> iterator() {
		return new TwilioIterator.TranscriptionIterator(this);
	}
}
