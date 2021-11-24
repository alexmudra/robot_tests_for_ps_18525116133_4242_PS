*** Settings ***
Library               RequestsLibrary
Library               SeleniumLibrary
Library               String
Library               DateTime
Library               Collections
Test Setup            Set Log Level    TRACE
Suite Setup    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com


*** Test Cases ***

Quick Get Request Test
    [Documentation]  швидки тест бібліотеки ріквестс
    [Tags]   отримати_респонс

    ${response}=    GET  https://prozorro.sale/

Quick Get Request With Parameters Test
    [Documentation]  швидки тест бібліотеки ріквестс із параметрами
    [Tags]   отримати_респонс

    ${response}=    GET  https://prozorro.sale/auction/search  params=query=ciao  expected_status=200

#Quick Get A JSON Body Test
#    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
#    Should Be Equal As Strings    1  ${response.json()}[id]

Quick Get A JSON Body Test From https://procedure.prozorro.sale{auctionID}
    [Documentation]  швидки тест бібліотеки респонс із боді json
    [Tags]   отримати_респонс
        ${response1}=    GET  https://procedure.prozorro.sale/api/procedures/61965b73f27a589134d2bfa4  #params=query=ciao  expected_status=200
    Should Be Equal As Strings  smarttender.biz  ${response1.json()}[owner]
    log many  "Овнер/майданчик лоту(приклад): "${response1.json()}[owner]
    log to console  "Овнер/майданчик лоту(приклад): "${response1.json()}[owner]

#parce json

Get Request Test
    Create Session    google  http://www.google.com

    ${resp_google}=   GET On Session  google  /  expected_status=200
    ${resp_json}=     GET On Session  jsonplaceholder  /posts/1

    Should Be Equal As Strings          ${resp_google.reason}  OK
    Dictionary Should Contain Value     ${resp_json.json()}  sunt aut facere repellat provident

Post Request Test
    &{data}=    Create dictionary  title=Robotframework requests  body=This is a test!  userId=1
    ${resp}=    POST On Session    jsonplaceholder  /posts  json=${data}  expected_status=anything

    Status Should Be                 201  ${resp}

    Close All Browsers
