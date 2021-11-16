*** Settings ***
Library     SeleniumLibrary
Library  String
Library  DateTime
Library  Collections
#Suite Setup  Open Browser Chrome in headless_mode
Suite Setup  Open main_page_prod in UI Chome mode
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
${msg}                                              УРЛ вікна браузера:
${auc_ID_prod}                                          UA-PS-2021-09-24-000017-1


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
${lctr_znaideno_srch_result}                             xpath=//*[@data-test-id='search-result-count']
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
${btn_date-picker_prod}  xpath=//button[@data-test-id="auction_date_search_action"]
${input_date_picker_1}  xpath=(//*[contains(@class,"date-pickerstyles")])[2]
${input_date_picker_2}  xpath=(//*[contains(@class,"date-pickerstyles")])[3]

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

#масив із статусами аукціонів
&{auction_statuses}   active_rectification=Період редагування
...  active_tendering=Прийняття заяв на участь
...  active_auction=Аукціон
...  active.enquiry=Період уточнень
...  active_qualification=Очікується публікування протоколу
...  active_awarded=Очікується підписання договору
...  pending_payment=Очікується сплата до бюджету
...  complete=Аукціон завершено.Договір підписано
...  cancelled=Аукціон відмінено
...  unsuccessful=Аукціон не відбувся

#масив із currency
&{value_currency}   eurocent=ЄВРОЦЕНТ
...  UAH=ГРН
...  EUR=ЄВРО
...  USD=ДОЛАР

#локатори для тестування сторінки аукціону
${lnk_auction_preview_title}  xpath=(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
${lctr_auct_page_title}   xpath=//*[@id="main"]
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

Get search results and convert to integer
    #[Arguments]   ${value from znaideno_v2}
    Wait until element is visible  ${lctr_znaideno_srch_result}    timeout=10
    ${znaideno value from prod} =  Get text   ${lctr_znaideno_srch_result}
    ${without_wSpace_srch_results}=  Remove String   ${znaideno value from prod}     ${SPACE}
    ${converted_to_int_srch_value}  Convert To Integer  ${without_wSpace_srch_results}
    log to console  "Search results in integer are:" ${converted_to_int_srch_value}
    log many  ${converted_to_int_srch_value}
    [RETURN]  ${converted_to_int_srch_value}

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
    Wait until element is visible  ${lctr_znaideno_srch_result}    timeout=10
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

Get second str after separator ": " for verity elements length
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
    #${num}=         evaluate       '${list_string}[1]'.replace(',','')
    [RETURN]  ${list_string}[1]

Verity element str_length > 0 with value from get second string keyword
    [Arguments]   ${second_str}
    #${q}  Get text  ${elem_locator}
    #Should Be Equal As Strings
    log to console  ${second_str}
    log many  ${second_str}
    ${elem_str_lengths}=  Get Length  ${second_str}
    log to console  ${elem_str_lengths}
    log many  ${elem_str_lengths}
    Should Be True	 ${elem_str_lengths}>0

Log to console & log to report
    [Arguments]  ${arg}
    log to console  Інформація в консолі: ${arg}
    log many  Інформація для зручного аналізу в репорті: ${arg}

Get float value from value.Amount without GRN
    [Arguments]  ${elem_locator}
    ${txt_value_locator}=  Get text   ${elem_locator}
    ${txt_value_locator}=  Fetch From Right	 ${txt_value_locator}  початкова ціна реалізації лоту
    ${txt_value_locator}=  Fetch From Left	 ${txt_value_locator}  ГРН
    #${txt_value_locator}=       Evaluate    '${txt_value_locator}'.replace(' ','_')
    ${txt_value_locator}=  Remove String  ${txt_value_locator}  ${SPACE}
    ${converted_number_value_lctr}=  Convert To Number  ${txt_value_locator}
    [RETURN]  ${converted_number_value_lctr}

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

Get preview text title
   [Arguments]  ${lnk_auction_preview_title}
   Set Global Variable  ${get_preview_title}  ${EMPTY}
   ${get_preview_title}=  Get text   ${lnk_auction_preview_title}
   #${get_preview_title}=  Remove String  ${get_preview_title}  ${SPACE}
   [RETURN]  ${get_preview_title}

Get preview text title & remove spaces in active.tendering
   [Arguments]  ${host}  ${lnk_auction_preview_title}
   Go to  ${host}
   Maximize Browser Window
   Click button      ${btn_srch_auc_status}                      #//*[@data-test-id="status_search_action"]
   Element Should Be Visible    ${lctr_before_input_status}      #//*[text()="Статус"][1]/following-sibling::div
   Element Should Be Visible   ${lctr_active_tend_status}
   Click element      ${lctr_active_tend_status}
   Wait until element is visible    ${lnk_auction_preview_title}
   Scroll element into view   ${lnk_auction_preview_title}     #(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
   Set Global Variable  ${get_preview_title}  ${EMPTY}
   ${get_preview_title}=  Get text   ${lnk_auction_preview_title}
   ${get_preview_title}=  Remove String  ${get_preview_title}  ${SPACE}
   [RETURN]  ${get_preview_title}

*** Test Cases ***

#Відкрити 1шу в результатах пошуку, сторінку аукціону,

TC Get active.tendering status+click auction page on ${PROD_HOST_URL}
    [Documentation]  відфільтрувати Прийняття заяв на участь, вибрати рандомний аукціон
    [Tags]   тестування_інф-ї_на_стор-ці_аукціону

    Get active.tendering status in prod      ${PROD_HOST_URL}
    Verify znaid. result >0 and convert znaideno results value into integer  #${converted_znaideno_value_to_int}
    Verify page shouldn't contain error phrases
    Scroll element into view   ${lnk_auction_preview_title}     #(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Wait until element is visible    ${lnk_auction_preview_title}   #(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Click element  ${lnk_auction_preview_title}
    ${tmp}=  Get preview text title  ${lnk_auction_preview_title}
    Switch window  title:${tmp}


#Порівняти тайтли превью аукціону в результатах пошуку із тайтлом сторінки 1го аукціону,

TC Verify previewTitle & auctionTitle page on ${PROD_HOST_URL}
    [Documentation]  відфільтрувати Прийняття заяв на участь, вибрати рандомний аукціон, порівняти тайтли аукціону
    [Tags]   тестування_інф-ї_на_стор-ці_аукціону
    ${auction_page_title}=  Get text    //*[@id="main"]
    ${auction_page_title}=  Remove String  ${auction_page_title}  ${SPACE}
    ${s}=  Get preview text title & remove spaces in active.tendering  ${PROD_HOST_URL}   ${lnk_auction_preview_title}
    log many  ${auction_page_title.strip()}
    Should Be Equal As Strings   ${s}  ${auction_page_title}
    Should Be Equal  ${s}  ${auction_page_title}  ignore_case=True
    #Close Window
    #Close browser


#Відображається текст в заголовоку аукціону
TC Verify auctionTitle in auctionPage on ${PROD_HOST_URL}{auctionID}
    [Documentation]  перевірка відображення тайтлу аукціону
    [Tags]   тестування_інф-ї_на_стор-ці_аукціону
    Get active.tendering status in prod      ${PROD_HOST_URL}
    Verify znaid. result >0 and convert znaideno results value into integer  #${converted_znaideno_value_to_int}
    Verify page shouldn't contain error phrases
    Scroll element into view   ${lnk_auction_preview_title}     #(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Wait until element is visible    ${lnk_auction_preview_title}   #(//*[@target="_blank" and starts-with(@href,'/auction/')])[1]
    Click element  ${lnk_auction_preview_title}
    ${tmp}=  Get preview text title  ${lnk_auction_preview_title}
    Switch window  title:${tmp}
    ${title_curr_page}=  Get Title
    ${auct_title_length}=  Get Length  ${title_curr_page}
    Should Be True  ${auct_title_length}>0
