*** Settings ***

#Resource    C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/Resources/search_results.robot
#Library     DataDriver   C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/TestData/PS_search_links_csv_file_2_links.csv   encoding='utf-8'
Library     ../home/alex/PycharmProjects/RobotTests_Python/Robot_Tests_185.25.116.133_4242_PS/TestData/PS_search_links_csv_file_2_links.csv    encoding='utf-8'
Resource    ../home/alex/PycharmProjects/RobotTests_Python/Robot_Tests_185.25.116.133_4242_PS/Resources/search_results.robot
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
${value from znaideno}  xpath=//*[@id="__next"]/div[3]/div[1]/text()[2]

${znaideno : value_all gtring path}  xpath=//*[@id="__next"]/div[3]/div[1]  #пасс для всієї строки із знайдено

${url_bruht}  http://185.25.116.133:4242/?query=%22%D0%B1%D1%80%D1%83%D1%85%D1%82%22&offset=10

${znaideno elements}  xpath=//*[@id="__next"]/div[3]/div[1]/text()[1]
${znaideno and value}   xpath=//*[@id="__next"]/div[3]/div[1]

${string_znaideno_nichogo}   Знайдено: Нічого незнайдено
${string_znaideno_0}   Знайдено: 0
${msg}  Ліна на запит:

*** Test Cases ***
Check_search_results_using_csv_file: ${links_for_search_form}

*** Keywords ***
Check search results in PS via headlesschrome mode   #кейворд в який передамо 2 аргументи
    [Arguments]  ${links_for_search_form}   ${msg}
    Open Browser  ${links_for_search_form}  headlesschrome
    ${url}=     Get Location
#    log to console  ${msg} ${url}
    ${value2}=  Get text    ${znaideno and value}

    Log To Console  (1 The text from "ZNAIDENO" is: ${value2})
    Log To Console  (1.1 The text from "znaideno_nichogo": ${string_znaideno_nichogo})
    Log To Console  (1.2 1 The text from frob "znaideno_0": ${string_znaideno_0})

    should be equal as strings  ${value2}   ${string_znaideno_nichogo}
    should be equal as strings  ${value2}   ${string_znaideno_0}}



#Check_search_results_using_csv_file_search_is_request   #кейворд в який передамо 2 аргументи
#    [Arguments]  ${links_for_search_form}   ${msg}
#    Open Browser  ${links_for_search_form}  headlesschrome
#    #${url}=     Get location
#    ${url} =  Execute Javascript  return window.location.href
#    log to console  ${msg} ${url}
##    ${check_search_results}= get value ${znaideno and value}   #збережемо велью в перемінну
##    log to console  ${check_search_results}
##    [Return]     ${check_search_results}   #повернемо велью із перемінної











