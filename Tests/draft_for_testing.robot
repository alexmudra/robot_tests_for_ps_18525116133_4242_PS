*** Settings ***
Library     SeleniumLibrary
Library  Selenium2Screenshots
Library  String
Library  DateTime
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

#Capture Page Screenshot
