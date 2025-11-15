*** Settings ***
Library    String

*** Variables ***
${TEXT}    Hello, Robot Framework!
${EMPTY}   

*** Test Cases ***
Check String Contains
    [Documentation]    Verify that a string contains a specific substring
    Should Contain    ${TEXT}    Framework

Check String Length
    [Documentation]    Verify the length of a string
    ${length}=    Get Length    ${TEXT}
    Should Be Equal As Integers    ${length}    23

Convert String To Upper
    [Documentation]    Convert string to uppercase and verify
    ${upper}=    Convert To Uppercase    ${TEXT}
    Log    This is a console message
    Log    Uppercase string is now: ${upper}!
    Should Be Equal    ${upper}    HELLO, ROBOT FRAMEWORK!

Replace Substring
    [Documentation]    Replace a substring in the string
    ${new_text}=    Replace String    ${TEXT}    Robot    Janne
    Should Be Equal    ${new_text}    Hello, Janne Framework!

Check If String Is Empty
    [Documentation]    Verify empty string
    Should Be Empty    ${EMPTY}
