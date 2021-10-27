*** Settings ***
Library     SeleniumLibrary
Library  String
Suite Setup  Open Browser Chrome in headless_mode
Suite Teardown  Close All Browsers


*** Variables ***
${doc_index}                                             0
${BROWSER_chrome}                                        Chrome
${BROWSER_headless}                                      headlesschrome
${DEV_HOST_URL}                                     http://185.25.116.133:4242/
${PROD_HOST_URL}                                    https://prozorro.sale/

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
${input_search_field}                                     xpath=//div/input
${search_btn_magnifier}                                   xpath=(//div/button[contains(@class,'Button')])[1]

${value from znaideno_v2}                                xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено: ")]
${lctr_znaideno_srch_result}                             xpath=//span[@data-test-id='search-result-count']
${lctr_edrpou_search_action}                             xpath=//div/button[@data-test-id="edrpou_search_action"]
${artcl_h3_prozorro}                                     xpath=//article/h3[contains(text(),'«Прозорро.Продажі» - державне підприємство, що')]
${streams_tab}                                           xpath=//span[starts-with(text(),'Напрямки роботи')]


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
${lctr_btn_kluch_slovo}          xpath=//div[@class="sc-13tsmp8-0 cQILxt brix-block sc-52kzql-0 fOlbDo brix-flex"]/child::button[1]
${input_to_kluch_slovo}        xpath=//input[@name="query"]
${znaideno elements}  xpath=//span[@data-test-id="znaideno_value"]
${znaideno elements}  xpath=//span[@data-test-id="znaideno_value"]
${znaideno and value}   xpath=//*[@id="__next"]/div[3]/div[1]

${input_main_search_field}  xpath=//*[@id="__next"]/div[2]/div/div[1]/input
${first_link_for_bruht}  xpath=(//a[contains(@class,"cardcomponent__Title")])[1]
${first_link_for_bruht_v2}  xpath=(//div[contains(@class,"sc-13tsmp8-0 dfiBpb")]/descendant::a)[1]


#values and variables
${storika ne znaidena_str}  Сторінка не знайдена
${str_zavod}  завод
${str_21560045_Ukrposhta}  21560045 – Акціонерне товариство "Укрпошта"

${tab_about_us_4242}  xpath=//li/a[starts-with(text(),'Про нас')]


*** Keywords ***
Open Browser Chrome
    [Documentation]  Відкрити хромбраузер в UI режимі
    [Arguments]   ${BROWSER_headless}   ${logo_page}
    Open Browser    ${BROWSER_headless}  ${logo_page}
    Maximize Browser Window

TC Open mainpage in UI Chome mode
    [Documentation]  Відкрити браузер в UI режимі(можливо відкрити headlessbode
    [Tags]  браузер

    Open Browser Chrome   ${main_page}  ${BROWSER_chrome}

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


ТС Test auct. search results "завод"

   [Documentation]  Пошук по ключовому слову "завод" і відображення результату
   [Tags]   пошук
    Go to  ${main_page}
    Maximize Browser Window
    Click button  ${lctr_btn_kluch_slovo}
    Input text  ${input_to_kluch_slovo}   завод
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    log to console  ${without_wSpace_srch_results}
    log  ${without_wSpace_srch_results}
    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
    ${var_value_from_znaideno}=  Set variable  ${without_wSpace_srch_results}
    ${zavod_value}=  Evaluate     ${var_value_from_znaideno} < 10
    log to console  ${zavod_value}
    log many  ${zavod_value}

ТС Test auct. search results "заводів"

   [Documentation]  Пошук по ключовому слову "заводів" і відображення результату
   [Tags]   пошук
    Go to  ${main_page}
    Maximize Browser Window
    Click button  ${lctr_btn_kluch_slovo}
    Input text  ${input_to_kluch_slovo}   заводів
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_1}=  Remove String   ${znaideno value from prod}     ${SPACE}
    log to console  ${without_wSpace_srch_results_1}
    log  ${without_wSpace_srch_results_1}
    ${znaideno value from prod_1} =  Convert To Integer  ${without_wSpace_srch_results_1}
    ${var_value_from_znaideno_1}=  Set variable  ${without_wSpace_srch_results_1}
    ${zavod_value_1}=  Evaluate     ${var_value_from_znaideno_1} < 10
    log to console  ${zavod_value_1}
    log many  ${zavod_value_1}

ТС Test auct. search results організатор "укрпошта" via using direct link
    [Documentation]  Пошук по організатору "укрпошта" і результат >25000
    [Tags]   пошук
    Go to  http://185.25.116.133:4242/auction/search?offset=10&edrpou=21560045
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
    ${var_value_from_znaideno}=  Set variable  ${without_wSpace_srch_results}
    Log Many  ${var_value_from_znaideno}
    Should Be True   ${var_value_from_znaideno} >25000

    #${str_21560045_Ukrposhta}  21560045 – Акціонерне товариство "Укрпошта"
    #${lctr_edrpou_search_action}                             xpath=//div/button[@data-test-id="edrpou_search_action"]

TC Test header ${DEV_HOST_URL}/aboutUS
    [Documentation]  Перевірка чи відкривається розділ "Про нас"
    [Tags]   лінк

    Go To  ${DEV_HOST_URL}auction/search
    Maximize Browser Window
    Click element  ${tab_about_us_4242}
    Wait until element is visible  ${artcl_h3_prozorro}
    Location Should Be  https://test.prozorro.sale/about

    Go Back
    Location Should Be  http://185.25.116.133:4242/auction/search
    ${loc} =  get location
    log many  ${loc}

    #Page Should Contain Link  ${tab_about_us_4242}
    #${tab_about_us_4242}  xpath=//li/a[starts-with(text(),'Про нас')]

TC Test header tabs streams Land_market
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Ринок Землі
    [Tags]   лінк
    Go To  ${DEV_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${streams_tab}
    Wait Until Element Is Visible  //li/a[contains(text(),'Ринок землі')]  timeout=20s
    Click element  //li/a[contains(text(),'Ринок землі')]
    Switch window  title:Ринок землі — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  https://info.prozorro.sale/Land_market




#Execute JavaScript:  document.getElementById('menuSubItemId').parentNode.setAttribute('display','block!important'); document.getElementById('MenusubitemId').setAttribute('display','block!important')