*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser_chrome}  browser=Chrome
${browser_firefox}  browser=Firefox
${defolt_broser}    ff
${url_g}  https://www.google.com/
${url_bruht}  http://185.25.116.133:4242/?query=%22%D0%B1%D1%80%D1%83%D1%85%D1%82%22&offset=10
${search_btn}  xpath=//*[@id="__next"]/div[2]/div/div[1]/div[2]/button
${znaideno btn}  xpath=////*[@id="__next"]/div[3]/div[1]/text()[1]
${index_>=1}
${index_==0}
${msg}  URL має значення:



*** Keywords ***
Open my browser chrome
    open browser    ${browser_chrome}
    log to console  ${links_for_search_form}
    Maximize Browser Window

Open browser firefox
    open browser    ${browser_firefox}
    Maximize Browser Window

Get url values



Close Browsers
    close all browsers











