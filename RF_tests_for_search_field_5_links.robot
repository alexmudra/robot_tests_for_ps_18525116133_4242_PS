*** Settings ***
Library  SeleniumLibrary
Resource     ../Robot_Tests_185.25.116.133_4242_PS/Resources/search_results.robot
Library     DataDriver  ../Robot_Tests_185.25.116.133_4242_PS/TestData/PS_search_links_csv_file_5_links.csv   encoding='utf-8'


Suite Setup     Open browser
Suite Teardown      Close All Browsers
Test Template    Check search results in PS via FF


*** Variables ***
${browser_chrome}  browser=Chrome
${browser_firefox}  browser=Firefox

*** Test Cases ***
Check_search_results_via_using_csv_file_data using ${links_for_search_form}
#log to console ${links_for_search_form}




*** Keywords ***
Check search results in PS via FF   #кейворд в який передамо 2 аргументи
    [Arguments]  ${links_for_search_form}   ${msg}
    Open Browser  ${links_for_search_form}  browser=Firefox
    ${url}=     get location
    log to console  ${msg} ${url}

#    ${check_search_results}= get value ${znaideno and value}   #збережемо велью в перемінну
#    log to console  ${check_search_results}
#    [Return]     ${check_search_results}   #повернемо велью із перемінної







