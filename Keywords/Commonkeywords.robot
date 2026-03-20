*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
wait until click
    [Arguments]    ${locator}    
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

wait until input text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

wait until verify text
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Element Should Contain    ${locator}    ${expected_text}

wait until clear element text
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Clear Element Text    ${locator}

wait until element should be visible
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Element Should Be Visible    ${locator}