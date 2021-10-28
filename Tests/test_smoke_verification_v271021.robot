*** Settings ***
Library     SeleniumLibrary
Library  String
#Suite Setup  Open Browser Chrome in headless_mode
Suite Setup  Open main_page_prod in UI Chome mode
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
${auc_ID_prod}  UA-PS-2021-09-24-000017-1


#LOCATORS

${lctr_select_status_value="active.tendering"}            xpath=//*[@id="status"]/option[2]
${lctr_select_status_active.enquiries}                    xpath=//*[@id="status"]/option[3]
${lctr_is_zamovnik}                                       xpath=//*[@id="companies-is_seller"]/option[1]
${lctr_is_uchasnick}                                      xpath=//*[@id="companies-is_seller"]/option[2]
${lctr_select_zamovORuchasnick}                           xpath=//*[@id="registration-form"]/div[1]/div[1]/label
${lctr_is_seller}                                         xpath=//*[@id="companies-is_seller"]
${lctr_search_btn_magnifier}                              xpath=//*[@id="__next"]/div[2]/div/div[1]/div/button
${lctr_status_name_in_auct_page}                          xpath=//aside[contains(@class,"meta-blockstyles__FixedBlock-v6fx5m-0 bNaTcU")]
${input_search_field}                                     xpath=//div/input
${search_btn_magnifier}                                   xpath=(//div/button[contains(@class,'Button')])[1]
${lctr_auct_№}                                            xpath=//div/button[@data-test-id="aid_search_action"]

${value from znaideno_v2}                                xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено: ")]
${lctr_znaideno_srch_result}                             xpath=//span[@data-test-id='search-result-count']
${lctr_edrpou_search_action}                             xpath=//div/button[@data-test-id="edrpou_search_action"]
${artcl_h3_prozorro}                                     xpath=//article/h3[contains(text(),'«Прозорро.Продажі» - державне підприємство, що')]
${streams_tab}                                           xpath=//span[starts-with(text(),'Напрямки роботи')]
${artcl_h2_prozorro}                                     xpath=//footer/div/h2/span[contains(text(),'Будуємо ')]
${input_aucID_srch_input}                                 xpath=//div/input[@data-test-id="aid_search_filter"]


#перемінні із http://185.25.116.133:4242/
${BROWSER_chrome}                                       Chrome
${BROWSER_headless}                                     headlesschrome

${main_page_4242}                                            http://185.25.116.133:4242/
${about_page}                                           http://185.25.116.133:4242/about

${main_page_prod}                                            https://prozorro.sale/
${news_page}                                            https://info.prozorro.sale/news
${streams_page}                                         https://info.prozorro.sale/streams
${bi_page}                                              https://bi.prozorro.sale/#/
${prodavcyam_page}                                      https://info.prozorro.sale/prodavcyam
${pocupcyam_page}                                       https://info.prozorro.sale/pokupcyam
${contacts_page}                                        https://info.prozorro.sale/contacts


#LOCATORS
${about_us_lctr}                                     xpath=//*[@id="__next"]/header/nav/div/ul/li[1]/a
${storinka ne znaidena lctr}                         xpath=//*[@id="__next"]/div/h1
${logo_me_gov_ua}                                    xpath=//*[@id="__next"]/footer/div[1]/a[1]
${lctr_btn_kluch_slovo}                              xpath=//div[@class="sc-13tsmp8-0 cQILxt brix-block sc-52kzql-0 fOlbDo brix-flex"]/child::button[1]
${input_to_kluch_slovo}        xpath=//input[@name="query"]
${znaideno elements}  xpath=//span[@data-test-id="znaideno_value"]
${znaideno elements}  xpath=//span[@data-test-id="znaideno_value"]
${znaideno and value}   xpath=//*[@id="__next"]/div[3]/div[1]

${input_main_search_field}  xpath=//*[@id="__next"]/div[2]/div/div[1]/input

${lctr_search_org_input}                                 xpath=//*[@id="react-select-2-input"]


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

Open main_page_prod in UI Chome mode
    [Documentation]  Відкрити браузер в UI режимі(можливо відкрити headlessbode)
    [Tags]  браузер
    Open Browser Chrome   ${main_page_prod}  ${BROWSER_chrome}
    Maximize Browser Window

Open Browser Chrome in headless_mode
    Open Browser  ${main_page_prod}   ${BROWSER_headless}
    Maximize Browser Window

Compare url and links
    [Arguments]  ${msg_identical}
    ${url}=     get location
    should be true  '${url}' in '${main_page_prod}'
    #log to console  ${msg_identical}
    #Capture Page Screenshot

Compare main_page link with current
    [Arguments]  ${msg_identical}
    #Click Link  ${main_page_4242}
    ${url}=     get location
    should be true  '${url}' in '${main_page_prod}'


Compare zamovnik or not
    [Arguments]  ${lctr_is_zamovnik}
    Wait until element is visible   ${lctr_is_zamovnik}     timeout=20
    ${is_zamovnik}=  get variable value  ${lctr_is_zamovnik} #//span[@data-test-id="znaideno_value"]
    should be true  '${is_zamovnik}' in '${lctr_is_zamovnik}'   msg='значення співпадають'

*** Test Cases ***


ТС Test auct. search results "заводі" vs "заводів" in ${PROD_HOST_URL}

   [Documentation]  Порівняння рез. пошуку "завод" і "заводів"
   [Tags]   пошук

   Go to  ${main_page_prod}
    Maximize Browser Window
    Click button  ${lctr_btn_kluch_slovo}
    Input text  ${input_to_kluch_slovo}   завод
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    log to console  ${without_wSpace_srch_results}
    log  ${without_wSpace_srch_results}
    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
    ${var_value_from_znaideno_zavod}=  Set variable  ${without_wSpace_srch_results}
    #${zavod_value}=  Evaluate     ${var_value_from_znaideno_zavod} < 10
    log to console  ${var_value_from_znaideno_zavod}
    log many  ${var_value_from_znaideno_zavod}

    Go to  ${main_page_prod}
    Maximize Browser Window
    Click button  ${lctr_btn_kluch_slovo}
    Input text  ${input_to_kluch_slovo}   заводів
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_1}=  Remove String   ${znaideno value from prod}     ${SPACE}
    log to console  ${without_wSpace_srch_results_1}
    log  ${without_wSpace_srch_results_1}
    ${znaideno value from prod_1} =  Convert To Integer  ${without_wSpace_srch_results_1}
    ${var_value_from_znaideno_zavodiv}=  Set variable  ${without_wSpace_srch_results_1}


    ${get_res_in_%}=  Evaluate     ${var_value_from_znaideno_zavodiv} < ${var_value_from_znaideno_zavod}

    log to console  ${var_value_from_znaideno_zavodiv}
    log many  ${var_value_from_znaideno_zavodiv}

ТС Test auct. search results організатор "укрпошта" via using direct link
    [Documentation]  Пошук по організатору "укрпошта" і результат >25000
    [Tags]   пошук
    Go to  ${PROD_HOST_URL}auction/search?offset=10&edrpou=21560045
    Maximize Browser Window
    Wait until element is visible  ${lctr_znaideno_srch_result}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
    ${var_value_from_znaideno}=  Set variable  ${without_wSpace_srch_results}
    Log Many  ${var_value_from_znaideno}
    Should Be True   ${var_value_from_znaideno} >25000



ТС Test auct. search results організатор "укрпошта" via using input lctr
    [Documentation]  Пошук по організатору "укрпошта" і результат >25000
    [Tags]   пошук

    Go to  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click button  ${lctr_edrpou_search_action}
    Input text  ${lctr_search_org_input}   21560045 – Акціонерне товариство "Укрпошта
    Capture Page Screenshot
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
    ${var_value_from_znaideno}=  Set variable  ${without_wSpace_srch_results}
    Log Many  ${var_value_from_znaideno}
    Should Be True   ${var_value_from_znaideno} >25000


TC Test header ${PROD_HOST_URL}aboutUS
    [Documentation]  Перевірка чи відкривається розділ "Про нас"
    [Tags]   лінк

    Go To  ${PROD_HOST_URL}
    Maximize Browser Window
    Click element  ${tab_about_us_4242}
    Wait until element is visible  ${artcl_h3_prozorro}
    Location Should Be  ${PROD_HOST_URL}about

    Go Back
    Location Should Be  ${PROD_HOST_URL}
    ${loc} =  get location
    log many  ${loc}


TC3 Test footer ${PROD_HOST_URL}aboutUS
    [Documentation]  Перевірка чи відкривається розділ "Про нас"
    [Tags]   лінк
    Go To  ${main_page_prod}auction/search
    Maximize Browser Window
    Click element  ${tab_about_us_4242}
    Wait until element is visible  ${artcl_h2_prozorro}  timeout=20
    Location Should Be  https://prozorro.sale/about

    Go Back
    Location Should Be  ${main_page_prod}auction/search
    ${loc} =  get location
    log many  ${loc}

    #Page Should Contain Link  ${tab_about_us_4242}
    #${tab_about_us_4242}  xpath=//li/a[starts-with(text(),'Про нас')]

TC Test header tabs streams Land_market on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Ринок Землі
    [Tags]   лінк
    Go To  ${main_page_prod}auction/search
    Maximize Browser Window
    #Set Window Size ${1400} ${600}
    Capture Page Screenshot
    Mouse Over  ${streams_tab}
    Capture Page Screenshot
    Wait Until Element Is Visible  //div/ul/li/a[.='Ринок землі']  timeout=20s
    Capture Page Screenshot
    #Click element  //li/a[contains(text(),'Ринок землі')]
    Click element  //div/ul/li/a[.='Ринок землі']
    Switch window  title:Ринок землі — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  https://info.prozorro.sale/Land_market


ТС Test conmaring auct. search results "завод" & "цукровий завод"

    [Documentation]  Порівняння результатів пошуку по "завод" > "цукровий завод"
    [Tags]   пошук
    Go to  ${main_page_prod}
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
    log to console  ${var_value_from_znaideno}
    log many  ${var_value_from_znaideno}

    Go to  ${main_page_prod}
    Maximize Browser Window
    Click button  ${lctr_btn_kluch_slovo}
    Input text  ${input_to_kluch_slovo}   цукровий завод
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_1}=  Remove String   ${znaideno value from prod}     ${SPACE}
    log to console  ${without_wSpace_srch_results_1}
    log  ${without_wSpace_srch_results_1}
    ${znaideno value from prod_1} =  Convert To Integer  ${without_wSpace_srch_results_1}
    ${var_value_from_znaideno_1}=  Set variable  ${without_wSpace_srch_results_1}
    #${zavod_value_1}=  Evaluate     ${var_value_from_znaideno_1} < ${var_value_from_znaideno}
    ${check_comp_res}=  SHOULD BE TRUE  ${var_value_from_znaideno_1} < ${var_value_from_znaideno}
    log to console   ${check_comp_res}
    log many  ${check_comp_res}

#    log to console  ${zavod_value_1}
#    log many  ${zavod_value_1}
    #RUN KEYWORD AND RETURN STATUS    SHOULD BE TRUE    ${var_value_from_znaideno_1} < ${var_value_from_znaideno}

TC Test search res. ${main_page_prod}${auc_ID_prod} less than 10 results
    [Documentation]  Порівняння результатів пошуку по aucID < 10
    [Tags]   пошук
    Go to  ${main_page_prod}
    Maximize Browser Window
    Click button  ${lctr_auct_№}
    Input text  ${input_aucID_srch_input}  ${auc_ID_prod}
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${convert_aucID_to_int}  Convert To Integer  ${without_wSpace_srch_results_aucID}
#    ${var_aucID} =  Evaluate  ${convert_aucID_to_int} < 0
#    RUN KEYWORD AND RETURN STATUS    SHOULD NOT BE TRUE  ${var_aucID}
    ${check_auc_ID}=  SHOULD BE TRUE  ${convert_aucID_to_int} < 10
    log many  ${check_auc_ID}







#Execute JavaScript:  document.getElementById('menuSubItemId').parentNode.setAttribute('display','block!important'); document.getElementById('MenusubitemId').setAttribute('display','block!important')