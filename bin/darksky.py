#!/usr/bin/python

import requests
import json
import sys

def pull_temp( resp_json):
    temp = 999
    try:
        temp = float(resp_json['currently']['temperature'])
        temp = int(((temp-32) * 5)/9)
        return temp
    except:
        print( "Unknown exception, show error 999" )
        return 999

def pull_symbol( resp_json):

    sun =''
    snowflake = ''
    shower = ''
    cloud = ''
    moon = ''
    icon_dict = { 
            'clear-day':sun,
            'clear-night':moon,
            'rain':shower,
            'snow':snowflake,
            'sleet':'sleet',
            'wind':'wind',
            'fog':'foggy',
            'cloudy':cloud,
            'partly-cloudy-day':sun,
            'partly-cloudy-night':moon
            }

    try:
        icon = resp_json['currently']['icon']
        if( icon is None ):
            return '?'

        return icon_dict[icon]

    except:
        return '?'

key = "b131d87540ab9c8fb0443d7944f22c5e"
 

lat = "42.995701"
lon = "-71.468160"



request = "https://api.darksky.net/forecast/{}/{},{}".format(
        key,lat,lon
        )

response = requests.get(request)
resp_json = json.loads( response.text.encode( response.encoding ))

temp = pull_temp( resp_json )
sym = pull_symbol( resp_json )

sys.stdout.buffer.write( u"{} {}\N{DEGREE SIGN}C".format(sym, temp).encode('utf8') )




