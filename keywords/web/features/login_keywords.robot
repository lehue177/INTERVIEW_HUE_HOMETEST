*** Keywords ***
Login tops website successfully
    [Documentation]    Login with username and password success
    [Arguments]    ${username}   ${password}
    login_page.Input username    ${username}
    login_page.Click see password button
    login_page.Input password    ${password}
    login_page.Click login button
    home_page.Check go to home page
