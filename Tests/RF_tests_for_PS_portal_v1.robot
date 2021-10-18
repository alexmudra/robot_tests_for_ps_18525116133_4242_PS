#https://www.youtube.com/watch?v=DCgrW-i9cT8&list=PLUDwpEzHYYLsCHiiihnwl3L0xPspL7BPG&index=24
*** Settings ***
Library     SeleniumLibrary
suite setup  Open Browser Chrome in headless_mode
suite teardown  Close All Browsers


*** Variables ***
${doc_index}                                             0
${BROWSER_chrome}                                        Chrome
${BROWSER_headless}                                      headlesschrome

${msg_link_is}                                           Лінк має наступний вигляд:
${msg_identical}                                         Сторінки ідентичні
${msg_not_identical}                                     Сторінки не ідентичні
${text_znaideno}                               Знайдено:
${msg}  УРЛ вікна браузера:

#LOCATORS

${lctr_select_status_value="active.tendering"}            xpath=//*[@id="status"]/option[2]
${lctr_select_status_active.enquiries}                    xpath=//*[@id="status"]/option[3]
${lctr_is_zamovnik}                                       xpath=//*[@id="companies-is_seller"]/option[1]
${lctr_is_uchasnick}                                      xpath=//*[@id="companies-is_seller"]/option[2]
${lctr_select_zamovORuchasnick}                           xpath=//*[@id="registration-form"]/div[1]/div[1]/label
${lctr_is_seller}                                         xpath=//*[@id="companies-is_seller"]
${lctr_search_btn_magnifier}            xpath=//*[@id="__next"]/div[2]/div/div[1]/div/button
${lctr_status_name_in_auct_page}  xpath=//aside[contains(@class,"meta-blockstyles__FixedBlock-v6fx5m-0 bNaTcU")]


#перемінні із http://185.25.116.133:4242/
${BROWSER_chrome}                                       Chrome
${BROWSER_headless}                                     headlesschrome

${main_page}                                            http://185.25.116.133:4242/
${logo_page}                                            https://prozorro.sale/
${about_page}                                           http://185.25.116.133:4242/about
${news_page}                                            https://info.prozorro.sale/news
${streams_page}                                         https://info.prozorro.sale/streams
${bi_page}                                              https://bi.prozorro.sale/#/
${prodavcyam_page}                                      https://info.prozorro.sale/prodavcyam
${pocupcyam_page}                                       https://info.prozorro.sale/pokupcyam
${contacts_page}                                        https://info.prozorro.sale/contacts

#статуси аукціонів на http://185.25.116.133:4242
${lnk_active_tendering_4242}   http://185.25.116.133:4242/?status=active.tendering
${lnk_active_tendering_4242}   http://185.25.116.133:4242/?offset=10&status=active.auction




#LOCATORS
${about_us_lctr}                                     xpath=//*[@id="__next"]/header/nav/div/ul/li[1]/a
${storinka ne znaidena lctr}                         xpath=//*[@id="__next"]/div/h1
${logo_me_gov_ua}            xpath=//*[@id="__next"]/footer/div[1]/a[1]
${lctr_btn_kluch_slovo}         xpath=//*[@id="__next"]/div[2]/div/div[2]/button[1]
${input_to_kluch_slovo}        xpath=//input[@name="query"]
${znaideno elements}  xpath=//span[@data-test-id="znaideno_value"]
${znaideno and value}   xpath=//*[@id="__next"]/div[3]/div[1]

${input_main_search_field}  xpath=//*[@id="__next"]/div[2]/div/div[1]/input
${first_link_for_bruht}  xpath=(//a[contains(@class,"cardcomponent__Title")])[1]
${first_link_for_bruht_v2}  xpath=(//div[contains(@class,"sc-13tsmp8-0 dfiBpb")]/descendant::a)[1]
${value from znaideno}  xpath=//*[@id="__next"]/div[3]/div[1]/text()[2]
${value from znaideno_v2}  xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено")]


#values and variables
${storika ne znaidena_str}  Сторінка не знайдена


*** Keywords ***
Open Browser Chrome
    [Documentation]  Відкрити хромбраузер в UI режимі
    [Arguments]   ${BROWSER_headless}   ${logo_page}
    Open Browser    ${BROWSER_headless}  ${logo_page}
    Maximize Browser Window

Open Browser Chrome in headless_mode
    Open Browser  ${main_page}   ${BROWSER_headless}
    Maximize Browser Window

Compare url and links
    [Arguments]  ${msg_identical}
    ${url}=     get location
    should be true  '${url}' in '${main_page}'
    #log to console  ${msg_identical}
    #Capture Page Screenshot

Compare main_page link with current
    [Arguments]  ${msg_identical}
    #Click Link  ${main_page}
    ${url}=     get location
    should be true  '${url}' in '${main_page}'


Compare zamovnik or not
    [Arguments]  ${lctr_is_zamovnik}
    Wait until element is visible   ${lctr_is_zamovnik}     timeout=20
    ${is_zamovnik}=  get variable value  ${lctr_is_zamovnik} #//span[@data-test-id="znaideno_value"]
    should be true  '${is_zamovnik}' in '${lctr_is_zamovnik}'   msg='значення співпадають'

Close my browsers
    Close all browsers

*** Test Cases ***


TC1 Open mainpage in UI Chome mode
    [Documentation]  Відкрити браузер в UI режимі(можливо відкрити headlessbode
    [Tags]  браузер
    Open Browser Chrome   ${main_page}  ${BROWSER_chrome}

#TC Comparing ${main_page} and current url
#    [Documentation]  Порівняти лінк в браузері із лінком на головній стрінці порталу
#    [Tags]  лінк
#    Open Browser  ${main_page}  ${BROWSER_Chrome}
#    Compare main_page link with current  ${msg_identical}
#
#TC Comparing urls about_us, me.gov.ua
#    [Documentation]  Порівняти лінк в браузері із лінком на головній стрінці порталу
#    [Tags]  лінк
#    Go to  ${about_page}
#    ${url}=     get location
#    should be true  '${url}' in '${about_page}'
#    ${text_1} =  Get text  ${storinka ne znaidena lctr}
#    should be equal as strings  ${text_1}   ${storika ne znaidena_str}

#ТС Check clicable image MIT in aboutPage
#    Click Image     Міністерство економічного розвитку і торгівлі України
#    Capture Page Screenshot

#TC Comparing urls about_us and verify Transparency International Ukraine
#    [Documentation]  Порівняти aboutPage в браузері із на відритій сторінці браузеру.Перевірити клікабельність картинки
#    [Tags]   картинки
#    Open Browser Chrome  ${about_page}  ${BROWSER_headless}
#    ${url}=     get location
#    should be true  '${url}' in '${about_page}'
#    ${text_1} =  Get text  ${storinka ne znaidena lctr}
#    should be equal as strings  ${text_1}   ${storika ne znaidena_str}
#    Location Should Contain     http://185.25.116.133:4242/about
#    Click Image     Transparency International Ukraine

TC Comparing urls about_us and page should contain 12 hrefs
    [Documentation]  Перевірка наявності 12 лінків на сторінці
    [Tags]   лінк

    Maximize Browser Window
#    Page Should Contain Link  https://info.prozorro.sale/finansova-informaciya
#    Page Should Contain Link  https://info.prozorro.sale/team
#    Page Should Contain Link  https://info.prozorro.sale/handbook
#    Page Should Contain Link  https://info.prozorro.sale/komisiya-dp-prozorroprodazhi
#    Page Should Contain Link  https://info.prozorro.sale/dokumenty-dp-prozorroprodazhi
#    Page Should Contain Link  https://docs.google.com/document/d/1krVY6oEheY-QlDSQUjG0eahhqrPnAtw7m4ZurzQ9Dc8/edit
#    Page Should Contain Link  https://info.prozorro.sale/info/elektronni-majdanchiki-ets-prozorroprodazhi-cbd2
#    Page Should Contain Link  https://info.prozorro.sale/majdanchikam
#    Page Should Contain Link  https://info.prozorro.sale/vakansiyi
#    Page Should Contain Link  https://info.prozorro.sale/za-pidtrimki
#    Page Should Contain Link  https://www.youtube.com/channel/UCbLoGscHsp0-XjE75KWr-Sw
    Page Should Contain Link  https://www.facebook.com/Prozorro.sale


#ТС7 Key word search
#    [Documentation]  Пошук по ключовому слову
#    #Open main page as ${main_page}
#    Go to  ${main_page}
#    Maximize Browser Window
#    Click button  ${lctr_btn_kluch_slovo}
#    Sleep  5s
#    Capture Page Screenshot
#    Input text  ${input_to_kluch_slovo}   брухт
#    #Input text  xpath=//input[@name="query"]  брухт
#    Capture Page Screenshot
#    log many   ${znaideno elements}
#    Get text  ${znaideno and value}
#    Close All Browsers

#ТС8 Check rey word search via main serch field
#    [Documentation]  Пошук по ключовому слову 2 варіант
#    Go to  ${main_page}
#    Maximize Browser Window
#    Click element  ${input_main_search_field}
#    Sleep  2s
#    Input text  ${input_main_search_field}   брухт
#    Click Button    ${lctr_search_btn_magnifier}
#    #Press Keys  ${input_main_search_field}  ENTER
#    #Wait Until Page Contains Element  ${znaideno elements}  timeout=5s
#    Sleep  3s
#    Capture Page Screenshot
#    ${text_from_znaideno}=  Get text  ${znaideno elements}
#    #log many   ${text_from_znaideno}
#    Capture Page Screenshot
#    Get text  ${znaideno elements}
#    Get value  ${znaideno elements}
#    log many  ${znaideno elements}
#    Get WebElement  ${znaideno elements}
#    Get value  ${znaideno elements}
#    Close All Browsers


#TC9 Check window url via js
#    Go to  ${about_page}
#    Maximize Browser Window
#    ${url}=  Execute Javascript  return window.location.href
#    log many  ${msg} ${url}
#    Close All Browsers

#https://www.youtube.com/watch?v=D0LOql-_3-s  how to handle tabs and windows in browser


#TC Check link for bruht
#    [Documentation]  Знайти аукціони по ключовому слову брухт, клікнути на 1й в списку і отримати дані
#    [Tags]  кейворди тут https://robotframework.org/Selenium2Library/Selenium2Library.html
#    Go to  ${main_page}
#    Maximize Browser Window
#    Click button  ${lctr_btn_kluch_slovo}
#    Sleep  5s
#    Capture Page Screenshot
#    Input text  ${input_to_kluch_slovo}   брухт
#    Wait Until Element Is Visible  ${first_link_for_bruht}
#    Click element  ${first_link_for_bruht}
#    Click element  ${first_link_for_bruht_v2}
#    Click Link  ${first_link_for_bruht_v2}
#    Log Location
#    Log Source
#    Log Title
#    Capture Page Screenshot


#TC Open search result in tab
#    [Documentation]  Знайти аукціони по ключовому слову брухт, клікнути на 1й в списку і відкрити у вкладці
#    [Tags]  кейворди тут https://robotframework.org/Selenium2Library/Selenium2Library.html
#    Click button  ${lctr_btn_kluch_slovo}
#    Wait Until Element Is Visible  ${input_to_kluch_slovo}
#    #Sleep  5s
#    Capture Page Screenshot
#    Input text  ${input_to_kluch_slovo}   брухт
#    Wait Until Element Is Visible  ${first_link_for_bruht}  timeout=5
#    Log Location
#    Log Source
#    Log Title
#    Click element  ${first_link_for_bruht}
#    Log Location
#
#    @{WindowHandles}=  Get Window Identifiers
#    sleep  4s
#    Log Location
#
#    @{WindowIdentifiers}=  Get Window Identifiers
#    sleep  4s
#
#    @{windowTitle}=  Get Window Titles
#
#    Switch Window   @{WindowHandles}[1]
#    sleep  3s
#    Close Window
#    Sleep 3s
#
#    Switch Window   @{WindowHandles}[0]
#    Close Window


TC Compare search status results active.tendering on http://185.25.116.133:4242 and https://prozorro.sale
    [Documentation]  Зайти на дев і прод і порівляти результатипошукупостатусу Прийняття заяв на участь
    [Tags]   пошук по статусам
    #кейворди тут https://robotframework.org/Selenium2Library/Selenium2Library.html
    Go to   ${lnk_active_tendering_4242}
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}  timeout=20
    ${znaideno value from 4242_v1}=  get variable value  ${value from znaideno_v2}
    ${znaideno value from 4242}=  Get text  ${value from znaideno_v2}


    Capture Page Screenshot
    log many  ${znaideno value from 4242}
    Go to  ${lnk_active_tendering_prod}
    ${znaideno value from prod} =  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from prod}
    Log Location

    should be equal as strings  ${znaideno value from 4242}   ${znaideno value from prod}


TC Compare search status results active.tendering on http://185.25.116.133:4242 and https://prozorro.sale



    Close All Browsers







