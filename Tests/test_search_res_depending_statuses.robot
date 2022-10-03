
*** Settings ***
Library     SeleniumLibrary
Suite setup  Open Browser Chrome in headless_mode
Suite teardown  Close All Browsers

# prod based on aws: https://prod-front-aws.prozorro.sale/auction/search?offset=10&edrpou=21560045
# Сheck the number of auctions in the aws search  https://docs.google.com/spreadsheets/d/15-4TxLmd8s2OzbcI2VfF1E6lbkbm9bG-6TZY9IcJ_Xk/edit#gid=0

*** Variables ***
${doc_index}                                              0
${BROWSER_chrome}                                         Chrome
${BROWSER_headless}                                       headlesschrome
#${DEV_HOST_URL}                                          https://prod-front-aws.prozorro.sale/:AWS/

${AWS_HOST_URL}                                           https://prod-front-aws.prozorro.sale
${PROD_HOST_URL}                                          https://prozorro.sale

#LOCATORS
${about_us_lctr}                                          xpath=//*[@id="__next"]/header/nav/div/ul/li[1]/a
${storinka ne znaidena lctr}                              xpath=//*[@id="__next"]/div/h1
${value from znaideno}                                    xpath=//*[@id="__next"]/div[3]/div[1]/text()[2]
${value from znaideno_v2}                                 xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено")]
${storika ne znaidena_str}                                Сторінка не знайдена

${msg_link_is}                                            Лінк має наступний вигляд:
${msg_identical}                                          Сторінки ідентичні
${msg_not_identical}                                      Сторінки не ідентичні
${text_znaideno}                                          Знайдено:
${msg}                                                    УРЛ вікна браузера:

${lctr_select_status_value="active.tendering"}            xpath=//*[@id="status"]/option[2]
${lctr_select_status_active.enquiries}                    xpath=//*[@id="status"]/option[3]
${lctr_is_zamovnik}                                       xpath=//*[@id="companies-is_seller"]/option[1]
${lctr_is_uchasnick}                                      xpath=//*[@id="companies-is_seller"]/option[2]
${lctr_select_zamovORuchasnick}                           xpath=//*[@id="registration-form"]/div[1]/div[1]/label
${lctr_is_seller}                                         xpath=//*[@id="companies-is_seller"]
${lctr_search_btn_magnifier}                              xpath=//*[@id="__next"]/div[2]/div/div[1]/div/button
${lctr_status_name_in_auct_page}                          xpath=//aside[contains(@class,"meta-blockstyles__FixedBlock-v6fx5m-0 bNaTcU")]


${BROWSER_chrome}                                         Chrome
${BROWSER_headless}                                       headlesschrome


#перемінні із https://prod-front-aws.prozorro.sale/
${main_page_AWS}                                          https://prod-front-aws.prozorro.sale/:AWS/
#${about_page}                                            https://prod-front-aws.prozorro.sale/:AWS/about
#перемінні із https://prozorro.sale/
${main_page_prod}                                         https://prozorro.sale/


#Пошук по статусам в аукціонах

# dict / масив лінків аукціон + status=active.auction
&{lnk_auct_statuses_prod}  activeTendering_prod=${PROD_HOST_URL}/search?offset=10&status=active.tendering
...   activeAuction_prod=${PROD_HOST_URL}/search?offset=10&status=active.auction
...   activeEnquiry_prod=${PROD_HOST_URL}/auction/search?offset=10&status=active.enquiry
...   activeRectific_prod=${PROD_HOST_URL}/auction/search?offset=10&status=active.rectification
...   activeQualif_prod=${PROD_HOST_URL}/auction/search?offset=10&status=active.qualification
...   activeAwarded_prod=${PROD_HOST_URL}/auction/search?offset=10&status=active.awarded
...   pendPayment_prod=${PROD_HOST_URL}/auction/search?offset=10&status=pending.payment
...   pendAdmiss_prod=${PROD_HOST_URL}/auction/search?offset=10&status=pending.admission
...   complete_prod=${PROD_HOST_URL}/auction/search?offset=10&status=complete
...   cancelled_prod=${PROD_HOST_URL}/auction/search?offset=10&status=cancelled
...   unsuccessful_prod=${PROD_HOST_URL}/auction/search?offset=10&status=unsuccessful
#Пошук по статусах в інформаційних повідомлень на prod
...   ealotsActiveAuction_prod=${PROD_HOST_URL}/planning/search?offset=10&status_ealots=active.auction
...   ealotsActiveContracting_prod=${PROD_HOST_URL}/planning/search?offset=10&status_ealots=active.contracting
...   ealotsPendingSold_prod=${PROD_HOST_URL}/planning/search?offset=10&status_ealots=pending.sold
...   ealotsSold_prod=${PROD_HOST_URL}/planning/search?offset=10&status_ealots=sold
...   ealotsDeleted_prod=${PROD_HOST_URL}/planning/search?offset=10&status_ealots=sold
#реєстри+приватиз на проді
...   regis_privat_prod=${PROD_HOST_URL}/registries/search?source=privatization
...   regis_privat_pending_prod=${PROD_HOST_URL}/registries/search?source=privatization&offset=10&status=pending
...   regis_privat_active_prod=${PROD_HOST_URL}/registries/search?source=privatization&offset=10&status=active
...   regis_privat_complete_prod=${PROD_HOST_URL}/registries/search?source=privatization&offset=10&status=complete
...   regis_privat_deleted_prod=${PROD_HOST_URL}/registries/search?source=privatization&offset=10&status=deleted
#реєстри+lease на проді
...   regis_lease_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10
...   regis_lease_waiting_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10&status=waiting
...   regis_lease_appr_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10&status=approved
...   regis_lease_inact_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10&status=inactive
...   regis_lease_act_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10&status=active
...   regis_lease_qual_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10&status=qualification
...   regis_lease_sold_prod=${PROD_HOST_URL}/registries/search?source=lease&offset=10&status=sold
#Пошук по реєстрам ФГВФО
...   regis_dgf_prod=${PROD_HOST_URL}/registries/search?source=dgf


#дік на aws
&{lnk_auct_statuses_aws}  activeTendering_aws=${AWS_HOST_URL}/search?offset=10&status=active.tendering
...   activeAuction_aws=${AWS_HOST_URL}/search?offset=10&status=active.auction
...   activeEnquiry_aws=${AWS_HOST_URL}/auction/search?offset=10&status=active.enquiry
...   activeRectific_aws=${AWS_HOST_URL}/auction/search?offset=10&status=active.rectification
...   activeQualif_aws=${AWS_HOST_URL}/auction/search?offset=10&status=active.qualification
...   activeAwarded_aws=${AWS_HOST_URL}/auction/search?offset=10&status=active.awarded
...   pendPayment_aws=${AWS_HOST_URL}/auction/search?offset=10&status=pending.payment
...   pendAdmiss_aws=${AWS_HOST_URL}/auction/search?offset=10&status=pending.admission
...   complete_aws=${AWS_HOST_URL}/auction/search?offset=10&status=complete
...   cancelled_aws=${AWS_HOST_URL}/auction/search?offset=10&status=cancelled
...   unsuccessful_aws=${AWS_HOST_URL}/auction/search?offset=10&status=unsuccessful
#Пошук по статусах в інформаційних повідомленях на aws
...   ealotsActiveAuction_aws=${AWS_HOST_URL}/planning/search?offset=10&status_ealots=active.auction
...   ealotsActiveContracting_aws=${AWS_HOST_URL}/planning/search?offset=10&status_ealots=active.contracting
...   ealotsPendingSold_aws=${AWS_HOST_URL}/planning/search?offset=10&status_ealots=pending.sold
...   ealotsSold_aws=${AWS_HOST_URL}/planning/search?offset=10&status_ealots=sold
...   ealotsDeleted_aws=${AWS_HOST_URL}/planning/search?offset=10&status_ealots=sold
#реєстри на aws
...   regis_privat_aws=${AWS_HOST_URL}/registries/search?source=privatization
...   regis_privat_pending_aws=${AWS_HOST_URL}/registries/search?source=privatization&offset=10&status=pending
...   regis_privat_active_aws=${AWS_HOST_URL}/registries/search?source=privatization&offset=10&status=active
...   regis_privat_complete_aws=${AWS_HOST_URL}/registries/search?source=privatization&offset=10&status=complete
...   regis_privat_deleted_aws=${AWS_HOST_URL}/registries/search?source=privatization&offset=10&status=deleted
#реєстри+lease на aws
...   regis_lease_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10
...   regis_lease_waiting_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10&status=waiting
...   regis_lease_appr_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10&status=approved
...   regis_lease_inact_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10&status=inactive
...   regis_lease_act_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10&status=active
...   regis_lease_qual_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10&status=qualification
...   regis_lease_sold_aws=${AWS_HOST_URL}/registries/search?source=lease&offset=10&status=sold
#Пошук по реєстрам ФГВФО на aws
...   regis_dgf_aws=${AWS_HOST_URL}/registries/search?source=dgf

*** Keywords ***

Open Browser Chrome in headless_mode
    Open Browser  ${main_page_AWS}   ${BROWSER_headless}
    Maximize Browser Window

Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale
    [Arguments]   ${lnk_auctions_streams_AWS}  ${lnk_auctions_streams_prod}

    Go to   ${lnk_auctions_streams_AWS}
    Maximize Browser Window
    ${znaideno value from AWS}=  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from AWS}
    Go to  ${lnk_auctions_streams_prod}
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}  timeout=20
    ${znaideno value from prod} =  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from prod}
    Log Location
    should be equal as strings  ${znaideno value from AWS}   ${znaideno value from prod}


Compare auction statuses results on aws.prozorro.sale and prod
    [Arguments]   ${lnk_auct_statuses_aws}  ${lnk_auct_statuses_prod}

    Go to   ${lnk_auct_statuses_aws}
    Maximize Browser Window
    ${znaideno value from AWS}=  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from AWS}
    Go to  ${lnk_auct_statuses_prod}
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}  timeout=20
    ${znaideno value from prod} =  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from prod}
    Log Location
    should be equal as strings  ${znaideno value from AWS}   ${znaideno value from prod}


*** Test Cases ***

TC1 Compare search results (auction+status:active.tendering) on AWS & prod
    [Documentation]  Порівняння рез. пош. по аукціон+Прийняття заяв на участь на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.activeTendering_aws}   ${lnk_auct_statuses_prod.activeTendering_prod}

TC2 Compare search results (auction+status:active.auction) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Аукціон на aws&prod
    [Tags]  пошук_по_статусам__аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.activeAuction_aws}   ${lnk_auct_statuses_prod.activeAuction_prod}

TC3 Compare search results (auction+status:active.enquiry) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Період уточнень на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.activeEnquiry_aws}   ${lnk_auct_statuses_prod.activeEnquiry_prod}

TC4 Compare search results (auction+status:activeRectific) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Період редагування на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.activeRectific_aws}   ${lnk_auct_statuses_prod.activeRectific_prod}

TC5 Compare search results (auction+status:activeQualif) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Період публікування протоколу на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.activeQualif_aws}   ${lnk_auct_statuses_prod.activeQualif_prod}

TC6 Compare search results (auction+status:activeAwarded) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Очікування підписання договору на aws&prod
    [Tags]   пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.activeAwarded_aws}   ${lnk_auct_statuses_prod.activeAwarded_prod}

TC7 Compare search results (auction+status:pending.payment) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Очікування оплати на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.pendPayment_aws}   ${lnk_auct_statuses_prod.pendPayment_prod}

TC8 Compare search results (auction+status:pendAdmiss) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Очікування рішення про викуп на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.pendAdmiss_aws}   ${lnk_auct_statuses_prod.pendAdmiss_prod}

TC9 Compare search results (auction+status:complete) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Аукціон завершено і дог. підписано на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.complete_aws}   ${lnk_auct_statuses_prod.complete_prod}

TC10 Compare search results (auction+status:cancelled) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Скасовано на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.cancelled_aws}   ${lnk_auct_statuses_prod.cancelled_prod}

TC11 Compare search results (auction+status:unsuccessful) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по аукціон+Не відбувся на aws&prod
    [Tags]  пошук_по_статусам_аукціонів
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.unsuccessful_aws}   ${lnk_auct_statuses_prod.unsuccessful_prod}

TC12 Compare search results (ealots+status:activeAuctions) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по інформ.повід+Аукціон на aws&prod
    [Tags]  пошук_по_статусам_інфПовідомлення
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.ealotsActiveAuction_aws}   ${lnk_auct_statuses_prod.ealotsActiveAuction_prod}

TC13 Compare search results (ealots+status:active.contracting) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по інформ.повід+Аукціон завершено.Кваліфікація на aws&prod
    [Tags]  пошук_по_статусам_інфПовідомлення
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.ealotsActiveContracting_aws}   ${lnk_auct_statuses_prod.ealotsActiveContracting_prod}

TC14 Compare search results (ealots+status:pending.sold) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по інформ.повід+Аукціон завершено на aws&prod
    [Tags]  пошук_по_статусам_інфПовідомлення
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.ealotsPendingSold_aws}   ${lnk_auct_statuses_prod.ealotsPendingSold_prod}

TC15 Compare search results (ealots+status:sold) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по інформ.повід+Обєкт продано на aws&prod
    [Tags]  пошук_по_статусам_інфПовідомлення
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.ealotsSold_aws}   ${lnk_auct_statuses_prod.ealotsSold_prod}

TC16 Compare search results (ealots+status:deleted) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по інформ.повід+Аукціон відмінено на aws&prod
    [Tags]  пошук_по_статусам_інфПовідомлення
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.ealotsDeleted_aws}   ${lnk_auct_statuses_prod.ealotsDeleted_prod}

TC17 Compare search results (registries + no status) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Обєкти+без статусу аукціону на aws&prod
    [Tags]  пошук_по_статусам_реєстрівМПриватизація
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_privat_aws}   ${lnk_auct_statuses_prod.regis_privat_prod}

TC18 Compare search results (registries+privatiz + status:pending) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Обєкти+Опубліковано.Очікування інф. повідомлення на aws&prod
    [Tags]  пошук_по_статусам__реєстрівМПриватизація
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_privat_pending_aws}   ${lnk_auct_statuses_prod.regis_privat_pending_prod}

TC19 Compare search results (registries+privatiz + no status:active) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Обєкти+Інф. повідомлення опубліковано на aws&prod
    [Tags]  пошук_по_статусам_реєстрівМПриватизація
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_privat_active_aws}   ${lnk_auct_statuses_prod.regis_privat_active_prod}

TC20 Compare search results (registries+privatiz + no status:complete) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Обєкти+Аукціон завершено на aws&prod
    [Tags]  пошук_по_статусам__реєстрівМПриватизація
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_privat_complete_aws}   ${lnk_auct_statuses_prod.regis_privat_complete_prod}

TC21 Compare search results (registries+privatiz + no status:deleted) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Обєкти+Виключено з переліку на aws&prod
    [Tags]  пошук_по_статусам_реєстрівМПриватизація
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_privat_deleted_aws}   ${lnk_auct_statuses_prod.regis_privat_deleted_prod}

TC22 Compare search results (registries+lease + no status) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + без статусу на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_aws}   ${lnk_auct_statuses_prod.regis_lease_prod}

TC23 Compare search results (registries+lease + status:wating) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + Очікує включення в перелік на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_waiting_aws}   ${lnk_auct_statuses_prod.regis_lease_waiting_prod}

TC24 Compare search results (registries+lease + status:approwed) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + Включено в перелік на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_appr_aws}   ${lnk_auct_statuses_prod.regis_lease_appr_prod}

TC25 Compare search results (registries+lease + status:inactive) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + Неактивний на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_inact_aws}   ${lnk_auct_statuses_prod.regis_lease_inact_prod}

TC26 Compare search results (registries+lease + status:active) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + Опубліковано оголошення на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_act_aws}   ${lnk_auct_statuses_prod.regis_lease_act_prod}

TC27 Compare search results (registries+lease + status:qualification) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + Визначення орендаря на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_qual_aws}   ${lnk_auct_statuses_prod.regis_lease_qual_prod}

TC28 Compare search results (registries+lease + status:sold) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри+Оренда + Орендовано на aws&prod
    [Tags]  пошук_по_статусам_реєстрівОренди
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_lease_sold_aws}   ${lnk_auct_statuses_prod.regis_lease_sold_prod}

TC29 Compare search results (registries+dgf+ no status) on AWS & prod
    [Documentation]  Порівняння рез. пош.м по Реєстри ВФГВО без статусу аукціону на aws&prod
    [Tags]  пошук_по_статусам_ВФГВО
    Compare auction statuses results on aws.prozorro.sale and prod   ${lnk_auct_statuses_aws.regis_dgf_aws}   ${lnk_auct_statuses_prod.regis_dgf_prod}




    Close All Browsers