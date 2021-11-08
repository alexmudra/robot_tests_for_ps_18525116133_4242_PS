*** Settings ***
Library     SeleniumLibrary
Library  String
Library  DateTime
Library  Collections
Suite Setup  Open Browser Chrome in headless_mode
#Suite Setup  Open main_page_prod in UI Chome mode
Suite Teardown  Close All Browsers
#Suite Teardown  Run Keyword If All Tests Passed  Всі тести ПАСС! Портал працює так як треба.



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
${btn_srch_auc_status}                                    xpath=//div/button[@data-test-id="status_search_action"]


#від Ані
${artcl_h2_prozorro}                                     xpath=//footer/div/h2/span[contains(text(),'Будуємо ')]
${artcl_h3_prozorro}                                     xpath=//article/h3[contains(text(),'«Прозорро.Продажі» - державне підприємство, що')]
${artcl_h4_prozorro}                                     xpath=//div/h3[starts-with(text(),'Команда ProZorro.Продажі')]
${artcl_h5_prozorro}                                     xpath=//*[@id="root"]/div[2]/section/div[1]/div/div[1]/h5
${artcl_h6_prozorro}                                     xpath=//li/a[starts-with(text(),'Контакти')]
${artcl_h7_prozorro}                                     xpath=//p[starts-with(text(),'У разі')]


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
${btn_date-picker_prod}  xpath=//button[@data-test-id="auction_date_search_action"]
${input_date_picker_1}  xpath=(//*[contains(@class,"date-pickerstyles")])[2]
${input_date_picker_2}  xpath=(//*[contains(@class,"date-pickerstyles")])[3]

#від Ані
${tab_about_us}                                      xpath=//li/a[starts-with(text(),'Про нас')]
${tab_news}                                          xpath=//main/div/div/h4[contains(text(),'Новини')]
${tab_napr_roboty}                                   xpath=//*[@id="__next"]/header/nav/div/ul/li[3]/div
${tab_land_market}                                   xpath=//li/a[contains(text(),'Ринок землі')]
${tab_analytics}                                     xpath=//li/a[starts-with(text(),'Аналітика')]
${tab_korystuvacham}                                 xpath=//li/a[starts-with(text(),'Користувачам')]
${tab_contacts}                                      xpath=//li/a[starts-with(text(),'Контакти')]
${INFO_PROD_HOST_URL}                                    https://info.prozorro.sale/
${tab_pokuptcyam}                                    xpath=//li/a[starts-with(text(),'Покупцям')]
${tab_prodavtcyam}                                   xpath=//li/a[starts-with(text(),'Продавцям')]
${tab_maydanchykam}                                  xpath=//li/a[starts-with(text(),'Майданчикам')]
${tab_contacts}                                      xpath=//li/a[starts-with(text(),'Контакти')]


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

${lctr_auct_ID}   xpath=//strong[text()='ID: ']

@{valid_auctionIDs_list}=    Create List

#Set Suite Variable  ${elem_locator}   ${EMPTY}
${elem_locator}  Set Suite Variable  ${EMPTY}
#xpath=(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]



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

Get elements count
    [Arguments]  ${locator_xpath}
    ${count}=  Get Element Count  ${locator_xpath}
    log to console  "Quontity of ID elements are:" ${count}
    log many  ${count}


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

#Search results convert to integer on prod
#    [Arguments]   ${value from znaideno_v2}
#    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
#    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
#    ${converted_to_int_srch_value}  Convert To Integer  ${without_wSpace_srch_results}
#    log to console  "Search results in integer are:" ${converted_to_int_srch_value}
#    log many  ${converted_to_int_srch_value}

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

*** Test Cases ***

#https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1635952953010500
#обязательные блоки:
#Інформація про аукціон
#Критерії вибору переможця
#Документація
#Подати пропозицію
#Схожі лоти
#

TC Test open auction & verify auctOrganizer on auction prefiew cadr ${PROD_HOST_URL} вліоатдлоіва
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















#TC Test active.tendering>0,Test open auction & verify auct.ID in preview card on ${PROD_HOST_URL}.v1
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності ID:
#    [Tags]   тестування_картки_аукціону
#    Go to  https://prozorro.sale/?status=active.tendering
#    Maximize Browser Window
#    Wait until element is visible  ${value from znaideno_v2}    timeout=20
#    Verify znaid. result >0 and convert znaideno results value into integer
#
#    ${elem} =  Get text   (//*[text()='ID: ']/..)[1]   #читаємо текст ІД із превьюшки 1го аукціону в списку
#    #ікспас на превьюшці для ID: //*[text()='ID: ']/..  буде мінімум 10 аукціонів
#    ${str_without_org}=  Remove String  ${elem}  ID:
#    log to console   ${str_without_org}
#    ${elem_str_lengths}=  Get Length  ${str_without_org}
#    log to console  ${elem_str_lengths}
#    log many  ${elem_str_lengths}
#    Should Be True	 ${elem_str_lengths}>0


#TC Test active.tendering>0,Test open auction & verify auct.ID in preview card on ${PROD_HOST_URL}.v2
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності ID:(Альтернативний ТК)
#    [Tags]   тестування_картки_аукціону
#    Go to  https://prozorro.sale/?status=active.tendering
#    Maximize Browser Window
#    Wait until element is visible  ${value from znaideno_v2}    timeout=20
#    Verify znaid. result >0 and convert znaideno results value into integer
#    Set Test Variable  ${elem_locator}  (//*[text()='Оголошено: ']/..)[1]
#    ${check_elem_lctr_value}=  Get text   ${elem_locator}
#    log to console  після перезаписування значення локатора наступне:${check_elem_lctr_value}
#    log many  після перезаписування значення локатора наступне:${check_elem_lctr_value}
#    Get second str after separator ": "  ${elem_locator}
#    Verity element str_length > 0  ${elem_locator}

    #(//*[text()='Оголошено: ']/..)[1]  #ікспас для Оголошено: (дата)

#    ${elem} =  Get text   (//*[text()='ID: ']/..)[1]   #читаємо текст ІД із превьюшки 1го аукціону в списку
#    #ікспас на превьюшці для ID: //*[text()='ID: ']/..  буде мінімум 10 аукціонів
#    ${str_without_org}=  Remove String  ${elem}  ID:
#    log to console   ${str_without_org}
#    ${elem_str_lengths}=  Get Length  ${str_without_org}
#    log to console  ${elem_str_lengths}
#    log many  ${elem_str_lengths}
#    Should Be True	 ${elem_str_lengths}>0


    #@{valid_auctionIDs_list}=    Create List
#    @{IDs_list} =  Get WebElements  //p[starts-with(text(),"UA-")]
#    FOR     ${element}  IN  @{IDs_list}
#        ${ID_text}=  Get Text   ${element}  #отримуємо ІД аукціону
#        ${valid__auc_ID}=  Get Substring  ${ID_text}  4  #відрізаємо ID:  від ІД аукціону
#        ${auction_links} =   Set Variable  ${PROD_HOST_URL}auction/${valid__auc_ID}  #сетапимо перемінну для валідних лінків #https://prozorro.sale/auction/UA-PS-2021-11-02-000032-1
#        #Log to console  ${auction_links}
#        Append To List    ${valid_auctionIDs_list}     ${auction_links}






















#TC Test open auction & verify auct.Title preview card on ${PROD_HOST_URL}
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності auctionTitles
#    [Tags]   тестування_картки_аукціону
#    Go to  ${PROD_HOST_URL}?status=active.tendering
#    Maximize Browser Window
#    Verify znaid. result >0 and convert znaideno results value into integer     #скалярна перемінна із інтовим рез. пошуку назив. ${converted_znaideno_value_to_int}
#    #Run Keyword If  ${converted_znaideno_value_to_int}>0
#    Verify page shouldn't contain error phrases  #https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
#    Scroll element into view  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#    Wait until element is visible  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]  5
##    ${elem_str_lengths}=  Get Length  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]   #message=Текст наявний!
##    log to console  ${elem_str_lengths}
##    Should Be True	 ${elem_str_lengths}>0
#    #Verity element str_length > 0
#    #Set Test Variable  ${elem_locator}  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#    #Set global variable  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#     Set Test Variable  ${elem_locator}  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]  #ікспас для превью тайтлік процедур
#
#     Verity element str_length > 0  ${elem_locator}


#
#TC Test open auction & verify auctOrganizer on auction prefiew cadr ${PROD_HOST_URL}
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності Значення в полі Організатор
#    [Tags]   тестування_картки_аукціону
#    Go to  ${PROD_HOST_URL}?status=active.tendering
#    Maximize Browser Window
#    Verify znaid. result >0 and convert znaideno results value into integer     #скалярна перемінна із інтовим рез. пошуку назив. ${converted_znaideno_value_to_int}
#    Verify page shouldn't contain error phrases  #https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
#    Scroll element into view  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#    Wait until element is visible  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#
#    ${elem} =  Get text   //*[text()='Організатор: ']/..   #ікспас на превьюшці для Організатор: //*[text()='Організатор: ']/..
#    ${str_without_org}=  Remove String  ${elem}  Організатор:
#    log to console   ${str_without_org}
#    #//*[text()='Організатор: ']/..//following-sibling::text()[1]     #ікспас на превьюшці для Організатор. Значення [object Text]. It should be an element.
#    ${elem_str_lengths}=  Get Length  ${str_without_org}
#    log to console  ${elem_str_lengths}
#    log many  ${elem_str_lengths}
#    Should Be True	 ${elem_str_lengths}>0


#TC Test open auction & verify auctOrganizer on auction prefiew cadr ${PROD_HOST_URL}
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності Значення в полі Організатор
#    [Tags]   тестування_картки_аукціону
#    Go to  ${PROD_HOST_URL}?status=active.tendering
#    Maximize Browser Window
#    Verify znaid. result >0 and convert znaideno results value into integer     #скалярна перемінна із інтовим рез. пошуку назив. ${converted_znaideno_value_to_int}
#    Verify page shouldn't contain error phrases  #https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1636014993002900
#    Scroll element into view  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#    Wait until element is visible  (//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
#
#    ${elem} =  Get text   //*[text()='Організатор: ']/..   #ікспас на превьюшці для Організатор: //*[text()='Організатор: ']/..
#    ${str_without_org}=  Remove String  ${elem}  Організатор:
#    log to console   ${str_without_org}
#    #//*[text()='Організатор: ']/..//following-sibling::text()[1]     #ікспас на превьюшці для Організатор. Значення [object Text]. It should be an element.
#    ${elem_str_lengths}=  Get Length  ${str_without_org}
#    log to console  ${elem_str_lengths}
#    log many  ${elem_str_lengths}
#    Should Be True	 ${elem_str_lengths}>0


##https://prozorro-box.slack.com/archives/C02JCEGJPAR/p1635409751006500
##статуси - прийом пропозицій, фільтруємо статус = прийняття заяв на участь, значення більше 0.
##Далі відкриває перші 10 аукціонів зі списку і нема помилок тоді це успіх. Ще не готово.
#
#
#TC Test search res. active.tendering>0,open auctions and verify auct.Titles
#    [Documentation]  Порівняння результатів пошуку по статусу Прийняття заяв на участь>0, перевірка валідності auctionTitles
#    [Tags]   тестування результатів пошуку
#    Go to  https://prozorro.sale/?status=active.tendering
#    Maximize Browser Window
#    Wait until element is visible  ${value from znaideno_v2}    timeout=20
#    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
#    ${without_wSpace_srch_results_aucID}=  Remove String   ${znaideno value from prod}     ${SPACE}
#    ${convert_act_tend_sts_to_int}  Convert To Integer  ${without_wSpace_srch_results_aucID}
#    #Search results convert to integer on prod  ${value from znaideno_v2}
#    SHOULD BE TRUE  ${convert_act_tend_sts_to_int} >0
#    Get elements count  //p[starts-with(text(),"UA-")]    #//strong[text()='ID: '] або //p[starts-with(text(),"UA-")]
#    #@{valid_auctionIDs_list}=    Create List
#    @{IDs_list} =  Get WebElements  //p[starts-with(text(),"UA-")]
#    FOR     ${element}  IN  @{IDs_list}
#        ${ID_text}=  Get Text   ${element}  #отримуємо ІД аукціону
#        ${valid__auc_ID}=  Get Substring  ${ID_text}  4  #відрізаємо ID:  від ІД аукціону
#        ${auction_links} =   Set Variable  ${PROD_HOST_URL}auction/${valid__auc_ID}  #сетапимо перемінну для валідних лінків #https://prozorro.sale/auction/UA-PS-2021-11-02-000032-1
#        #Log to console  ${auction_links}
#        Append To List    ${valid_auctionIDs_list}     ${auction_links}
#    END
#    #в окремому циклі перевіряємо тайтли в 10ти аукціонах
#    FOR  ${i}  IN  @{valid_auctionIDs_list}
#         Log to console  ${i}
#         Continue For Loop If  '${i}'=='Create List'
#        Go To  ${i}
#        ${title_txt}=   Get Title
#        Log to console   ${title_txt}
#
#    END
#
#







#*** test cases ***
#  mytest
#    ${color} =  set variable  Red
#    Run Keyword If  '${color}' == 'Red'  log to console  \nexecuted with single condition
#    Run Keyword If  '${color}' == 'Red' or '${color}' == 'Blue' or '${color}' == 'Pink'  log to console  \nexecuted with multiple or
#
#    ${color} =  set variable  Blue
#    ${Size} =  set variable  Small
#    ${Simple} =  set variable  Simple
#    ${Design} =  set variable  Simple
#    Run Keyword If  '${color}' == 'Blue' and '${Size}' == 'Small' and '${Design}' != '${Simple}'  log to console  \nexecuted with multiple and
#
#    ${Size} =  set variable  XL
#    ${Design} =  set variable  Complicated
#    Run Keyword Unless  '${color}' == 'Black' or '${Size}' == 'Small' or '${Design}' == 'Simple'  log to console  \nexecuted with unless and multiple or
