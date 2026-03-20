*** Settings ***
Library           SeleniumLibrary
Resource          ../Keywords/Commonkeywords.robot

*** Keywords ***
user click start button
    Commonkeywords.wait until click    id=startStopButton
    Wait Until Keyword Succeeds    15s    0.1s    Check Progress Is 50
    Click Element    id=startStopButton

Check Progress Is 50
    ${current_value}=    Get Element Attribute    //div[@role='progressbar']    aria-valuenow
    Should Be True    ${current_value} >= 50

verify progress bar is at 50%
    Commonkeywords.wait until verify text    //div[@role='progressbar']    50%
