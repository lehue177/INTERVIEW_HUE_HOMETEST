*** Keywords ***
Verify product information on mini cart
    [Documentation]    Verify product information on mini cart
    [Arguments]     ${product_info}
    ${sku}      Set Variable    ${product_info.sku}
    ${actual_product_name}     mini_cart_page.Get product name on mini cart by sku       ${sku}
    ${actual_qty}              mini_cart_page.Get product qty can edit on mini cart by sku        ${sku}
    ${actual_price}            mini_cart_page.Get price on mini cart by sku              ${sku}
    mini_cart_page.Display button remove product can edit on mini cart by sku              ${sku}
    mini_cart_page.Display picture product should be        ${sku}
    &{actual_product_info}     Create Dictionary    sku=${sku}    name=${actual_product_name}    price=${actual_price}    qty=${actual_qty}
    Dictionaries Should Be Equal    ${actual_product_info}      ${product_info}

Check and remove all product
    [Documentation]    Check and remove all product in cart
    home_page.Check go to home page
    home_page.Wait until loading cart disappear
    ${current_value}    home_page.Get product qty from cart
    Run keyword if      '${current_value}' != '0'    mini_cart_page.Remove item in cart




