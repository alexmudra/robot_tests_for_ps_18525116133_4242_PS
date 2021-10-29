*** Settings ***
Library     SeleniumLibrary
Library  Selenium2Screenshots
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

${selected_active.tendering}            xpath=//div[text()='Прийняття заяв на участь']
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
${btn_srch_auc_status}                                                    xpath=//div/button[@data-test-id="status_search_action"]

#від Ані
${artcl_h2_prozorro}                                     xpath=//footer/div/h2/span[contains(text(),'Будуємо ')]
${artcl_h3_prozorro}                                     xpath=//article/h3[contains(text(),'«Прозорро.Продажі» - державне підприємство, що')]
${artcl_h4_prozorro}                                     xpath=//div/h3[starts-with(text(),'Команда ProZorro.Продажі')]
${artcl_h5_prozorro}                                     xpath=//*[@id="root"]/div[2]/section/div[1]/div/div[1]/h5
${artcl_h6_prozorro}                                     xpath=//li/a[starts-with(text(),'Контакти')]
${artcl_h7_prozorro}                                     xpath=//p[starts-with(text(),'У разі')]
${tab_pokuptcyam}                                    xpath=//li/a[starts-with(text(),'Покупцям')]
${tab_prodavtcyam}                                   xpath=//li/a[starts-with(text(),'Продавцям')]
${tab_maydanchykam}                                  xpath=//li/a[starts-with(text(),'Майданчикам')]
${tab_contacts}                                      xpath=//li/a[starts-with(text(),'Контакти')]


#від каті

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
${artcl_h3_prozorro}                                     xpath=//div/h3[starts-with(text(),'Фінансова інформація')]
${artcl_h4_prozorro}                                     xpath=//div/h3[starts-with(text(),'Команда ProZorro.Продажі')]
${artcl_h5_prozorro_handbook}                                     xpath=//div/h1[starts-with(text(),'#ПРОЗОРИЙДОВІДНИК')]
${artcl_h6_prozorro_vutyag}                                     xpath=//div/h3[starts-with(text(),'Витяги з протоколів засіданнь')]
${artcl_h7_prozorro_declar_sob}                                     xpath=//div/p[starts-with(text(),'Декларації Соболева О.Д. (річні):')]
${artcl_h8_prozorro}                                     xpath=//p[@class='oc-text-gray']
${artcl_h9_prozorro}                                     xpath=//table[@class='violet sticky-second']
${artcl_h10_prozorro}                                     xpath=//div/h5[starts-with(text(),'Ринок землі')]
${artcl_h11_prozorro}                                     xpath=//div/h2[starts-with(text(),'Інженер з кібербезпеки')]


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

#від Ані
${tab_about_us}                                      xpath=//li/a[starts-with(text(),'Про нас')]
${tab_news}                                          xpath=//main/div/div/h4[contains(text(),'Новини')]
${tab_napr_roboty}                                   xpath=//*[@id="__next"]/header/nav/div/ul/li[3]/div
${tab_land_market}                                   xpath=//li/a[contains(text(),'Ринок землі')]
${tab_analytics}                                     xpath=//li/a[starts-with(text(),'Аналітика')]
${tab_korystuvacham}                                 xpath=//li/span[starts-with(text(),'Користувачам')]
${tab_contacts}                                      xpath=//li/a[starts-with(text(),'Контакти')]
${INFO_PROD_HOST_URL}                                    https://info.prozorro.sale/


#від Каті
${storika ne znaidena_str}  Сторінка не знайдена
${str_zavod}  завод
${str_21560045_Ukrposhta}  21560045 – Акціонерне товариство "Укрпошта"
${tab_Finans_prod}    xpath=//li/a[starts-with(text(),'Фінансова інформація')]
${tab_team_prod}    xpath=//li/a[starts-with(text(),'Команда')]
${tab_handbook_prod}  xpath=//li/a[starts-with(text(),'#ПРОЗОРИЙДОВІДНИК')]
${tab_komisiya-dp-prozorroprodazhi_prod}  xpath=//li/a[starts-with(text(),'Комісія ДП "ПРОЗОРРО.ПРОДАЖІ"')]
${tab_dokumenty-dp-prozorroprodazhi_prod}  xpath=//li/a[starts-with(text(),'Документи ДП "Прозорро.Продажі')]
${tab_skarhy_prod}  xpath=//li/a[starts-with(text(),'Поскаржитись на торги')]
${tab_elektronni-majdanchiki-ets-prozorroprodazhi-cbd2_prod}  xpath=//li/a[starts-with(text(),'Майданчики Прозорро.Продажі')]
${tab_napryamki-roboti_prod}  xpath=//li/a[starts-with(text(),'Напрямки роботи')]
${tab_vakansiyi_cbd2_prod}  xpath=//li/a[starts-with(text(),'Вакансії')]


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

TC Test header ${PROD_HOST_URL}/aboutUS
    [Documentation]  Перевірка чи відкривається розділ "Про нас"
    [Tags]   лінк

    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click element  ${tab_about_us}
    Wait until element is visible  ${artcl_h3_prozorro}  timeout=20
    Location Should Be  https://prozorro.sale/about
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Verify landing page on ${PROD_HOST_URL}
    [Documentation]  Перевірка лендінг сторінки
    [Tags]   лінк

    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click element  ${tab_about_us}
    Wait until element is visible  ${artcl_h2_prozorro}  timeout=20
    Location Should Be  https://prozorro.sale/about
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test header tabs streams Land_market on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Ринок Землі
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}  timeout=20s
    Click element  ${tab_land_market}
    Switch window  title:Ринок землі — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}Land_market

TC Test header tabs streams timber on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Продаж необробленої деревини
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}   timeout=20s
    Click element  //li/a[contains(text(),'Продаж необробленої деревини')]
    Switch window  title:Продаж необробленої деревини — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}timber

TC Test header tabs streams bankruptcy on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Банкрутство
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}  timeout=20s
    Click element  //li/a[contains(text(),'Банкрутство')]
    Switch window  title:Банкрутство — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  https://prozorro.sale/bankruptcy

TC Test header tabs streams mala on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Мала приватизація
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}   timeout=20s
    Click element  //li/a[contains(text(),'Мала Приватизація')]
    Switch window  title:Мала приватизація Прозорро.Продажі - ProZorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}mala

TC Test header tabs streams orenda on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Оренда державного та комунального майна
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}   timeout=20s
    Click element  //li/a[contains(text(),'Оренда державного та комунального майна')]
    Switch window  title:Оренда майна Прозорро.Продажі - ProZorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}orenda

TC Test header tabs streams commercial on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Комерційні торги
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}   timeout=20s
    Click element  //li/a[contains(text(),'Комерційні Торги')]
    Switch window  title:Комерційні торги — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}commercial

TC Test header tabs streams renewables on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Аукціони з розподілу квоти підтримки
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}   timeout=20s
    Click element  //li/a[contains(text(),'Аукціони з розподілу квоти підтримки')]
    Switch window  title:Аукціони з розподілу квоти підтримки — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}renewables

TC Test header tabs streams vidchuzhennya obyektiv mayna on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Відчуження об'єктів державної власності
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Mouse Over  ${tab_napr_roboty}
    Wait Until Element Is Visible  ${tab_land_market}  timeout=20s
    Click element  //li/a[starts-with(text(),'Відчуження')]
    Switch window  title:Відчуження об'єктів державної власності — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${INFO_PROD_HOST_URL}vidchuzhennya

TC Test header ${PROD_HOST_URL}/analytics on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ "Аналітика"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click element  ${tab_analytics}
    Wait until element is visible  ${artcl_h5_prozorro}  timeout=20
    Location Should Be  https://bi.prozorro.sale/#/
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}



TC Test header ${PROD_HOST_URL}/contacts on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ "Контакти"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}/auction/search
    Maximize Browser Window
    Click element  ${tab_contacts}
    Wait until element is visible  ${artcl_h7_prozorro}    timeout=20
    Location Should Be  ${INFO_PROD_HOST_URL}contacts
    Go Back
    Location Should Be  https://prozorro.sale//auction/search
    ${loc} =  get location

TC14 Test header tabs streams buyers on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Користувачам->Покупцям
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}
    Maximize Browser Window
    Mouse Over  ${tab_korystuvacham}
    Wait Until Element Is Visible  ${tab_pokuptcyam}   timeout=20s
    Click element  ${tab_pokuptcyam}
    Switch window  title:Покупцям — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${PROD_HOST_URL}buyers

TC15 Test header tabs streams sellers on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Користувачам->Продавцям
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}
    Maximize Browser Window
    Mouse Over  ${tab_korystuvacham}
    Wait Until Element Is Visible  ${tab_pokuptcyam}   timeout=20s
    Click element  ${tab_prodavtcyam}
    Switch window  title:Продавцям — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${PROD_HOST_URL}sellers

TC16 Test header tabs streams platforms
    [Documentation]  Перевірка чи відкривається розділ Користувачам->Майданчикам
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}
    Maximize Browser Window
    Mouse Over  ${tab_korystuvacham}
    Wait Until Element Is Visible  ${tab_pokuptcyam}   timeout=20s
    Click element  ${tab_maydanchykam}
    Switch window  title:Майданчикам — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  ${PROD_HOST_URL}platforms

TC17 Test header ${PROD_HOST_URL}/contacts
    [Documentation]  Перевірка чи відкривається розділ "Контакти"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}/auction/search
    Maximize Browser Window
    Click element  ${tab_contacts}
    Wait until element is visible  ${artcl_h7_prozorro}    timeout=20
    Location Should Be  ${INFO_PROD_HOST_URL}contacts
    Go Back
    Location Should Be  https://prozorro.sale//auction/search
    ${loc} =  get location




#ТС Test auct. search results "заводі" vs "заводів" in ${PROD_HOST_URL}
#
#   [Documentation]  Порівняння рез. пошуку "завод" і "заводів"
#   [Tags]   пошук
#
#   Go to  ${main_page_prod}
#    Maximize Browser Window
#    Click button  ${lctr_btn_kluch_slovo}
#    Input text  ${input_to_kluch_slovo}   завод
#    Wait until element is visible  ${value from znaideno_v2}    timeout=20
#    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
#    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
#    log to console  ${without_wSpace_srch_results}
#    log  ${without_wSpace_srch_results}
#    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
#    ${var_value_from_znaideno_zavod}=  Set variable  ${without_wSpace_srch_results}
#    #${zavod_value}=  Evaluate     ${var_value_from_znaideno_zavod} < 10
#    log to console  ${var_value_from_znaideno_zavod}
#    log many  ${var_value_from_znaideno_zavod}
#
#    Go to  ${main_page_prod}
#    Maximize Browser Window
#    Click button  ${lctr_btn_kluch_slovo}
#    Input text  ${input_to_kluch_slovo}   заводів
#    Wait until element is visible  ${value from znaideno_v2}    timeout=20
#    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
#    ${without_wSpace_srch_results_1}=  Remove String   ${znaideno value from prod}     ${SPACE}
#    log to console  ${without_wSpace_srch_results_1}
#    log  ${without_wSpace_srch_results_1}
#    ${znaideno value from prod_1} =  Convert To Integer  ${without_wSpace_srch_results_1}
#    ${var_value_from_znaideno_zavodiv}=  Set variable  ${without_wSpace_srch_results_1}
#
#
#    ${get_res_in_%}=  Evaluate     ${var_value_from_znaideno_zavodiv} < ${var_value_from_znaideno_zavod}
#
#    log to console  ${var_value_from_znaideno_zavodiv}
#    log many  ${var_value_from_znaideno_zavodiv}

#ТС Test auct. search results організатор "укрпошта" via using direct link
#    [Documentation]  Пошук по організатору "укрпошта" і результат >25000
#    [Tags]   пошук
#    Go to  ${PROD_HOST_URL}auction/search?offset=10&edrpou=21560045
#    Maximize Browser Window
#    Wait until element is visible  ${lctr_znaideno_srch_result}    timeout=20
#    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
#    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
#    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
#    ${var_value_from_znaideno}=  Set variable  ${without_wSpace_srch_results}
#    Log Many  ${var_value_from_znaideno}
#    Should Be True   ${var_value_from_znaideno} >25000



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


#TC Test header section ${PROD_HOST_URL}aboutUS
#    [Documentation]  Перевірка чи відкривається розділ "Про нас"
#    [Tags]   лінк
#
#    Go To  ${PROD_HOST_URL}
#    Maximize Browser Window
#    Click element  ${tab_about_us_4242}
#    Wait until element is visible  ${artcl_h3_prozorro}
#    Location Should Be  ${PROD_HOST_URL}about
#
#    Go Back
#    Location Should Be  ${PROD_HOST_URL}
#    ${loc} =  get location
#    log many  ${loc}
#
#
#TC Test header and footer section ${PROD_HOST_URL}aboutUS
#    [Documentation]  Перевірка чи відкривається розділ "Про нас"
#    [Tags]   лінк
#    Go To  ${main_page_prod}auction/search
#    Maximize Browser Window
#    Click element  ${tab_about_us_4242}
#    Wait until element is visible  ${artcl_h2_prozorro}  timeout=20
#    Location Should Be  https://prozorro.sale/about
#
#    Go Back
#    Location Should Be  ${main_page_prod}auction/search
#    ${loc} =  get location
#    log many  ${loc}

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


TC Test search res. active.tendering via dir. link
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь
    [Tags]   пошук
    Go to  https://prozorro.sale/?status=active.tendering
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${convert_act_tend_sts_to_int}  Convert To Integer  ${without_wSpace_srch_results_aucID}
    ${check_sts} =  SHOULD BE TRUE  ${convert_act_tend_sts_to_int} >0

    log many  ${znaideno value from prod}
    log to console   ${check_sts}




#TC Test search res. active.tendering in ${btn_srch_auc_status}
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь
#    [Tags]   пошук
#    Go to  ${main_page_prod}
#    Maximize Browser Window
#    Click button  ${btn_srch_auc_status}
#    Wait until element is visible  ${selected_active.tendering}  timeout=20
#    log to console  ${selected_active.tendering}
#    Click element  ${selected_active.tendering}
#    Wait until element is visible  ${value from znaideno_v2}    timeout=20
#    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
#    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
#    ${convert_act_tend_sts_to_int}  Convert To Integer  ${without_wSpace_srch_results_aucID}
#    ${check_sts} =  SHOULD BE TRUE  ${convert_act_tend_sts_to_int} >0
#
#    log many  ${znaideno value from prod}
#    log to console   ${znaideno value from prod}


TC Test footer section ${PROD_HOST_URL}finansova-informaciya
    [Documentation]  Перевірка чи відкривається розділ "Фінаснова інформація"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_Finans_prod}
    Wait until element is visible  //h3[contains(text(),'Фінансова інформація')]    timeout=20
    Location Should Be   https://info.prozorro.sale/finansova-informaciya
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer ${PROD_HOST_URL}team
    [Documentation]  Перевірка чи відкривається розділ "Команда"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_team_prod}
    Wait until element is visible  ${artcl_h4_prozorro}     timeout=20
    Capture Page Screenshot
    Location Should Be  https://prozorro.sale/team
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}
#
TC Test footer section ${PROD_HOST_URL}handbook
    [Documentation]  Перевірка чи відкривається розділ "ПРОЗОРИЙДОВІДНИК"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_handbook_prod}
    Wait until element is visible  ${artcl_h5_prozorro_handbook}    timeout=20
    Location Should Be  https://info.prozorro.sale/handbook
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer section ${PROD_HOST_URL}komisiya-dp-prozorroprodazhi
    [Documentation]  Перевірка чи відкривається розділ Комісія ДП "ПРОЗОРРО.ПРОДАЖІ"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_komisiya-dp-prozorroprodazhi_prod}
    Wait until element is visible  ${artcl_h6_prozorro_vutyag}    timeout=20
    Location Should Be  https://prozorro.sale/komisiya-dp-prozorroprodazhi
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}


TC Test footer section ${PROD_HOST_URL}dokumenty-dp-prozorroprodazhi
    [Documentation]  Перевірка чи відкривається розділ "Документи ДП "Прозорро.Продажі"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_dokumenty-dp-prozorroprodazhi_prod}
    Wait until element is visible  ${artcl_h7_prozorro_declar_sob}    timeout=20
    Location Should Be   https://info.prozorro.sale/dokumenty-dp-prozorroprodazhi
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}



TC Test footer section ${PROD_HOST_URL}skarhy
    [Documentation]  Перевірка чи відкривається розділ "Поскаржитися на торги"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_skarhy_prod}
    Wait until element is visible  ${artcl_h8_prozorro}     timeout=20
    Location Should Be   https://prozorro.sale/skarhy
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer section ${PROD_HOST_URL}majdanchiki-ets-prozorroprodazhi-cbd2
    [Documentation]  Перевірка чи відкривається розділ "Майданчики Прозоро продажі"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_elektronni-majdanchiki-ets-prozorroprodazhi-cbd2_prod}
    Wait until element is visible  ${artcl_h9_prozorro}     timeout=20
    Location Should Be   https://info.prozorro.sale/info/elektronni-majdanchiki-ets-prozorroprodazhi-cbd2
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer section ${PROD_HOST_URL}napryamki-roboti
    [Documentation]  Перевірка чи відкривається розділ "напрямки роботи"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_napryamki-roboti_prod}
    Wait until element is visible  ${artcl_h10_prozorro}     timeout=20
    Location Should Be   https://prozorro.sale/napryamki-roboti
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer section ${PROD_HOST_URL}vakansiyi
    [Documentation]  Перевірка чи відкривається розділ "Вакансії"
    [Tags]   лінк
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_vakansiyi_cbd2_prod}
    Wait until element is visible  ${artcl_h11_prozorro}     timeout=20
    Location Should Be   https://info.prozorro.sale/vakansiyi
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}





#Execute JavaScript:  document.getElementById('menuSubItemId').parentNode.setAttribute('display','block!important'); document.getElementById('MenusubitemId').setAttribute('display','block!important')