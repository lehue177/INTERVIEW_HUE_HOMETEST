*** Variables ***
&{mylist_page}      
...     product_sku=xpath=//div[@data-productid='$sku']
...     select_sort_by=xpath=//div[@role='listbox']
...     lbl_my_list_head=xpath=//h1[.='My List']
     
*** Keywords ***
My list should contain sku
    [Documentation]     My list should contain sku - input sku
    [Arguments]    ${sku}
    ${product_sku}                 Replace string    ${mylist_page.product_sku}    $sku    ${sku}
    Wait web element is visible     ${product_sku}

Check my list page is displayed
    [Documentation]    Check my list page
    Wait web element is visible       ${mylist_page.lbl_my_list_head}
    Wait web element is visible       ${mylist_page.select_sort_by}
