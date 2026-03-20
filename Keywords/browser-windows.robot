*** Settings ***
Library           SeleniumLibrary
Resource          ../Keywords/Commonkeywords.robot

*** Keywords ***
User open new tab
    [Arguments]    ${h1_text}
    Commonkeywords.wait until click    id=tabButton
    Switch Window    NEW    
    Commonkeywords.wait until element should be visible    //h1[text()='${h1_text}']
    Commonkeywords.wait until verify text    //h1[text()='${h1_text}']     ${h1_text}   
    
