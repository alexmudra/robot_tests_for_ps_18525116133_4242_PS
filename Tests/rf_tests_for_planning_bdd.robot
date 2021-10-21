#кейворди тут https://robotframework.org/Selenium2Library/Selenium2Library.html
#https://www.youtube.com/watch?v=D0LOql-_3-s  how to handle tabs and windows in browser
#тут приклади виокристання патерну https://stackoverflow.com/questions/65228946/pattern-matching-in-robot-framework-python
#тут документація по операціям із стрінгою https://robotframework.org/robotframework/2.1.2/libraries/String.html

*** Settings ***
Library     SeleniumLibrary
Library    String
Library    BuiltIn
Suite setup  Open Browser Chrome in headless_mode
Suite teardown  Close all my browsers and clear cache

*** Variables ***
${doc_index}                                             0
${BROWSER_chrome}                                        Chrome
${BROWSER_headless}                                      headlesschrome

#LOCATORS
${about_us_lctr}                                     xpath=//*[@id="__next"]/header/nav/div/ul/li[1]/a
${storinka ne znaidena lctr}                         xpath=//*[@id="__next"]/div/h1
${value from znaideno}                               xpath=//*[@id="__next"]/div[3]/div[1]/text()[2]
${value from znaideno_v2}                            xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено: ")]
${value from znaideno_v3}  xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено")]/text()[2]


${msg_link_is}                                           Лінк має наступний вигляд:
${msg_identical}                                         Сторінки ідентичні
${msg_not_identical}                                     Сторінки не ідентичні
${text_znaideno}                                         Знайдено:
${msg}                                                   УРЛ вікна браузера:
${msg_storika ne znaidena_str}                           Сторінка не знайдена


${lctr_is_zamovnik}                                       xpath=//*[@id="companies-is_seller"]/option[1]
${lctr_is_uchasnick}                                      xpath=//*[@id="companies-is_seller"]/option[2]
${lctr_select_zamovORuchasnick}                           xpath=//*[@id="registration-form"]/div[1]/div[1]/label
${lctr_is_seller}                                         xpath=//*[@id="companies-is_seller"]
${lctr_status_name_in_auct_page}          xpath=//aside[contains(@class,"meta-blockstyles__FixedBlock-v6fx5m-0 bNaTcU")]

${input_search_field}              xpath=//div/input
${lctr_search_btn_magnifier}            xpath=(//div/button[contains(@class,'Button')])[1]


${BROWSER_chrome}                                       Chrome
${BROWSER_headless}                                     headlesschrome


#перемінні із Інф. Повідомлення на http://185.25.116.133:4242/
${planning_page_4242}                                        http://185.25.116.133:4242/planning/search



#перемінні із таби Інф. Повідомлення на https://prozorro.sale/
${planning_page_prod}                                        https://prozorro.sale/planning/search

*** Keywords ***


Open Browser Chrome in headless_mode
    Open Browser  ${planning_page_4242}   ${BROWSER_headless}
    Maximize Browser Window

Close all my browsers and clear cache
    Close all browsers


*** Test Cases ***

ТС Порівняти урл із дева і прода за патерном planning/search
    [Documentation]  Перевірка лінків
    [Tags]  лінк в розділі Інформаційні повідомлення
    ${pattern_planning/search} =  Catenate    SEPARATOR=\n   planning/search
    Log  ${pattern_planning/search}

    #приклади використання патерну
    ${a}=     Get Lines Matching Pattern     ${pattern_planning/search}   planning/search    case_insensitive=true
    Log  ${a}
    ${c}=    Get Regexp Matches    ${pattern_planning/search}  planning/search
    Log  ${c}

    #реальна перевірка відповідності урлів із 4242 і проду до патерну  planning/search
    Go to  ${planning_page_4242}
    Maximize Browser Window
    ${url_planning_4242}=  Execute Javascript  return window.location.href
    ${url_planning_4242}=  Get Lines Matching Pattern     ${pattern_planning/search}   planning/search    case_insensitive=true

    Go to  ${planning_page_prod}
    ${url_planning_prod}=  Execute Javascript  return window.location.href
    ${url_planning_prod}=  Get Lines Matching Pattern     ${pattern_planning/search}   planning/search    case_insensitive=true

    log many  ${msg}  ${url_planning_4242}  ${url_planning_prod}

ТС Check search results with нерухомість via search field
    [Documentation]  Пошук по ключовому слову нерухомість в розділі Інформ. Повідомлення
    [Tags]   пошук
    Go to  ${planning_page_4242}
    Maximize Browser Window
    Click element  ${input_search_field}
    Input text  ${input_search_field}   нерухомість
    Wait Until Element Is Visible  ${lctr_search_btn_magnifier}  timeout=5s
    Click Button    ${lctr_search_btn_magnifier}
    Wait Until Page Contains Element  ${value from znaideno_v2}  timeout=10s
    ${znaideno_4242}=  Get text  ${value from znaideno_v2}
    log many  На деві  ${znaideno_4242}

    Go to  ${planning_page_prod}
    Maximize Browser Window
    Click element  ${input_search_field}
    Input text  ${input_search_field}   нерухомість
    Wait Until Element Is Visible  ${lctr_search_btn_magnifier}  timeout=5s
    Click Button    ${lctr_search_btn_magnifier}
    Wait Until Page Contains Element  ${value from znaideno_v2}  timeout=10s
    ${znaideno_prod}=  Get text  ${value from znaideno_v2}
    log many  На проді  ${znaideno_prod}

    should be equal  ${znaideno_4242}   ${znaideno_prod}








