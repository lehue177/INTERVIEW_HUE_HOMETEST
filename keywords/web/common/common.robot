*** Variables ***
&{common}   
...     fullscreen_loading=xpath=//div[contains(@class,'FullScreenLoading')]

*** Keywords ***
Open chrome browser and redirect Tops Website
    ${chrome options}=      Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver  
    Call method    ${chrome_options}   add_argument    disable-gpu
    IF    '${headless}' == 'true'
        Call method    ${chrome_options}   add_argument    --headless
        Call method    ${chrome_options}   add_argument    --window-size\=1920,1080
        Log to console    ${\n}***** Open Tops websit in headless mode *****
    ELSE IF    '${headless}' == 'false'
        Log to console    ${\n}***** Open Tops websit in desktop mode *****
    END
    Call method    ${chrome_options}    add_argument    --no-sandbox
    Call method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Create webdriver    Chrome    chrome_options=${chrome options}
    Maximize browser window
    Goto    ${url_tops}

Wait web element is visible
    [Arguments]     ${location}       ${timeout}=${GLOBALTIMEOUT}
    Wait until element is visible         ${location}       ${timeout}

Wait web element is not visible
    [Arguments]     ${location}       ${timeout}=${GLOBALTIMEOUT}
    Wait until element is not visible         ${location}       ${timeout}

Input Text To Element When Ready
    [Arguments]     ${location}     ${text}  
    Wait web element is visible    ${location}
    Input Text      ${location}     ${text} 


Click Element When Ready
    [Arguments]     ${location}
    Wait web element is visible         ${location}
    Click Element       ${location}

Convert to 2 digits
    [Documentation]    Convert to 2 digits
    [Arguments]        ${number}
    ${to_number}       Convert to number    ${number}   2
    ${two_digits}      Evaluate    "%.2f" % ${to_number}
    [Return]           ${two_digits}

Mouse over mini cart
    [Documentation]    Mouse over mini cart
    Wait for loading disappear     
    Execute JavaScript      var event = new MouseEvent('mouseover',{view: window, bubbles: true, cancelable: true});            document.querySelectorAll('img[src="/assets/icons/baseline-shopping-cart-24-px.svg"]')[0].dispatchEvent(event)

Test tear down
    Run keyword if test failed       Capture Element Screenshot     xpath=//body
    Close all Browsers

Wait for loading disappear
    [Documentation]     global wait for loading disappear
    Run Keyword And Ignore Error    Wait web element is not visible     ${common.fullscreen_loading}  