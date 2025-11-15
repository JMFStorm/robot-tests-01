*** Settings ***
Library    BuiltIn
Library    String
Library    Collections

*** Variables ***
${TEXT}          Hello, Robot Framework!
${EMPTY}         
@{NUMBERS}       ${10}    ${20}    ${30}

*** Test Cases ***
Check String Contains
    [Documentation]    Verify that a string contains a specific substring
    Should Contain    ${TEXT}    Robot
    Log    The text contains "Robot"

Check String Manipulation
    [Documentation]    Convert string to uppercase and verify
    ${upper}=    Convert To Uppercase    ${TEXT}
    Should Be Equal    ${upper}    HELLO, ROBOT FRAMEWORK!
    Log To Console   Converted text: ${upper}

Check List Length And Sum
    [Documentation]    Use Collections library to validate list
    ${length}=    Get Length    ${NUMBERS}
    Should Be Equal As Integers    ${length}    3
    ${sum}=    Evaluate    sum(${NUMBERS})
    Should Be Equal As Integers    ${sum}    60
    Log    Sum of numbers is ${sum}

Check Empty Variable
    [Documentation]    Verify that a variable is empty
    Should Be Empty    ${EMPTY}
    Log    Variable is empty as expected

Dynamic Variable Example
    [Documentation]    Create and use a variable dynamically
    ${dynamic}=    Set Variable    Dynamic Value
    Log To Console    The dynamic variable is: ${dynamic}

Failing Test Example
    [Documentation]    Demonstrate a failing test using BuiltIn
    Run Keyword And Expect Error    *Error*    Fail    *Error*
