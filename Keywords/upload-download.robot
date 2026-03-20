*** Settings ***
Library           SeleniumLibrary
Resource          ../Keywords/Commonkeywords.robot
Library           OperatingSystem

*** Keywords ***
user click download button
    Execute JavaScript    document.getElementById('downloadButton').click()


verify file is downloaded successfully
    [Arguments]    ${DOWNLOAD_PATH}
    Wait Until Keyword Succeeds    10s    1s    OperatingSystem.File Should Exist    ${DOWNLOAD_PATH}${/}sampleFile.jpeg
