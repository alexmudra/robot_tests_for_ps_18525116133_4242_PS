*** Settings ***
Library  SeleniumLibrary
Resource     ../Robot_Tests_185.25.116.133_4242_PS/Resources/search_results.robot
Library     DataDriver  ../Robot_Tests_185.25.116.133_4242_PS/TestData/PS_search_links_csv_file.csv    encoding='utf-8'


Suite Setup     Open browser
Suite Teardown      Close All Browsers
Test Template    Check search results in PS via FF


*** Variables ***
${browser_chrome}  browser=Chrome
${browser_firefox}  browser=Firefox

*** Test Cases ***
Check_search_results_via_using_csv_file_data using ${links_for_search_form}
log to console ${links_for_search_form}




*** Keywords ***
Check search results in PS via FF   #кейворд в який передамо 2 аргументи
    [Arguments]  ${links_for_search_form}
    Open Browser  ${links_for_search_form}  browser=Firefox
    ${check_search_results}= get text  xpath=//*[@id="__next"]/div[3]/div[1]    #збережемо велью в перемінну
    [Return]     ${check_search_results}   #повернемо велью із перемінної
    close browser

Open browser firefox
    open browser    ${browser_firefox}
    Maximize Browser Window

