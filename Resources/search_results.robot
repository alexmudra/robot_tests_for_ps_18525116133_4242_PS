*** Settings ***
Library    SeleniumLibrary
Resource    C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/Resources/search_results.robot
Library     DataDriver   C:/Users/alex/PycharmProjects/robot_tests_for_ps_18525116133_4242_PS/TestData/PS_search_links_csv_file_2_links.csv   encoding='utf-8'

*** Variables ***
${browser_chrome}  browser=Chrome
${browser_headlesschrome}  headlesschrome
${browser_firefox}  browser=Firefox

${defolt_broser}    ff
${url_g}  https://www.google.com/
${url_bruht}  http://185.25.116.133:4242/?query=%22%D0%B1%D1%80%D1%83%D1%85%D1%82%22&offset=10
${search_btn}  xpath=//*[@id="__next"]/div[2]/div/div[1]/div[2]/button
${znaideno btn}  xpath=////*[@id="__next"]/div[3]/div[1]/text()[1]
${index_>=1}
${index_==0}
${msg}  URL має значення:



*** Keywords ***
Open my browser chrome
    open browser    ${browser_chrome}
    log to console  ${links_for_search_form}
    Maximize Browser Window

Open browser firefox
    open browser    ${browser_firefox}
    Maximize Browser Window


Check text results via Chrome
    open browser    ${url_bruht}    headlesschrome
    ${value2}=  get text    ${znaideno and value}
    Log To Console  (1 The text is: ${value2})

Get url values
    open browser    ${url_bruht}    headlesschrome
       #element should not contain  ${value from znaideno}  0  message="Результати пошуку 0"
    #${value1}=  get value    ${znaideno and value}  через гет велью не можна взяти текст
    ${value2}=  get text    ${znaideno and value}

    Log To Console  (1 The text is: ${value2})
    Log To Console  (1.1 Check string_znaideno_nichogo: ${string_znaideno_nichogo})
    Log To Console  (1.2 Check string_znaideno_0: ${string_znaideno_0})


Close Browsers
    close all browsers











