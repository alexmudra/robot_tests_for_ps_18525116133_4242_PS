*** Settings ***
#Resource     ../Robot_Tests_185.25.116.133_4242_PS/Resources/search_results.robot
#Library     DataDriver  ../Robot_Tests_185.25.116.133_4242_PS/TestData/PS_search_links_csv_file_2_links.csv   encoding='utf-8'

Resource    C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/Resources/search_results.robot
Library     DataDriver  C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/TestData/PS_search_links_csv_file_5_links.csv   encoding='utf-8'
Library     SeleniumLibrary

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


#headlesschrome

*** Test Cases ***




#
#    ${value2}=  get text    ${value from znaideno}
#    Log To Console  ${value2}
#
#    ${value3}=  get value    ${znaideno elements}
#    Log To Console  ${value3}

#    Element Text Should Be  ${value from znaideno}  2478  message="Результати пошуку 0"







#*** Keywords ***
#Check search results in PS   #кейворд в який передамо 2 аргументи
#    [Arguments]  ${url_bruht}   ${browser_chrome}
#    open browser    ${url_bruht}   ${browser_chrome}
#    ${check_search_results}= get text  xpath=//*[@id="__next"]/div[3]/div[1]    #збережемо велью в перемінну
#    [Return]     ${check_search_results}   #повернемо велью із перемінної
#    Log To Console  ${check_search_results}
#    close browser


