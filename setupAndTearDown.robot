*** Settings ***
Suite Setup  log to console     Opening Browser
Suite Teardown  log to console  Closing Browser

Test Setup  log to console  Login to app
Test Teardown   log to console  Log out app

*** Test Cases ***
TC1 Check first search link
    log to console  skdjf1

TC2 Check 2 s link
    log to console  skdjf2

TC3 Check 3 link
    log to console  skdfj3
