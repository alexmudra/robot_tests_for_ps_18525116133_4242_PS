
*** Settings ***
Library     SeleniumLibrary
Suite setup  Open Browser Chrome in headless_mode
Suite teardown  Close All Browsers


*** Variables ***
${doc_index}                                             0
${BROWSER_chrome}                                        Chrome
${BROWSER_headless}                                      headlesschrome
${DEV_HOST_URL}                                     http://185.25.116.133:4242/
${PROD_HOST_URL}                                    https://prozorro.sale/

#LOCATORS
${about_us_lctr}                                     xpath=//*[@id="__next"]/header/nav/div/ul/li[1]/a
${storinka ne znaidena lctr}                         xpath=//*[@id="__next"]/div/h1
${value from znaideno}                               xpath=//*[@id="__next"]/div[3]/div[1]/text()[2]
${value from znaideno_v2}                            xpath=//div[contains(@class,"cards-liststyles") and contains(text(),"Знайдено")]
${storika ne znaidena_str}                           Сторінка не знайдена

${msg_link_is}                                           Лінк має наступний вигляд:
${msg_identical}                                         Сторінки ідентичні
${msg_not_identical}                                     Сторінки не ідентичні
${text_znaideno}                                         Знайдено:
${msg}                                                   УРЛ вікна браузера:

${lctr_select_status_value="active.tendering"}            xpath=//*[@id="status"]/option[2]
${lctr_select_status_active.enquiries}                    xpath=//*[@id="status"]/option[3]
${lctr_is_zamovnik}                                       xpath=//*[@id="companies-is_seller"]/option[1]
${lctr_is_uchasnick}                                      xpath=//*[@id="companies-is_seller"]/option[2]
${lctr_select_zamovORuchasnick}                           xpath=//*[@id="registration-form"]/div[1]/div[1]/label
${lctr_is_seller}                                         xpath=//*[@id="companies-is_seller"]
${lctr_search_btn_magnifier}                           xpath=//*[@id="__next"]/div[2]/div/div[1]/div/button
${lctr_status_name_in_auct_page}  xpath=//aside[contains(@class,"meta-blockstyles__FixedBlock-v6fx5m-0 bNaTcU")]


${BROWSER_chrome}                                       Chrome
${BROWSER_headless}                                     headlesschrome


#перемінні із http://185.25.116.133:4242/
${main_page_4242}                                        http://185.25.116.133:4242/
#${about_page}                                           http://185.25.116.133:4242/about


#перемінні із https://prozorro.sale/
${main_page_prod}                                        https://prozorro.sale/


# dict / масив лінків по напрямкам роботи на  http://185.25.116.133:4242
&{lnk_auctions_streams_4242}  otherAssets_4242=${DEV_HOST_URL}?offset=10&stream=otherAssets
...   sellout_4242=${DEV_HOST_URL}?stream=sellout&offset=10
...   legitimatePropertyLease_4242=${DEV_HOST_URL}?stream=legitimatePropertyLease&offset=10
...   propertyLease_4242=${DEV_HOST_URL}?stream=propertyLease&offset=10
...   dgf_4242=${DEV_HOST_URL}?stream=dgf&offset=10
...   landRental_4242=${DEV_HOST_URL}?stream=landRental&offset=10
...   landSell_4242=${DEV_HOST_URL}?stream=landSell&offset=10
...   bankruptcy_4242=${DEV_HOST_URL}?stream=bankruptcy&offset=10
...   timber_4242=${DEV_HOST_URL}?stream=timber&offset=10
...   railwayCargo_4242=${DEV_HOST_URL}?stream=railwayCargo
...   subsoil_4242=${DEV_HOST_URL}auction/search?offset=10&stream=subsoil


# dict / масив лінків по напрямкам роботи на https://prozorro.sale
&{lnk_auctions_streams_prod}  otherAssets_prod=${PROD_HOST_URL}?offset=10&stream=otherAssets
...   sellout_prod=${PROD_HOST_URL}?offset=10&stream=sellout
...   legitimatePropertyLease_prod=${PROD_HOST_URL}?offset=10&stream=legitimatePropertyLease
...   propertyLease_prod=${PROD_HOST_URL}?offset=10&stream=propertyLease
...   dgf_prod=${PROD_HOST_URL}?offset=10&stream=dgf
...   landRental_prod=${PROD_HOST_URL}?offset=10&stream=landRental
...   landSell_prod=${PROD_HOST_URL}?offset=10&stream=landSell
...   bankruptcy_prod=${PROD_HOST_URL}?offset=10&stream=bankruptcy
...   timber_prod=${PROD_HOST_URL}?offset=10&stream=timber
...   railwayCargo_prod=${PROD_HOST_URL}?offset=10&stream=railwayCargo
...   subsoil_prod=${PROD_HOST_URL}auction/search?offset=10&stream=subsoil


*** Keywords ***

Open Browser Chrome in headless_mode
    Open Browser  ${main_page_4242}   ${BROWSER_headless}
    Maximize Browser Window

Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale
    [Arguments]   ${lnk_auctions_streams_4242}  ${lnk_auctions_streams_prod}

    Go to   ${lnk_auctions_streams_4242}
    Maximize Browser Window
    ${znaideno value from 4242}=  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from 4242}
    Go to  ${lnk_auctions_streams_prod}
    Maximize Browser Window
    Wait until element is visible  ${value from znaideno_v2}  timeout=20
    ${znaideno value from prod} =  Get text  ${value from znaideno_v2}
    log many  ${znaideno value from prod}
    Log Location
    should be equal as strings  ${znaideno value from 4242}   ${znaideno value from prod}

*** Test Cases ***

TC1 Compare auction streams results on dev/4242 & prod Продаж майна та активів
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Продаж майна та активів
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.otherAssets_4242}    ${lnk_auctions_streams_prod.otherAssets_prod}

TC2 Compare auction streams results on dev/4242 & prod Мала Приватизація
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Мала Приватизація
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.sellout_4242}    ${lnk_auctions_streams_prod.sellout_prod}

TC3 Compare auction streams results on dev/4242 & prod Оренда Держ. і Комун. Майна
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда Держ. і Комун. Майна
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.legitimatePropertyLease_4242}    ${lnk_auctions_streams_prod.legitimatePropertyLease_prod}

TC4 Compare auction streams results on dev/4242 & prod Оренда майна активів
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда майна активів
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.propertyLease_4242}    ${lnk_auctions_streams_prod.propertyLease_prod}


TC5 Compare auction streams results on dev/4242 & prod Оренда активів банків ВФГВО
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда активів банків ВФГВО
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.dgf_4242}    ${lnk_auctions_streams_prod.dgf_prod}

TC6 Compare auction streams results on dev/4242 & prod Оренда землі
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда землі
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.landRental_4242}    ${lnk_auctions_streams_prod.landRental_prod}

TC7 Compare auction streams results on dev/4242 & prod Продаж землі
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Продаж землі
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.landSell_4242}    ${lnk_auctions_streams_prod.landSell_prod}

TC8 Compare auction streams results on dev/4242 & prod Банкрутство
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Банкрутство
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.bankruptcy_4242}    ${lnk_auctions_streams_prod.bankruptcy_prod}

TC9 Compare auction streams results on dev/4242 & prod Оренда вагонів
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда вагонів
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.railwayCargo_4242}    ${lnk_auctions_streams_prod.railwayCargo_prod}

TC10 Compare auction streams results on dev/4242 & prod Оренда землі
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда землі
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.timber_4242}    ${lnk_auctions_streams_prod.timber_prod}

TC11 Compare auction streams results on dev/4242 & prod Спец дозволи корист надрами
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Спец дозволи корист надрами
    [Tags]  пошук по напрямкам/streams
    Compare auction streams results on http://185.25.116.133:4242 and https://prozorro.sale    ${lnk_auctions_streams_4242.subsoil_4242}    ${lnk_auctions_streams_prod.subsoil_prod }



    Close All Browsers