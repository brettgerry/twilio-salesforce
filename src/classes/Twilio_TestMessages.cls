@isTest
class Twilio_TestMessages {

	final static String authToken = '12345678901234567890123456789012';

	static testmethod void testTwilioMessage() {

		String messageJsonResponseBody = 
			'{ "sid": "MMba8bc05eacf94afdae398e642c9cc32d",'
			+'"date_created": "Wed, 04 Aug 2010 21:37:41 +0000",'
			+'"date_updated": "Fri, 06 Aug 2010 01:15:02 +0000",'
			+'"date_sent": "Fri, 06 Aug 2010 01:15:02 +0000",'
			+'"to": "+1234567890",'
			+'"from": "+1234567890",'
			+'"body": "Hi.",'
			+'"status": "sent",'
			+'"price": "0.02",'
			+'"price_unit": "USD",'
			+'"num_segments": "1",'
			+'"num_media": "1",'
			+'"direction": "outbound",'
			+'"api_version": "2010-04-01",'
			+'"uri": "/2010-04-01/Accounts/ACba8bc05eacf94afdae398e642c9cc32d/Messages.json",'
			+'"subresource_uris": {'
				+'"media" : "/2010-04-01/Accounts/ACba8bc05eacf94afdae398e642c9cc32d/Messages/MMba8bc05eacf94afdae398e642c9cc32d/Media.json"'
			+ '} }';

		Twilio_TestHTTPMock.getInstance.putResponse(
				'GET',
				'https://api.twilio.com/2010-04-01/Accounts/ACba8bc05eacf94afdae398e642c9cc32d/Messages.json',
				new Twilio_TestHTTPMock.Response(messageJsonResponseBody, 200)
				);

		TwilioRestClient client = new TwilioRestClient('ACba8bc05eacf94afdae398e642c9cc32d', authToken);
		TwilioMessage message = client.getAccount().getMessage('MMba8bc05eacf94afdae398e642c9cc32d');

		System.assertNotEquals(null, message);
		System.assertEquals('MMba8bc05eacf94afdae398e642c9cc32d', message.getSid());
		System.assertEquals(message.getTo(), '+1234567890');
		System.assertEquals(message.getFrom(), '+1234567890');
		System.assertEquals(message.getBody(), 'Hi.');
		System.assertEquals(message.getStatus(), 'sent');
		System.assertEquals(message.getPrice(), '0.02');
		System.assertEquals(message.getPriceUnit(), 'USD');
		System.assertEquals(message.getNumSegments(), 1);
		System.assertEquals(message.getNumMedia(), 1);
		System.assertEquals(message.getUri(), '/2010-04-01/Accounts/ACba8bc05eacf94afdae398e642c9cc32d/Messages.json');
		System.assertEquals(message.getSubresourceUris().get('media'), '/2010-04-01/Accounts/ACba8bc05eacf94afdae398e642c9cc32d/Messages/MMba8bc05eacf94afdae398e642c9cc32d/Media.json');

	}

	static testmethod void testTwilioMessageList() {

		String messageJsonResponseBody = 
		'{"messages": ['
			

		]}}

	}

}
