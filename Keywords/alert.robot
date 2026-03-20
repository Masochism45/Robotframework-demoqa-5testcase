*** Settings ***
Library           SeleniumLibrary
Resource          ../Keywords/Commonkeywords.robot

*** Keywords ***
User click button beside "On button click, confirm box will appear" 
    Commonkeywords.wait until click    //button[@id='confirmButton']
    Handle Alert   action=dismiss

Check alert text after click "On button click, confirm box will appear" ${expected_text}
    Commonkeywords.wait until verify text    //span[@id='confirmResult']    ${expected_text}