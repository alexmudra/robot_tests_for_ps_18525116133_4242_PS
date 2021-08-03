*** Settings ***

Resource    C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/Resources/search_results.robot
Library     DataDriver   C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/TestData/PS_search_links_csv_file_2_links.csv   encoding='utf-8'
Library     SeleniumLibrary


Suite Setup     log to console  Open browser
#Suite Setup     Open browser
Suite Teardown      Close All Browsers

#Test Setup  log to console  ${links_for_search_form}
Test Teardown   Close Browser
Test Template      Check search results in PS via headlesschrome mode


*** Variables ***
${browser_chrome}  browser=Chrome
${browser_firefox}  browser=Firefox

*** Test Cases ***
Check_search_results_using_csv_file_search_is_request: ${links_for_search_form}
Check each text results via Chrome Check text results via Chrome
Check search results in PS via headlesschrome mode
Check search results in PS via FF


*** Keywords ***
Check_search_results_using_csv_file_search_is_request   #кейворд в який передамо 2 аргументи
    [Arguments]  ${links_for_search_form}   ${msg}
    Open Browser  ${links_for_search_form}  headlesschrome
    #${url}=     Get location
    ${url} =  Execute Javascript  return window.location.href
    log to console  ${msg} ${url}
#    ${check_search_results}= get value ${znaideno and value}   #збережемо велью в перемінну
#    log to console  ${check_search_results}
#    [Return]     ${check_search_results}   #повернемо велью із перемінної

Check search results in PS via headlesschrome mode   #кейворд в який передамо 2 аргументи
    [Arguments]  ${links_for_search_form}   ${msg}
    Open Browser  ${links_for_search_form}  headlesschrome
    ${url}=     get location
    log to console  ${msg} ${url}





