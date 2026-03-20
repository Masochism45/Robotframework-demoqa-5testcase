*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Keywords/Commonkeywords.robot
Resource          ../Keywords/webtableskeywords.robot
Resource          ../Keywords/browser-windows.robot
Resource          ../Keywords/alert.robot
Resource          ../Keywords/progress-bar.robot
Resource          ../Keywords/upload-download.robot
Variables         ../resource/testdata.yaml
Variables         ../resource/config.yaml
Suite Setup    Open Browser And Config Downloads
test Setup     Go To    ${baseUrl}
Suite Teardown     Close Browser


*** Keywords ***
Open Browser And Config Downloads
    # 1. สร้าง Chrome Options ด้วย Python Direct Evaluate
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # 2. ตั้งค่า Preferences (ปิดหน้าต่างถาม และระบุ Path)
    # หมายเหตุ: ต้องมั่นใจว่า ${DOWNLOAD_DIR} เป็น Full Path (เช่น C:\project\downloads)
    ${prefs}=    Create Dictionary    
    ...    download.default_directory=${DOWNLOAD_DIR}
    ...    download.prompt_for_download=${FALSE}
    ...    download.directory_upgrade=${TRUE}
    ...    profile.default_content_settings.popups=${0}
    ...    profile.default_content_setting_values.automatic_downloads=${1}
    
    # 3. ยัด prefs เข้าไปใน options
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    
    # 4. เพิ่ม Arguments พื้นฐาน
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --disable-extensions

    # 5. เปิด Browser โดยส่งก้อน options เข้าไป
    Open Browser    ${baseUrl}    browser=chrome    options=${chrome_options}

*** Test Cases ***
Scenario 01: Web Tables (Data Manipulation)
    Go To    ${baseUrl}/webtables
    When User edit web table data    ${firstname1}
    Then Page should contain edited ${firstname1}

Scenario 02: Browser Windows (Window Management)
    Go To    ${baseUrl}/browser-windows
    When User open new tab    ${Newtab}

Scenario 03: Alerts & Confirmations 
    Go To    ${baseUrl}/alerts
    When User click button beside "On button click, confirm box will appear" 
    Then Check alert text after click "On button click, confirm box will appear" ${alert_expected_text}

Scenario 04: Progress Bar (don't use sleep)
    Go To    ${baseUrl}/progress-bar
    When user click start button
    Then verify progress bar is at 50%

Scenario 05: Upload and Download 
    Go To    ${baseUrl}/upload-download
    When user click download button
    Then verify file is downloaded successfully    ${DOWNLOAD_DIR}