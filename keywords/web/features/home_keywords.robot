*** Keywords ***
Go to login page
    [Documentation]    Go to login page
    home_page.Click Close Popup Reminder    
    home_page.Click login
    login_page.Check login page is displayed

Go to my list page
    [Documentation]    Go to my list
    home_page.Click tab my list   
    mylist_page.Check my list page is displayed