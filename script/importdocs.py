__author__ = "rizwank@geekymedia.com (Rizwan Kassim)"
import gdata.spreadsheet
import gdata.spreadsheet.service
import requests

def PrintFeed(feed):
    """ Function to print out spreadsheet feeds from Google """
    for i, entry in enumerate(feed.entry):
        if isinstance(feed, gdata.spreadsheet.SpreadsheetsCellsFeed):
            print '%s %s\n' % (entry.title.text, entry.content.text)
        elif isinstance(feed, gdata.spreadsheet.SpreadsheetsListFeed):
            print '%s %s %s' % (i, entry.title.text, entry.content.text)
            # Print this row's value for each column (the custom dictionary is
            # built from the gsx: elements in the entry.) See the description of
            # gsx elements in the protocol guide.
            print 'Contents:'
            for key in entry.custom:
                print '  %s: %s' % (key, entry.custom[key].text)
            print '\n',
        else: 
            print '%s %s\n' % (i, entry.title.text) 

gd_client = gdata.spreadsheet.service.SpreadsheetsService()
gd_client.email = 'nolavation@gmail.com'
gd_client.password = 'barcampnola5'
gd_client.ProgrammaticLogin()
feed = gd_client.GetSpreadsheetsFeed()
key='0AhsqX_xdd24jdFNQMTFxeF9xNDZrVzY1QW5MVE5ScEE'
feed = gd_client.GetWorksheetsFeed(key)
wksht_id='od6'
feed=gd_client.GetListFeed(key, wksht_id)
datum = list()

# Extract all the feed data.
for i, entry in enumerate(feed.entry):
    data = {}
    # Grab each entry.
    for key in entry.custom:
        data[key] = entry.custom[key].text
    datum.append((i, data))


def transform(entry):
	output={}
	output['entry[title]']=entry[1]['headlinetitle']
	output['entry[body]']=entry[1]['bodytext']
	output['entry[start_at]']=entry[1]['startdate']
	if entry[1]['enddate']:
		output['entry[ends_at]']=entry[1]['enddate']
	return output

payload=transform(datum[0])

r=requests.post('http://barcampnola5.herokuapp.com/entries',payload)

