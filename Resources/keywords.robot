*** Settings ***
Library     SeleniumLibrary
Library  String
Library  DateTime
Library  Collections
#Suite Setup  Open Browser Chrome in headless_mode
#Suite Setup  Open main_page_prod in UI Chome mode
#Suite Teardown  Close All Browsers


*** Variables ***

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

