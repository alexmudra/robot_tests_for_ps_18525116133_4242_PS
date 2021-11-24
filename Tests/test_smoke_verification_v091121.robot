*** Settings ***
Library     SeleniumLibrary
Library  String
Library  DateTime
Library  Collections


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
${btn_srch_auc_status}                                    xpath=//div/button[@data-test-id="status_search_action"]

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

#локатори для статусів
${lctr_before_input_status}             xpath=//*[text()="Статус"][1]/following-sibling::div
${lctr_active_tend_status}              xpath=(//*[text()="Прийняття заяв на участь"])[1]
${lctr_active_auction_status}              xpath=(//*[text()="Аукціон"])[1]


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
@{valid_auctionIDs_list}=    Create List


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

Get elements count
    [Arguments]  ${locator_xpath}
    ${count}=  Get Element Count  ${locator_xpath}
    log to console  "Quontity of ID elements are:" ${count}
    log many  ${count}


Verify auction titles
    [Arguments]  @{valid_auctionIDs_list}

    Go To  ${valid_auctionIDs_list}[1]
    ${title_txt}=   Get Title
    Log to console   ${title_txt}
    Log Many  ${title_txt}
    Title Should Be  ${title_txt}
    Capture Page Screenshot

Verify znaid. result >0 and convert znaideno results value into integer

    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
    Set Suite Variable  ${converted_znaideno_value_to_int}   ${EMPTY}
    ${converted_znaideno_value_to_int}=   Convert To Integer  ${without_wSpace_srch_results_aucID}
    log to console  Результати пошуку в числовому форматі:${converted_znaideno_value_to_int}
    Log many  Результати пошуку в числовому форматі:${converted_znaideno_value_to_int}

Verify page shouldn't contain error phrases  #задача тут https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
    Page Should Not Contain  Документ завантажується
    Page Should Not Contain  Помилка завантаження

Verity element str_length > 0
    [Arguments]   ${elem_locator}
    ${q}  Get text  ${elem_locator}
    #Should Be Equal As Strings
    ${elem_str_lengths}=  Get Length  ${q}  #message=Текст наявний!
    log to console  ${elem_str_lengths}
    log many  ${q}
    log many  ${elem_str_lengths}
    Should Be True	 ${elem_str_lengths}>0

Get second str after separator ": "
    [Arguments]   ${elem_locator}
    Set Test Variable  ${get_txt_from_both_part}  ${EMPTY}
    ${get_txt_from_both_part}=   Get text   ${elem_locator}
    Set Test Variable  ${sep}   :
    log to console  ${sep}
    #Set Test Suite  @{list_string}   @{EMPTY}
    @{list_string}=     split string    ${get_txt_from_both_part}    separator=${sep}   #за індексом 1 буде текст із ID, Органі
    #затор Оголошено:, Початок аукціону:, № лоту:
    log to console   Субстрінга така:${list_string}[1]
    log many         Субстрінга така:${list_string}[1]
    ${num}=         evaluate       '${list_string}[1]'.replace(',','')

Get search results and convert to integer
    #[Arguments]   ${value from znaideno_v2}
    Wait until element is visible  ${lctr_znaideno_srch_result}    timeout=10
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${converted_to_int_srch_value}  Convert To Integer  ${without_wSpace_srch_results}
    log to console  "Search results in integer are:" ${converted_to_int_srch_value}
    log many  ${converted_to_int_srch_value}
    [RETURN]  ${converted_to_int_srch_value}

Get active.tendering status in prod
    [Arguments]  ${host}
    Go to  ${host}
    Maximize Browser Window
    Click button      ${btn_srch_auc_status}                      #//*[@data-test-id="status_search_action"]
    Element Should Be Visible    ${lctr_before_input_status}      #//*[text()="Статус"][1]/following-sibling::div
    Element Should Be Visible   ${lctr_active_tend_status}        #(//*[text()="Прийняття заяв на участь"])[1]
    Click element      ${lctr_active_tend_status}                 #(//*[text()="Прийняття заяв на участь"])[1]

Get active.auction status in prod
    [Arguments]  ${host}
    Go to  ${host}
    Maximize Browser Window
    Click button      ${btn_srch_auc_status}                      #//*[@data-test-id="status_search_action"]
    Element Should Be Visible    ${lctr_before_input_status}      #//*[text()="Статус"][1]/following-sibling::div
    Element Should Be Visible   ${lctr_active_auction_status}        #(//*[text()="Аукціон"])[1]
    Click element      ${lctr_active_auction_status}                 #(//*[text()="Аукціон"])[1]



*** Test Cases ***

TC Test header ${PROD_HOST_URL}/aboutUS
    [Documentation]  Перевірка чи відкривається розділ "Про нас"
    [Tags]   тестування_header

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
    [Tags]   тестування_landingPage

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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click element  ${tab_contacts}
    Wait until element is visible  ${artcl_h7_prozorro}    timeout=20
    Location Should Be  ${INFO_PROD_HOST_URL}contacts
    Go Back
    Location Should Be  https://prozorro.sale//auction/search
    ${loc} =  get location

TC14 Test header tabs streams buyers on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Користувачам->Покупцям
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
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
    [Tags]   тестування_header
    Go To  ${PROD_HOST_URL}/auction/search
    Maximize Browser Window
    Click element  ${tab_contacts}
    Wait until element is visible  ${artcl_h7_prozorro}    timeout=20
    Location Should Be  ${INFO_PROD_HOST_URL}contacts
    Go Back
    Location Should Be  https://prozorro.sale//auction/search
    ${loc} =  get location

TC Test header tabs streams Land_market on ${PROD_HOST_URL}
    [Documentation]  Перевірка чи відкривається розділ Напрямки Роботи->Ринок Землі
    [Tags]   тестування_header
    Go To  ${main_page_prod}auction/search
    Maximize Browser Window
    #Set Window Size ${1400} ${600}
    Mouse Over  ${streams_tab}
    Wait Until Element Is Visible  //div/ul/li/a[.='Ринок землі']  timeout=20s
    #Click element  //li/a[contains(text(),'Ринок землі')]
    Click element  //div/ul/li/a[.='Ринок землі']
    Switch window  title:Ринок землі — Prozorro.Sale
    ${url_loc}=  Get location
    log many  ${url_loc}
    Location Should Be  https://info.prozorro.sale/Land_market


ТС Test auct. search results "заводі" vs "заводів" in ${PROD_HOST_URL}

   [Documentation]  Порівняння рез. пошуку "завод" і "заводів"
   [Tags]   пошук_по_ключовим_словам

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
    [Tags]   пошук_по_ключовим_словам
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
    [Tags]   пошук_по_ключовим_словам

    Go to  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click button  ${lctr_edrpou_search_action}
    Input text  ${lctr_search_org_input}   21560045 – Акціонерне товариство "Укрпошта
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${znaideno value from prod} =  Convert To Integer  ${without_wSpace_srch_results}
    ${var_value_from_znaideno}=  Set variable  ${without_wSpace_srch_results}
    Log Many  ${var_value_from_znaideno}
    Should Be True   ${var_value_from_znaideno} >25000


TC Test yesterday calendar value & active.auction ==0 on ${PROD_HOST_URL}
        [Documentation]  результати пошуку по вчорашній даті + статус:Аукціон ==0
        [Tags]   пошук_по_даті_і_статусу_аукціону

        ${Yesterday_Date} =    Get Current Date    result_format=%d.%m.%Y   increment=-1 day
        Log    ${Yesterday_Date}
        Log Many  ${Yesterday_Date}
        Go To  ${PROD_HOST_URL}?offset=10&status=active.auction&date[auction]=${Yesterday_Date}%E2%80%94${Yesterday_Date}
        Maximize Browser Window
        Wait until element is visible  ${value from znaideno_v2}    timeout=20
        ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
        ${without_wSpace_srch_results_1}=  Remove String   ${znaideno value from prod}     ${SPACE}
        log to console  ${without_wSpace_srch_results_1}
        log  ${without_wSpace_srch_results_1}
        ${znaideno value from prod_1} =  Convert To Integer  ${without_wSpace_srch_results_1}
        Should Be True  ${znaideno value from prod_1}==0



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




ТС Test conmaring auct. search results "завод" & "цукровий завод"

    [Documentation]  Порівняння результатів пошуку по "завод" > "цукровий завод"
    [Tags]   пошук_по_ключовим_словам
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
    [Tags]   тестування_результатів_пошуку
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
    [Tags]   тестування_результатів_пошуку
    Go to  https://prozorro.sale/?status=active.tendering
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${convert_act_tend_sts_to_int}  Convert To Integer  ${without_wSpace_srch_results_aucID}
    ${check_sts} =  SHOULD BE TRUE  ${convert_act_tend_sts_to_int} >0

    log many  ${znaideno value from prod}
    log to console   ${check_sts}


TC Test search res. active.tendering>0,open auctions and verify auct.Titles
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності auctionTitles
    [Tags]    тестування_результатів_пошуку
    Go to  https://prozorro.sale/?status=active.tendering
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${convert_act_tend_sts_to_int}  Convert To Integer  ${without_wSpace_srch_results_aucID}
    #Search results convert to integer on prod  ${value from znaideno_v2}
    SHOULD BE TRUE  ${convert_act_tend_sts_to_int} >0
    Get elements count  //p[starts-with(text(),"UA-")]    #//strong[text()='ID: '] або //p[starts-with(text(),"UA-")]
    #@{valid_auctionIDs_list}=    Create List
    @{IDs_list} =  Get WebElements  //p[starts-with(text(),"UA-")]
    FOR     ${element}  IN  @{IDs_list}
        ${ID_text}=  Get Text   ${element}  #отримуємо ІД аукціону
        ${valid__auc_ID}=  Get Substring  ${ID_text}  4  #відрізаємо ID:  від ІД аукціону
        ${auction_links} =   Set Variable  ${PROD_HOST_URL}auction/${valid__auc_ID}  #сетапимо перемінну для валідних лінків #https://prozorro.sale/auction/UA-PS-2021-11-02-000032-1
        #Log to console  ${auction_links}
        Append To List    ${valid_auctionIDs_list}     ${auction_links}
    END
    #в окремому циклі перевіряємо тайтли в 10ти аукціонах
    FOR  ${i}  IN  @{valid_auctionIDs_list}
         Log to console  ${i}
         Continue For Loop If  '${i}'=='Create List'
        Go To  ${i}
        ${title_txt}=   Get Title
        Log to console   ${title_txt}

    END



#TC Test search res. active.tendering in ${btn_srch_auc_status}
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь
#    [Tags]   тестування результатыв пошуку
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
    [Tags]   тестування_footer
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
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_team_prod}
    Wait until element is visible  ${artcl_h4_prozorro}     timeout=20
    Location Should Be  https://prozorro.sale/team
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}
#
TC Test footer section ${PROD_HOST_URL}handbook
    [Documentation]  Перевірка чи відкривається розділ "ПРОЗОРИЙДОВІДНИК"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_handbook_prod}
    Wait until element is visible  ${artcl_h5_prozorro_handbook}    timeout=20
    Location Should Be  https://info.prozorro.sale/handbook
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer section ${PROD_HOST_URL}dokumenty-dp-prozorroprodazhi
    [Documentation]  Перевірка чи відкривається розділ "Документи ДП "Прозорро.Продажі"
    [Tags]   тестування_footer
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
    [Tags]   тестування_footer
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
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_elektronni-majdanchiki-ets-prozorroprodazhi-cbd2_prod}
    #${tab_elektronni-majdanchiki-ets-prozorroprodazhi-cbd2_prod}  xpath=//li/a[starts-with(text(),'Майданчики Прозорро.Продажі')]

    Wait until element is visible  ${artcl_h9_prozorro}     timeout=20
    #${artcl_h9_prozorro}                                     xpath=//table[@class='violet sticky-second']

    Location Should Be   https://prozorro.sale/info/elektronni-majdanchiki-ets-prozorroprodazhi-cbd2
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer section ${PROD_HOST_URL}napryamki-roboti
    [Documentation]  Перевірка чи відкривається розділ "напрямки роботи"
    [Tags]   тестування_footer
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
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Click link  ${tab_vakansiyi_cbd2_prod}
    Wait until element is visible  ${artcl_h11_prozorro}     timeout=20
    Location Should Be   https://info.prozorro.sale/vakansiyi
    Go Back
    Location Should Be  https://prozorro.sale/auction/search
    ${loc} =  get location
    log many  ${loc}

TC Test footer ${PROD_HOST_URL}youtube
    [Documentation]  Перевірка чи відкривається розділ "Уoutube"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Execute Javascript	 window.scrollTo(0,document.body.scrollHeight);
    Scroll Element Into View   xpath=//div[contains(@class,'footerstyles')]//descendant::a[11]   #локатор батона ютуба
    Click element   xpath=//div[contains(@class,'footerstyles')]//descendant::a[11]
    Sleep  10
    Switch window   title:Prozorro.Продажi - YouTube
    Location Should Be   https://www.youtube.com/channel/UCbLoGscHsp0-XjE75KWr-Sw
    Wait until element is visible  //yt-formatted-string[text()='Prozorro.Продажi']    timeout=20

TC Test footer https://www.facebook.com/Prozorro.sale btn
    [Documentation]  Перевірка чи відкривається розділ "facebook"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Execute Javascript	 window.scrollTo(0,document.body.scrollHeight);
    Scroll Element Into View   xpath=//div[contains(@class,'footerstyles')]//descendant::a[12]   #локатор батона FB
    Click element   xpath=//div[contains(@class,'footerstyles')]//descendant::a[12]
    Sleep  10
    Switch window   title:Prozorro.Продажі - Home | Facebook
    Location Should Be   https://www.facebook.com/Prozorro.sale
    Wait Until Page Contains   Prozorro.Продажі    timeout=20

TC Test footer https://www.instagram.com/prozorro.sale btn
    [Documentation]  Перевірка чи відкривається розділ "instagram"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Execute Javascript	 window.scrollTo(0,document.body.scrollHeight);
    Scroll Element Into View   xpath=//div[contains(@class,'footerstyles')]//descendant::a[13]   #локатор батона Інстаграм
    Click element   xpath=//div[contains(@class,'footerstyles')]//descendant::a[13]
    Sleep  10
    Switch window   title:Login • Instagram
    #Switch window   title:@prozorro.sale is on Instagram
    #Location Should Be   https://www.instagram.com/prozorro.sale не спрацює, тому що Інст вимагає авторизацію
    Location Should Contain   instagram   #https://www.instagram.com/accounts/login/
    #Wait Until Page Contains   Prozorro.Продажі – система онлайн аукціонів    timeout=20

TC Test footer https://www.me.gov.ua/?lang=uk-UA btn
    [Documentation]  Перевірка чи відкривається розділ "Mін.ек.розвитку України"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Execute Javascript	 window.scrollTo(0,document.body.scrollHeight);
    Scroll Element Into View   xpath=//*[@alt="Міністерство економічного розвитку і торгівлі України"]   #локатор батона Мін.ек.розв.України
    Click element   xpath=//*[@alt="Міністерство економічного розвитку і торгівлі України"]
    #Sleep  10
    Switch window   title:Міністерство економіки України -> головна сторінка
    Location Should Be   https://www.me.gov.ua/?lang=uk-UA
    Wait Until Page Contains   Мінекономіки    timeout=20


TC Test footer https://ti-ukraine.org btn
    [Documentation]  Перевірка чи відкривається розділ "Transp. Intern. Ukraine"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    Execute Javascript	 window.scrollTo(0,document.body.scrollHeight);
    Scroll Element Into View   xpath=//*[@alt="Transparency International Ukraine"]   #локатор батона Transp. Intern. Ukraine
    Click element   xpath=//*[@alt="Transparency International Ukraine"]
    Switch window   title:Трансперенсі Інтернешнл Україна/TI Ukraine
    Location Should Be   https://ti-ukraine.org/
    Wait Until Page Contains   Трансперенсі Інтернешнл Україна    timeout=20

TC Test footer ${PROD_HOST_URL}za pidtrimki
    [Documentation]  Перевірка чи відкривається розділ "За підтримки"
    [Tags]   тестування_footer
    Go To  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    #Execute Javascript	 window.scrollTo(0,document.body.scrollHeight);
    Scroll Element Into View   xpath=//*[@alt='За підтримки...']  #локатор батона За підтримки
    Click element   xpath=//*[@alt='За підтримки...']
    Switch window   url:https://info.prozorro.sale/za-pidtrimki
    Location Should Be   https://info.prozorro.sale/za-pidtrimki
    Wait Until Element Is Visible  xpath=//*[text()='За підтримки:']  timeout=10  #перевіряємо чи є текст Для підтримки


TC Test active.tendering>0,Test open auction & verify auct.ID in preview card on ${PROD_HOST_URL}.v1
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності ID:
    [Tags]   тестування_картки_аукціону
    Go to  https://prozorro.sale/?status=active.tendering
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    Verify znaid. result >0 and convert znaideno results value into integer

    ${elem} =  Get text   (//*[text()='ID: ']/..)[1]   #читаємо текст ІД із превьюшки 1го аукціону в списку
    #ікспас на превьюшці для ID: //*[text()='ID: ']/..  буде мінімум 10 аукціонів
    ${str_without_org}=  Remove String  ${elem}  ID:
    log to console   ${str_without_org}
    ${elem_str_lengths}=  Get Length  ${str_without_org}
    log to console  ${elem_str_lengths}
    log many  ${elem_str_lengths}
    Should Be True	 ${elem_str_lengths}>0


TC Test active.tendering>0,Test open auction & verify auct.ID in preview card on ${PROD_HOST_URL}.v2
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності ID:(Альтернативний ТК)
    [Tags]   тестування_картки_аукціону
    Go to  https://prozorro.sale/?status=active.tendering
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}    timeout=20
    Verify znaid. result >0 and convert znaideno results value into integer
    Set Test Variable  ${elem_locator}  (//*[text()='ID: ']/..)[1]
    Get second str after separator ": "  ${elem_locator}
    Verity element str_length > 0  ${elem_locator}



TC Test open auction & verify auct.Title preview card on ${PROD_HOST_URL}
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності auctionTitles
    [Tags]   тестування_картки_аукціону
    Go to  ${PROD_HOST_URL}?status=active.tendering
    Maximize Browser Window
    Verify znaid. result >0 and convert znaideno results value into integer     #скалярна перемінна із інтовим рез. пошуку назив. ${converted_znaideno_value_to_int}
    #Run Keyword If  ${converted_znaideno_value_to_int}>0
    Verify page shouldn't contain error phrases  #https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
    Scroll element into view  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Wait until element is visible  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]   timeout=20
    Set Test Variable  ${elem_locator}  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]  #ікспас для превью тайтлік процедур
    Verity element str_length > 0  ${elem_locator}



TC Test open auction & verify auctOrganizer on auction prefiew cadr ${PROD_HOST_URL}
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності Значення в полі Організатор
    [Tags]   тестування_картки_аукціону
    Go to  ${PROD_HOST_URL}?status=active.tendering
    Maximize Browser Window
    Verify znaid. result >0 and convert znaideno results value into integer     #скалярна перемінна із інтовим рез. пошуку назив. ${converted_znaideno_value_to_int}
    Verify page shouldn't contain error phrases  #https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
    Scroll element into view  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Wait until element is visible  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]

    ${elem} =  Get text   //*[text()='Організатор: ']/..   #ікспас на превьюшці для Організатор: //*[text()='Організатор: ']/..
    ${str_without_org}=  Remove String  ${elem}  Організатор:
    log to console   ${str_without_org}
    #//*[text()='Організатор: ']/..//following-sibling::text()[1]     #ікспас на превьюшці для Організатор. Значення [object Text]. It should be an element.
    ${elem_str_lengths}=  Get Length  ${str_without_org}
    log to console  ${elem_str_lengths}
    log many  ${elem_str_lengths}
    Should Be True	 ${elem_str_lengths}>0


TC Test open auction & verify auctOrganizer on auction prefiew cadr ${PROD_HOST_URL} with spec keyword
    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності Значення в полі Організатор
    [Tags]   тестування_картки_аукціону
    Go to  ${PROD_HOST_URL}?status=active.tendering
    Maximize Browser Window
    Verify znaid. result >0 and convert znaideno results value into integer     #скалярна перемінна із інтовим рез. пошуку назив. ${converted_znaideno_value_to_int}
    Verify page shouldn't contain error phrases  #https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
    Scroll element into view  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Wait until element is visible  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]

    Set Test Variable  ${elem_locator}  (//*[text()='Організатор: ']/..)[1]
    Log many  ${elem_locator}
    Get second str after separator ": "  ${elem_locator}
    Verity element str_length > 0  ${elem_locator}
