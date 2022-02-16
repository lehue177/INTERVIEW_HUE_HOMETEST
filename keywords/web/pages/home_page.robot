*** Variables ***
&{home_page}    
...     login=xpath=//div[contains(@class,'LoginSectio')]//button[.='Login']
...     search_bar=xpath=//div[contains(@class,"HeaderLogin")]//input[@placeholder="Search product name or brand"]
...     btn_search=xpath=//button[@type="submit" and contains(@class,"SearchBox")]
...     search_value=xpath=//input[contains(@class,"SearchBox") and @value="$type_value"]
...     btn_add_to_cart=xpath=//div[contains(@class,"main-content")]//button[@data-productid='$product_sku']
...     product_qty_cart=xpath=//div[contains(@class,'CartQty')]
...     loading_cart=xpath=(//div[contains(@class,"Spinner")]//div[contains(@class,"Spinner__SpinnerItem")])[1]
...     fullscreen_loading=xpath=//div[contains(@class,'FullScreenLoading')]//img
...     btn_wishlist=xpath=//div[@id='category-page']//div[@data-productid='$product_sku']//img[contains(@class,'WishlistIcon')]
...     btn_wishlist_enable=xpath=//div[@id='category-page']//div[@data-productid='$product_sku']//img[contains(@src,'icon-favorite')]
...     btn_mylist_bar=xpath=//div[@class='navigation-bar']//a[contains(@class,'navigation-link') and text()='My List']
...     txt_mylist_bar=xpath=//div[contains(@class,'active section') and text()='My List']
...     wishlist_sort_by=xpath=//div[@role='listbox']
...     close_reminder=xpath=//span[@class='ins-web-opt-in-reminder-close-button']
...     product=xpath=//div[@id='category-page']//div[@data-productid='$product_sku']

*** Keywords ***
Click Close Popup Reminder
    [Documentation]    Click close reminder on home page
    Click Element When Ready    ${home_page.close_reminder}
    
Click login
    [Documentation]    Click login on home page
    Click Element When Ready    ${home_page.login}

Check go to home page
    [Documentation]    Check home page has show
    Wait for loading disappear
    Wait web element is visible     ${home_page.search_bar}
    common.Wait for loading disappear

Go to product detail
    [Documentation]    Click to product detail
    [Arguments]        ${sku}
    ${product_sku}        Replace string    ${home_page.product}    $product_sku    ${sku}
    Click element when ready                ${product_sku}

Input search bar
    [Documentation]    Input search value to search text box
    [Arguments]     ${value}
    Clear Element Text                        ${home_page.search_bar}
    Input Text To Element When Ready          ${home_page.search_bar}    ${value}

Click search submit button
    [Documentation]    click search submit button
    Click Element When Ready                 ${home_page.btn_search}

Wait until loading cart disappear
    Wait web element is not visible     ${home_page.loading_cart}

Click add to cart button
    [Documentation]    click add to cart button by product name
    [Arguments]    ${sku}      
    ${btn_add_to_cart}                  Replace string    ${home_page.btn_add_to_cart}    $product_sku    ${sku}
    Set Test Variable                   ${btn_add_to_cart}       
    Click Element When Ready            ${btn_add_to_cart}
    Wait for loading disappear
    Wait web element is visible         ${home_page.loading_cart}
    Wait until loading cart disappear

Check search value
    [Documentation]    Check search value has submited
    [Arguments]    ${value}
    ${search_value}          Replace string    ${home_page.search_value}    $type_value    ${value}
    Wait web element is visible     ${search_value}
    
Get product qty from cart
    [Documentation]    Get product qty from cart icon
    Wait until loading cart disappear  
    ${current_value}                      Get text    ${home_page.product_qty_cart}
    [Return]    ${current_value}
    
Click favorite button by sku
    [Documentation]    Click favorite button please input sku
    [Arguments]    ${sku_product}
    ${btn_wishlist}     Replace string    ${home_page.btn_wishlist}    $product_sku    ${sku_product}
    common.Click Element When Ready      ${btn_wishlist}

Sku should be marked as favorite
    [Documentation]     Sku should be marked as favorite  please input sku
    [Arguments]    ${sku_product}
    ${btn_wishlist}       Replace string    ${home_page.btn_wishlist_enable}    $product_sku    ${sku_product}
    Wait web element is visible         ${btn_wishlist}

Click tab my list 
    [Documentation]     Go to tab in My list bar
    Scroll Element Into View              ${home_page.btn_mylist_bar}
    Click Element When Ready              ${home_page.btn_mylist_bar}
    Wait until loading cart disappear 