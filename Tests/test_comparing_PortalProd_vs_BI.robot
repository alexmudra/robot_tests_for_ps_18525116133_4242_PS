*** Settings ***
Library     SeleniumLibrary
Library  String
Library  DateTime
Library  Collections
#Suite Setup  Open Browser Chrome in headless_mode
Suite Setup  Open main_page_prod in UI Chome mode
Suite Teardown  Close All Browsers
#Suite Teardown  Run Keyword If All Tests Passed  Всі тести ПАСС! Портал працює так як треба.
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot


*** Test Cases ***

Compare ${PROD_HOST_URL}search and https://bi.prozorro.sale/#/auctions srch results
    [Documentation]  порівняння результатів пошуку по Аукціони із Аукціони на ресурсі BI
    [Tags]   тестування_синхронізації

#    https://prozorro.sale/auction/search
#    https://bi.prozorro.sale/#/auctions

    Go to  ${PROD_HOST_URL}auction/search
    Maximize Browser Window
    ${prod_srch_auctions_rslt} =   Get search results and convert to integer
    log to console & log to report  ${prod_srch_auctions_rslt}
    Click element  ${analitika_tab}
    Title Should Be   ProZorro Продажі
    Go to  https://bi.prozorro.sale/#/auctions
    Title Should Be   ProZorro Продажі
    Wait Until Element Is Visible   //*[starts-with(text(),"Кількість = ")]  timeout=30
    ${r_bi_auctions_res}=  Get text  xpath= //*[starts-with(text(),"Кількість = ")]
    ${r_bi_auctions_res}=  Fetch From Right  ${r_bi_auctions_res}  Кількість =
    ${r_bi_auctions_res}=  Remove String  ${r_bi_auctions_res}  ${SPACE}
    ${bi_auctions_int_value_without_spaces}=  Convert To Integer  ${r_bi_auctions_res}
    Should Be True  ${prod_srch_auctions_rslt} == ${bi_auctions_int_value_without_spaces}


Compare https://prozorro.sale/registries/search?source=privatization and https://bi.prozorro.sale/#/assetsSSP srch results
    [Documentation]  порівняння результатів пошуку по Реєстри->Об'єкти прива-ії із Bi->assetsSSP
    [Tags]   тестування_синхронізації

    Go to  https://prozorro.sale/registries/search?source=privatization
    Maximize Browser Window
    Get search results and convert to integer
    ${prod_srch_privatiz_rslt} =   Get search results and convert to integer
    Click element  ${analitika_tab}
    Title Should Be   ProZorro Продажі
    Go to  https://bi.prozorro.sale/#/assetsSSP
    Wait Until Page Contains  Об'єкти продажу малої приватизації  timeout=10  error=Сторінка із результатами не завантажилась протягом 10 секунд
    Wait Until Page Contains Element  ${txt_kilkist_ob_prodaghy}  #//*[starts-with(text(),"Кількість об'єктів продажу")]  timeout=10  error=Сторінка із результатами не завантажилась протягом 10 секунд
    ${tmp}=  Get BI SSP results in str format  ${txt_kilkist_ob_prodaghy}
    ${converted_to_number_bi_ssp_value} =  Convert To Integer  ${tmp}
    Should Be True  ${prod_srch_privatiz_rslt} == ${converted_to_number_bi_ssp_value}


Compare ${PROD_HOST_URL}/source=dgf and https://bi.prozorro.sale/#/assets srch results
    [Documentation]  порівняння результатів пошуку по Реєстри->Реєстри ВФГВОіз Bi->assets
    [Tags]   тестування_синхронізації

    Go to  ${PROD_HOST_URL}registries/search?source=dgf
    Maximize Browser Window
    Get search results and convert to integer
    ${prod_srch_dgf_rslt} =   Get search results and convert to integer
    log to console & log to report  ${prod_srch_dgf_rslt}
    Click element  ${analitika_tab}
    Title Should Be   ProZorro Продажі
    Go to  https://bi.prozorro.sale/#/assets
    Wait Until Element Is Visible  //*[starts-with(text(),"Кількість активiв = ")]  timeout=10
    #get assets value and convert to int
    ${r_bi_assets_res}=  Get text  xpath=//*[starts-with(text(),"Кількість активiв = ")]
    @{list_string}=  Split String  ${r_bi_assets_res}
    log to console & log to report  ${list_string}[3] ${list_string}[4]
    ${assets_str_value_without_spaces}=  evaluate   '${list_string}[3] ${list_string}[4]'.replace(';','')
    ${assets_str_value_without_spaces}=  evaluate   '${assets_str_value_without_spaces}'.replace(' ','')
    ${assets_int_value_without_spaces}=  Convert To Integer  ${assets_str_value_without_spaces}
    #compare dgf results with assets BI results
    Should Be True  ${prod_srch_dgf_rslt} == ${assets_int_value_without_spaces}


Compare ${PROD_HOST_URL}registries/search?source=lease and https://bi.prozorro.sale/#/leaseRegistry srch results
    [Documentation]  порівняння результатів пошуку по Реєстри->Перелік майна/Оренда із Bi->leaseRegistry
    [Tags]   тестування_синхронізації

#https://prozorro.sale/registries/search?source=lease
#tps://bi.prozorro.sale/#/leaseRegistry
    Go to  ${PROD_HOST_URL}registries/search?source=lease
    Maximize Browser Window
    Get search results and convert to integer
    ${prod_srch_lease_rslt} =   Get search results and convert to integer
    log to console & log to report  ${prod_srch_lease_rslt}
    Click element  ${analitika_tab}
    Title Should Be   ProZorro Продажі
    Go to  https://bi.prozorro.sale/#/leaseRegistry
    Wait Until Element Is Visible  //*[starts-with(text(),"Кількість об'єктів РО = ")]  timeout=10
    ${r_bi_leaseReg_res}=  Get text  xpath=//*[starts-with(text(),"Кількість об'єктів РО = ")]
    @{list_string}=  Split String  ${r_bi_leaseReg_res}
    log to console & log to report  ${list_string}[4]
    ${leaseReg_str_value}=  evaluate   '${list_string}[4]'.replace(';','')
    ${leaseReg_int_value_without_spaces}=  Convert To Integer  ${leaseReg_str_value}
    Should Be True  ${prod_srch_lease_rslt} == ${leaseReg_int_value_without_spaces}

