
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
${PROD_HOST_URL}                                          https://prozorro.sale/

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


# dict / масив лінків по напрямкам роботи на  AWS
&{lnk_auctions_streams_AWS}  otherAssets_AWS=${AWS_HOST_URL}?offset=10&stream=otherAssets
...   sellout_AWS=${AWS_HOST_URL}?stream=sellout&offset=10
...   legitimatePropertyLease_AWS=${AWS_HOST_URL}?stream=legitimatePropertyLease&offset=10
...   propertyLease_AWS=${AWS_HOST_URL}?stream=propertyLease&offset=10
...   dgf_AWS=${AWS_HOST_URL}?stream=dgf&offset=10
...   landRental_AWS=${AWS_HOST_URL}?stream=landRental&offset=10
...   landSell_AWS=${AWS_HOST_URL}?stream=landSell&offset=10
...   bankruptcy_AWS=${AWS_HOST_URL}?stream=bankruptcy&offset=10
...   timber_AWS=${AWS_HOST_URL}?stream=timber&offset=10
...   railwayCargo_AWS=${AWS_HOST_URL}?stream=railwayCargo
...   subsoil_AWS=${AWS_HOST_URL}/auction/search?offset=10&stream=subsoil
...   alienation_AWS=${AWS_HOST_URL}/auction/search?offset=10&stream=alienation
...   commercialPropertyLease=${AWS_HOST_URL}/auction/search?offset=10&stream=commercialPropertyLease
...   commercialSell=${AWS_HOST_URL}/auction/search?offset=10&stream=commercialSell
#Головний пошук аукціонів по типу процедур в статусі "Прийняття заяв на участь"
...   otherAssets_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=otherAssets
...   sellout_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=sellout
...   legimPropLease_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=legitimatePropertyLease
...   propLease_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=propertyLease
...   dgf_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=dgf
...   landRental_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=landRental
...   landSell_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=landSell
...   buncrapcy_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=bankruptcy
...   timber_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=timber
...   railwayCargo_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=railwayCargo
...   subsoil_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=subsoil
...   alienation_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=alienation
...   comPropLease_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=commercialPropertyLease
...   comSell_activeTendering=${AWS_HOST_URL}/auction/search?offset=10&status=active.tendering&stream=commercialSell
#Пошук інформаційних повідомлень
...   infPovid=${AWS_HOST_URL}/planning/search
#Пошук реєстрів приватизації
...   regisPrivat=${AWS_HOST_URL}/registries/search?source=privatization
#Пошук реєстрів майна
...   reestrLease=${AWS_HOST_URL}/registries/search?source=lease
#Пошук реєстрів ФГВФО
...   dgfReg=${AWS_HOST_URL}/registries/search?source=dgf




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
...   alienation_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=alienation
...   commerPropLease_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=commercialPropertyLease
...   commerSell_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=commercialSell
#Головний пошук аукціонів по типу процедур в статусі "Прийняття заяв на участь"
...   otherAssets_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=otherAssets
...   sellout_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=sellout
...   legimPropLease_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=legitimatePropertyLease
...   propLease_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=propertyLease
...   dgf_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=dgf
...   landRental_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=landRental
...   landSell_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=landSell
...   buncrapcy_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=bankruptcy
...   timber_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=timber
...   railwayCargo_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=railwayCargo
...   subsoil_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=subsoil
...   alienation_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=alienation
...   comPropLease_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=commercialPropertyLease
...   comSell_activeTendering_prod=${PROD_HOST_URL}auction/search?offset=10&status=active.tendering&stream=commercialSell
#Пошук інформаційних повідомлень
...   infPovid_prod=${PROD_HOST_URL}planning/search
#Пошук реєстрів приватизації
...   regisPrivat_prod=${PROD_HOST_URL}registries/search?source=privatization
#Пошук реєстрів майна
...   reestrLease_prod=${PROD_HOST_URL}registries/search?source=lease
#Пошук реєстрів ФГВФО
...   dgfReg_prod=${AWS_HOST_URL}/registries/search?source=dgf


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

*** Test Cases ***

TC1 Compare auction streams results on AWS & prod Продаж майна та активів
    [Documentation]  Порівняння результатів пошуку на aws&prod по напрямку Продаж майна та активів
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.otherAssets_AWS}    ${lnk_auctions_streams_prod.otherAssets_prod}

TC2 Compare auction streams results on AWS & prod Мала Приватизація
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Мала Приватизація
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.sellout_AWS}    ${lnk_auctions_streams_prod.sellout_prod}

TC3 Compare auction streams results on AWS & prod Оренда Держ. і Комун. Майна
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда Держ. і Комун. Майна
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.legitimatePropertyLease_AWS}    ${lnk_auctions_streams_prod.legitimatePropertyLease_prod}

TC4 Compare auction streams results on AWS & prod Оренда майна активів
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда майна активів
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.propertyLease_AWS}    ${lnk_auctions_streams_prod.propertyLease_prod}

TC5 Compare auction streams results on AWS & prod Оренда активів банків ВФГВО
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда активів банків ВФГВО
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.dgf_AWS}    ${lnk_auctions_streams_prod.dgf_prod}

TC6 Compare auction streams results on AWS & prod Оренда землі
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда землі
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.landRental_AWS}    ${lnk_auctions_streams_prod.landRental_prod}

TC7 Compare auction streams results on AWS & prod Продаж землі
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Продаж землі
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.landSell_AWS}    ${lnk_auctions_streams_prod.landSell_prod}

TC8 Compare auction streams results on AWS & prod Банкрутство
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Банкрутство
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.bankruptcy_AWS}    ${lnk_auctions_streams_prod.bankruptcy_prod}

TC9 Compare auction streams results on AWS & prod Оренда вагонів
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда вагонів
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.railwayCargo_AWS}    ${lnk_auctions_streams_prod.railwayCargo_prod}

TC10 Compare auction streams results on AWS & prod Необроблена деревина
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Необроблена деревина
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.timber_AWS}    ${lnk_auctions_streams_prod.timber_prod}

TC11 Compare auction streams results on AWS & prod Спец дозволи корист надрами
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Спец дозволи корист надрами
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.subsoil_AWS}    ${lnk_auctions_streams_prod.subsoil_prod}

TC12 Compare auction streams results on AWS & prod Відчуження майна
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Відчуження майна
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.alienation_AWS}    ${lnk_auctions_streams_prod.alienation_prod}

TC13 Compare auction streams results on AWS & prod Комерційна оренда
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Комерційна оренда
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.commercialPropertyLease}    ${lnk_auctions_streams_prod.commerPropLease_prod}

TC14 Compare auction streams results on AWS & prod Комерційна продаж
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Комерційна продаж
    [Tags]  пошук_по_streams
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.commercialSell}    ${lnk_auctions_streams_prod.commerSell_prod}

TC15 Compare auction streams results on AWS & prod Продаж майна та активів + Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по Продаж майна та активів + Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.otherAssets_activeTendering}    ${lnk_auctions_streams_prod.otherAssets_activeTendering_prod}

TC16 Compare auction streams results on AWS & prod Мала Приватизація + Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Мала Приватизація + Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.sellout_activeTendering}    ${lnk_auctions_streams_prod.sellout_activeTendering_prod}

TC17 Compare auction streams results on AWS & prod Оренда Держ. і Комун. Майна + Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда Держ. і Комун. Майна + Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.legimPropLease_activeTendering}    ${lnk_auctions_streams_prod.legimPropLease_activeTendering_prod}

TC18 Compare auction streams results on AWS & prod Оренда майна активів+ Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда майна активів+ Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.propLease_activeTendering}    ${lnk_auctions_streams_prod.propLease_activeTendering_prod}

TC19 Compare auction streams results on AWS & prod Оренда активів банків ВФГВО+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда активів банків ВФГВО+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.dgf_activeTendering}    ${lnk_auctions_streams_prod.dgf_activeTendering_prod}

TC20 Compare auction streams results on AWS & prod Оренда землі+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда землі+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.landRental_activeTendering}    ${lnk_auctions_streams_prod.landRental_activeTendering_prod}

TC21 Compare auction streams results on AWS & prod Продаж землі+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Продаж землі+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.landSell_activeTendering}    ${lnk_auctions_streams_prod.landSell_activeTendering_prod}

TC22 Compare auction streams results on AWS & prod Банкрутство+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Банкрутство+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.buncrapcy_activeTendering}    ${lnk_auctions_streams_prod.buncrapcy_activeTendering_prod}

TC23 Compare auction streams results on AWS & prod Необроб. деревина+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Необроб. деревина+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.timber_activeTendering}    ${lnk_auctions_streams_prod.timber_activeTendering_prod}

TC24 Compare auction streams results on AWS & prod Оренда вагонів+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Оренда вагонів+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.railwayCargo_activeTendering}    ${lnk_auctions_streams_prod.railwayCargo_activeTendering_prod}

TC25 Compare auction streams results on AWS & prod Спец дозволи корист надрами+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Спец дозволи корист надрами+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.subsoil_activeTendering}    ${lnk_auctions_streams_prod.subsoil_activeTendering_prod}

TC26 Compare auction streams results on AWS & prod Відчуження майна+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Відчуження майна+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.alienation_activeTendering}    ${lnk_auctions_streams_prod.alienation_activeTendering_prod}

TC27 Compare auction streams results on AWS & prod Комерційна оренда+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Комерційна оренда+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.comPropLease_activeTendering}    ${lnk_auctions_streams_prod.comPropLease_activeTendering_prod}

TC28 Compare auction streams results on AWS & prod Комерційна продаж+Прийняття заяв на участь
    [Documentation]  Порівняння результатів пошуку на dev&prod по напрямку Комерційна продаж+Прийняття заяв на участь
    [Tags]  пошук_по_streams_прийнЗаявНаУчасть
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.comSell_activeTendering}    ${lnk_auctions_streams_prod.comSell_activeTendering_prod}

TC29 Compare auction streams results on AWS & prod Інформац. повідомлення
    [Documentation]  Порівняння результатів пошуку на dev&prod по Інформ. Повідомлення
    [Tags]  пошук_по_planning
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.infPovid}    ${lnk_auctions_streams_prod.infPovid_prod}

TC30 Compare auction streams results on AWS & prod Інформац. повідомлення
    [Documentation]  Порівняння результатів пошуку на dev&prod по Інформ. Повідомлення
    [Tags]  пошук_по_planning
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.infPovid}    ${lnk_auctions_streams_prod.infPovid_prod}

TC31 Compare auction streams results on AWS & prod Реєстри і Інформ. повідомлення
    [Documentation]  Порівняння результатів пошуку на dev&prod по Реєстри і Інформ. Повідомлення
    [Tags]  пошук_по_registrie_privatization
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.regisPrivat}    ${lnk_auctions_streams_prod.regisPrivat_prod}

TC32 Compare auction streams results on AWS & prod Реєстри і Перелік майна
    [Documentation]  Порівняння результатів пошуку на dev&prod по Реєстри і Перелік майна
    [Tags]  пошук_по_registries_lease
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.reestrLease}    ${lnk_auctions_streams_prod.reestrLease_prod}

TC33 Compare auction streams results on AWS & prod Реєстри і ВФГВО
    [Documentation]  Порівняння результатів пошуку на dev&prod по Реєстри і ВФГВО
    [Tags]  пошук_по_registries_dgf
    Compare auction streams results on https://prod-front-aws.prozorro.sale and https://prozorro.sale    ${lnk_auctions_streams_AWS.dgfReg}    ${lnk_auctions_streams_prod.dgfReg_prod}


    Close All Browsers