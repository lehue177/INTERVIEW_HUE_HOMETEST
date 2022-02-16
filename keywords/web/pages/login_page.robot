*** Variables ***
&{login_page}   
...     txt_username=xpath=//div//input[@placeholder='Please insert your email']
...     txt_password=xpath=//div//input[@placeholder='Please insert password']
...     btn_eye_on=xpath=//div[@class='field field-password']//img
...     btn_login=xpath=//button[@type='submit' and .='Log in']

*** Keywords ***
Check login page is displayed
    [Documentation]    Check login page has show
    Wait web element is visible      ${login_page.btn_login}

Input username
    [Documentation]    Input username to username text box
    [Arguments]    ${username}
    Input Text To Element When Ready         ${login_page.txt_username}    ${username}

Input password
    [Documentation]    Input password to password text box
    [Arguments]    ${password}
    Input Text To Element When Ready         ${login_page.txt_password}    ${password}

Click see password button
    [Documentation]    Click to show password
    Click Element When Ready                ${login_page.btn_eye_on}

Click login button
    [Documentation]    Click login button
    Click Element When Ready                ${login_page.btn_login}