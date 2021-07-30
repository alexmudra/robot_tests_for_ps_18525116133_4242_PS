*** Settings ***
#Resource     ../Robot_Tests_185.25.116.133_4242_PS/Resources/search_results.robot
#Library     DataDriver  ../Robot_Tests_185.25.116.133_4242_PS/TestData/PS_search_links_csv_file_5_links.csv   encoding='utf-8'

Resource    ../PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/Resources/search_results.robot
#Library     DataDriver  ../PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/TestData/PS_search_links_csv_file_5_links.csv  encoding='utf-8'
Library     DataDriver  C:\Users\alex\PycharmProjects\robot_tests_for_ps_18525116133_4242_PS\TestData\PS_search_links_csv_file_5_links.csv   encoding='utf-8'
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


*** Test Cases ***
Check results for bruht via Chrome
    open browser    ${url_bruht}    headlesschrome
       #element should not contain  ${value from znaideno}  0  message="Результати пошуку 0"
    #${value1}=  get value    ${znaideno and value}  через гет велью не можна взяти текст
    ${value2}=  get text    ${znaideno and alue}

    Log To Console  (1 The text is: ${value2})
    Log To Console  (1.1 Check string_znaideno_nichogo: ${string_znaideno_nichogo})
    Log To Console  (1.2 Check string_znaideno_0: ${string_znaideno_0})

    Should Not Be True  ${value2}   ${string_znaideno_0}
    Log To Console  (2 The text are: ${value2}  ${string_znaideno_0})

    Should Not Be True  ${value2}   ${string_znaideno_nichogo}
    Log To Console  (3 The text are: ${string_znaideno_nichogo})

    Close browser










#
#    ${value2}=  get text    ${value from znaideno}
#    Log To Console  ${value2}
#
#    ${value3}=  get value    ${znaideno elements}
#    Log To Console  ${value3}

#    Element Text Should Be  ${value from znaideno}  2478  message="Результати пошуку 0"

#Check results for bruht via FF
#    open browser  ${value from znaideno}  browser=Firefox
#    element should contain  ${znaideno and value}  ${value from znaideno}
#    Log To Console  ${znaideno elements}
#    Log To Console  ${value from znaideno}
#    close browser
#
#Check results from cvs links
#    open browser  ${links_for_search_form}  browser=Firefox
#    element should contain  ${znaideno and value}  ${value from znaideno}
#    Log To Console  ${value from znaideno}
#    close browser






#*** Keywords ***
#Check search results in PS   #кейворд в який передамо 2 аргументи
#    [Arguments]  ${url_bruht}   ${browser_chrome}
#    open browser    ${url_bruht}   ${browser_chrome}
#    ${check_search_results}= get text  xpath=//*[@id="__next"]/div[3]/div[1]    #збережемо велью в перемінну
#    [Return]     ${check_search_results}   #повернемо велью із перемінної
#    Log To Console  ${check_search_results}
#    close browser


