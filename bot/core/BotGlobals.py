# Filename: BotGlobals.py
# Author: mfwass
# Date: January 8th, 2017
#
# The Legend of Pirates Online Software
# Copyright (c) The Legend of Pirates Online. All rights reserved.
#
# All use of this software is subject to the terms of the revised BSD
# license.  You should have received a copy of this license along
# with this source code in a file named "LICENSE."

"""
The BotGlobals class will serve as a central location
of all global values in the TLOPO Discord Bot project.
"""

APP_DESCRIPTION_UPSTREAM = "Discord bot by TLOPO. <3 https://github.com/TheLegendofPiratesOnline/discord-bot"
APP_DESCRIPTION_FORK = "Dynasty of Persia fork. https://github.com/jamebus/tlopo-discord-bot"
APP_DESCRIPTION = "%s\n%s" % (APP_DESCRIPTION_UPSTREAM, APP_DESCRIPTION_FORK)

LOCAL_SETTINGS_FILENAME = 'local_settings.json'
SETTINGS_FILENAME = 'settings.json'

# API Docs: https://tlopo.com/docs/
API_URLS = {
    'news_feed':'https://api.tlopo.com/news/feed/',
    'news_notification':'https://api.tlopo.com/news/notification',
    'shards':'https://api.tlopo.com/shards',
    'system_status':'https://api.tlopo.com/system/status'
}

BOT_TASKS = {
    'task_shards': {
        'time': 25.0,
        'api_url': API_URLS.get('shards')
    },
    'task_system_status': {
        'time': 25.0,
        'api_url': API_URLS.get('system_status')
    },
    'task_news_feed': {
        'time': 25.0,
        'api_url': API_URLS.get('news_feed')
    },
    'task_news_notification': {
        'time': 25.0,
        'api_url': API_URLS.get('news_notification')
    }
}

BASE_CHANNEL_TO_NAME = {
    '401000000': 'Abassa',
    '402000000': 'Andaba',
    '403000000': 'Bequermo',
    '404000000': 'Cortos',
    '405000000': 'Exuma',
    '406000000': 'Fragilles',
    '407000000': 'Juntos',
    '408000000': 'Kokojillo',
    '409000000': 'Levanta',
    '410000000': 'Nocivo',
    '411000000': 'Sabada',
    '412000000': 'Valor'
}

STATUS_ALIVE_SRV = 1
STATUS_MESSAGE_SRV = 2
STATUS_UPDATE_SRV = 4
STATUS_ERROR_SRV = 8
STATUS_FATAL_SRV = 16
STATUS_UNKNOWN_SRV = 32

SRV_CODE_TO_STATUS = {
    STATUS_ALIVE_SRV:   "STATUS_ALIVE",
    STATUS_MESSAGE_SRV: "STATUS_MESSAGE",
    STATUS_UPDATE_SRV:  "STATUS_UPDATE",
    STATUS_ERROR_SRV:   "STATUS_ERROR",
    STATUS_FATAL_SRV:   "STATUS_FATAL",
    STATUS_UNKNOWN_SRV: "STATUS_UNKNOWN"
}

STATUS_ALIVE_GLOB = 1
STATUS_MESSAGE_GLOB = 2
STATUS_UPDATE_GLOB = 3
STATUS_ERROR_GLOB = 4
STATUS_FATAL_GLOB = 5
STATUS_UNKNOWN_GLOB = 6

GLOB_CODE_TO_STATUS = {
    STATUS_ALIVE_GLOB:   "STATUS_ALIVE",
    STATUS_MESSAGE_GLOB: "STATUS_MESSAGE",
    STATUS_UPDATE_GLOB:  "STATUS_UPDATE",
    STATUS_ERROR_GLOB:   "STATUS_ERROR",
    STATUS_FATAL_GLOB:   "STATUS_FATAL",
    STATUS_UNKNOWN_GLOB: "STATUS_UNKNOWN"
}
