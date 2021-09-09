# Це драфт файлу - ще нічого не робив


#https://www.youtube.com/watch?v=DCgrW-i9cT8&list=PLUDwpEzHYYLsCHiiihnwl3L0xPspL7BPG&index=24
*** Settings ***
Library     SeleniumLibrary
Variables   ../robotTests_test.tender-online.com.ua/Resources/locators.py


*** Variables ***
${doc_index}                                             0
${BROWSER_chrome}                                        Chrome
${BROWSER_headless}                                      headlesschrome

${msg_link_is}                                           Лінк має наступний вигляд:
${msg_identical}                                         Сторінки ідентичні
${msg_not_identical}                                     Сторінки не ідентичні

#LOCATORS

${lctr_select_status_value="active.tendering"}            xpath=//*[@id="status"]/option[2]
${lctr_select_status_active.enquiries}                    xpath=//*[@id="status"]/option[3]
${lctr_is_zamovnik}                                       xpath=//*[@id="companies-is_seller"]/option[1]
${lctr_is_uchasnick}                                      xpath=//*[@id="companies-is_seller"]/option[2]
${lctr_select_zamovORuchasnick}                           xpath=//*[@id="registration-form"]/div[1]/div[1]/label
${lctr_is_seller}                                         xpath=//*[@id="companies-is_seller"]


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


#LOCATORS
${about_us_lctr}                                     xpath=//*[@id="__next"]/header/nav/div/ul/li[1]/a
${storinka ne znaidena lctr}                         xpath=//*[@id="__next"]/div/h1
${logo_me_gov_ua}            xpath=//*[@id="__next"]/footer/div[1]/a[1]


#values and variables
${storika ne znaidena_str}  Сторінка не знайдена


*** Keywords ***
Open Browser Chrome
    [Documentation]  Відкрити хромбраузер в хедлессмоді
    [Arguments]   ${BROWSER_headless}   ${logo_page}
    Open Browser    ${BROWSER_headless}  ${logo_page}
    Maximize Browser Window


Open Browser Chrome in headless_mode
    Open Browser    ${BROWSER_headless}
    Maximize Browser Window


Compare url and links
    [Arguments]  ${msg_identical}
    ${url}=     get location
    should be true  '${url}' in '${logo_page}'
    #log to console  ${msg_identical}
    #Capture Page Screenshot

Compare main_page link with current
    [Arguments]  ${msg_identical}
    #Click Link  ${main_page}
    ${url}=     get location
    should be true  '${url}' in '${main_page}'

#https://github.com/vargatuk/portal/blob/master/Resource/page_object/main.robot
Compare zamovnik or not
    [Arguments]  ${lctr_is_zamovnik}
    Wait until element is visible   ${lctr_is_zamovnik}     timeout=20
    ${is_zamovnik}=  get variable value  ${lctr_is_zamovnik}
    should be true  '${is_zamovnik}' in '${lctr_is_zamovnik}'   msg='значення співпадають'

Close my browsers
    Close all browsers



*** Test Cases ***
TC1 Open main page in headless chome
    Open Browser Chrome   ${logo_page}  ${BROWSER_headless}

TC2 Comparing ${logo_page} and current url
    Compare url and links   ${msg_identical}

TC3 Comparing ${main_page} and current url
    Open Browser Chrome  ${main_page}  ${BROWSER_headless}
    Compare main_page link with current  ${msg_identical}

TC4 Comparing urls about_us me.gov.ua
    Open Browser Chrome  ${about_page}  ${BROWSER_headless}
    ${url}=     get location
    should be true  '${url}' in '${about_page}'
    ${text_1} =  Get text  ${storinka ne znaidena lctr}
    should be equal as strings  ${text_1}   ${storika ne znaidena_str}
    Click Image     Міністерство економічного розвитку і торгівлі України

TC5 Comparing urls about_us Transparency International Ukraine
    Open Browser Chrome  ${about_page}  ${BROWSER_headless}
    ${url}=     get location
    should be true  '${url}' in '${about_page}'
    ${text_1} =  Get text  ${storinka ne znaidena lctr}
    should be equal as strings  ${text_1}   ${storika ne znaidena_str}
    Location Should Contain     http://185.25.116.133:4242/about
    Click Image     Transparency International Ukraine



TC6 Comparing urls about_us and page should contain 12 hrefs
  [Documentation]  Перевірка наявності 12 лінків на сторінці

    Page Should Contain Link  https://info.prozorro.sale/finansova-informaciya
    Page Should Contain Link  https://info.prozorro.sale/team
    Page Should Contain Link  https://info.prozorro.sale/handbook
    Page Should Contain Link  https://info.prozorro.sale/komisiya-dp-prozorroprodazhi
    Page Should Contain Link  https://info.prozorro.sale/dokumenty-dp-prozorroprodazhi
    Page Should Contain Link  https://docs.google.com/document/d/1krVY6oEheY-QlDSQUjG0eahhqrPnAtw7m4ZurzQ9Dc8/edit
    Page Should Contain Link  https://info.prozorro.sale/info/elektronni-majdanchiki-ets-prozorroprodazhi-cbd2
    Page Should Contain Link  https://info.prozorro.sale/majdanchikam
    Page Should Contain Link  https://info.prozorro.sale/vakansiyi
    Page Should Contain Link  https://info.prozorro.sale/za-pidtrimki
    Page Should Contain Link  https://www.youtube.com/channel/UCbLoGscHsp0-XjE75KWr-Sw
    Page Should Contain Link  https://www.facebook.com/Prozorro.sale

    Close my browsers

#https://www.youtube.com/watch?v=D0LOql-_3-s  how to handle tabs and windows in browser

