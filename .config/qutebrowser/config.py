# Qutebrowser config.py
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

#
#((( CONFIG
#

# don't load settings configured via autoconfig.yml
config.load_autoconfig(False)

# autosave session
c.auto_save.session = True

# startpage
c.url.default_page = 'file:///home/azy/.cache/StartTree/index.html'
c.url.start_pages = ['file:///home/azy/.cache/StartTree/index.html']

# custom searchengines
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!jn':      'https://items.jellyneo.net/search/?name={}&plugin=1',
    '!aw':    'https://wiki.archlinux.org/index.php?title=Special%3ASearch&fulltext=1&search={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    # '!gist':    'https://gist.github.com/search?q={}',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!gm':       'https://www.google.com/maps/search/{}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

# vertical tab selection menu
config.bind('<Ctrl-p>', 'spawn -u ~/.config/qutebrowser/userscripts/tabselect')
#

#((( APPEARANCE
#
config.set("fonts.default_family", "Hack")
config.set("fonts.default_size", "9pt")
config.set("fonts.web.family.standard", "DejaVu Sans Mono Book")
config.set("fonts.web.family.serif", "DejaVu Sans Mono Book")
config.set("fonts.web.size.default", 15)

# set vifm as my external filepicker
# config.set("fileselect.folder.command", ['kitty', '-e', 'vifm ~/Downloads', '--choose-dir', '{}'])
# c.fileselect.folder.command = ['/home/azy/.local/bin/vifmpicker', '/home/azy/Downloads', '--choose-dir', '{}']
config.set("fileselect.handler", "external")
c.fileselect.folder.command = ['kitty', '-e', '--name=floating', 'vifm', '--choose-dir', '{}']
config.set("fileselect.single_file.command", ['kitty', '-e', '--name=floating', 'vifm', '--choose-file', '{}'])
config.set("fileselect.multiple_files.command", ['kitty', '-e', '--name=floating', 'vifm', '--choose-files', '{}'])



# Which cookies to accept.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
# Type: Bool
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/azy/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/azy/.local/share/qutebrowser/userscripts/*')

## allow clipboard
config.set('content.javascript.clipboard', "access", 'github.com')
config.set('content.javascript.clipboard', "access", '*.openai.com')

## keybinds
config.bind('<Shift-h>', 'tab-prev', mode='normal')
config.bind('<Shift-l>', 'tab-next', mode='normal')
config.bind('<Ctrl+Shift+h>', 'home', mode='normal')
config.bind('<Ctrl+h>', 'back', mode='normal')
config.bind('<Ctrl+l>', 'forward', mode='normal')
config.unbind('<Shift-j>')
config.unbind('<Shift-k>')

# press 'e' 'k'' to remove all floating elements
config.bind('ek', 'jseval (function () { '+
'  var i, elements = document.querySelectorAll("body *");'+
''+
'  for (i = 0; i < elements.length; i++) {'+
'    var pos = getComputedStyle(elements[i]).position;'+
'    if (pos === "fixed" || pos == "sticky") {'+
'      elements[i].parentNode.removeChild(elements[i]);'+
'    }'+
'  }'+
'})();');

