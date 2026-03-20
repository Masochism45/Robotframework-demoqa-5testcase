*** Settings ***
Library           SeleniumLibrary
Resource          ../Keywords/Commonkeywords.robot

*** Keywords ***
User edit web table data
    [Arguments]    ${first_name}
    Commonkeywords.wait until click   //div[@class='action-buttons']/span[@id='edit-record-1']
    Commonkeywords.wait until clear element text    id=firstName
    Commonkeywords.wait until input text    id=firstName    ${first_name}
    Commonkeywords.wait until click    id=submit

Page should contain edited ${first_name}
    Commonkeywords.wait until verify text    //tr[descendant::td[text()='${first_name}']]    ${first_name}
