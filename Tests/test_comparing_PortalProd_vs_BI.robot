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
    #взяти результат із ВI
    ${r_bi_ssp_res}  Get text  //*[starts-with(text(),"Кількість об'єктів продажу")]
    ${r_bi_ssp_res}=  Fetch From Right	 ${r_bi_ssp_res}  Кількість об'єктів продажу =
    ${r_bi_ssp_res}=  Remove String  ${r_bi_ssp_res}  ${SPACE}
    log to console & log to report   ${r_bi_ssp_res}
    ${converted_to_number_bi_ssp_value} =  Convert To Integer  ${r_bi_ssp_res}
    log to console   Кількість обєктів приватизації в ВІ = ${converted_to_number_bi_ssp_value}
    log to console  Кількість обєктів приватизації на проді порталу = ${prod_srch_privatiz_rslt}
    Should Be True  ${prod_srch_privatiz_rslt} == ${converted_to_number_bi_ssp_value}
