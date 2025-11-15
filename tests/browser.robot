*** Settings ***
Library    Browser

Suite Setup     Open Browser To Homepage
Suite Teardown  Close Browser

*** Variables ***
${URL}          https://example.com

*** Keywords ***
Open Browser To Homepage
    New Browser    chromium    headless=true
    New Context    recordVideo={'dir':'', 'size':{'width':400, 'height':200}}
    New Page       ${URL}

*** Test Cases ***
Page Should Have Correct Title
    ${title}=    Get Title
    Should Be Equal    ${title}    Example Domain

Verify Heading On Page
    Wait For Elements State    h1    visible
    ${heading}=    Get Text    h1
    Should Be Equal    ${heading}    Example Domain

Follow The More Information Link
    Click    text=Learn more
    Wait For Elements State    body    visible
    ${url}=    Get Url
    Should Contain    ${url}    iana.org
