__author__ = "rizwank AT geekymedia PERIOD - USUAL TLD (Rizwan Kassim)"
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

import datetime


def transform(entry):
  output={}
  output['entry[title]']=entry[1]['headlinetitle']
  output['entry[body]']=entry[1]['bodytext']
  if entry[1]['tag']:
    output['entry[tag_names]']=entry[1]['tag']
  if entry[1]['startdate']:
    output['entry[start_at]']=datetime.datetime.strptime(entry[1]['startdate'].split(' ')[0],'%m/%d/%Y').strftime("%Y/%m/%d")
  if entry[1]['enddate']:
    output['entry[ends_at]']=datetime.datetime.strptime(entry[1]['enddate'].split(' ')[0],'%m/%d/%Y').strftime("%Y/%m/%d")
  return output


for e in datum:
  try:
    payload=transform(e)
    r=requests.post('http://localhost:3000/entries',payload)
  except:
    print "ENTRY FAILED\n\n\n"
    print e
    pass
