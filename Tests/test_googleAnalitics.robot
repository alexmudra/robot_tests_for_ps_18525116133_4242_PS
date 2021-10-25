*** Settings ***
Library    SeleniumLibrary
import  logging
import http.client as client

*** Variables ***
&{browser logging capability}    browser=ALL
&{capabilities}    browserName=chrome    version=${EMPTY}    platform=ANY    goog:loggingPrefs=${browser logging capability}


*** Keywords ***
Get Browser Console Log Entries
    ${selenium}=    Get Library Instance    SeleniumLibrary
    ${webdriver}=    Set Variable     ${selenium._drivers.active_drivers}[0]
    ${log entries}=    Evaluate    $webdriver.get_log('browser')
    [Return]    ${log entries}


*** Test Cases ***
Browser Log Cases
    Open Browser    https://prozorro.sale    Chrome    desired_capabilities=${capabilities}
    ${log entries}=    Get Browser Console Log Entries
    Log    ${log entries}
    [Teardown]    Close All Browsers


    #https://prozorro.sale/



client.HTTPConnection.debuglevel = 1
logging.basicConfig()
logging.getLogger().setLevel(logging.DEBUG)
requests_log = logging.getLogger("selenium.webdriver.remote.remote_connection")
requests_log.setLevel(logging.DEBUG)
requests_log.propagate = True