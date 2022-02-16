*** Keywords ***
Search product by value
    [Documentation]    Input search value
    [Arguments]     ${value}
    home_page.Input search bar        ${value}
    home_page.Check search value    ${value}