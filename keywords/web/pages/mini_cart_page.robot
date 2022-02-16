*** Variables ***
&{mini_cart_page}   
...     lbl_header=xpath=//div[contains(@class,'MiniCartHeader')]//span[.='Shopping Cart']
...     pic_product=xpath=//img[@data-cart-pid='$product_sku' and contains(@src,'$product_sku')]
...     product_name=xpath=//*[@data-cart-pid='$product_sku']//..//..//following-sibling::div//span[@id='txt-product-name']
...     product_qty=xpath=//*[@data-cart-pid='$product_sku']//..//..//following-sibling::div//*[contains(@id,'cartQty')]
...     price=xpath=//*[@data-cart-pid='$product_sku']//..//..//following-sibling::div//span[contains(@id,'product-price')]
...     btn_remove_sku=xpath=//*[@data-cart-pid='$product_sku']//..//..//following-sibling::div//img[contains(@id,'btn-remove')]
...     btn_remove_item=xpath=//span[contains(@class,'DeleteAll') and .='Delete all items']

*** Keyword ***
Display picture product should be
    [Documentation]    Display picture product should be
    [Arguments]        ${sku}
    ${pic_product}      Replace string    ${mini_cart_page.pic_product}    $product_sku    ${sku}
    Wait web element is visible        ${pic_product}

Display button remove product can edit on mini cart by sku
    [Documentation]    Display button remove product on mini cart by sku
    [Arguments]        ${sku}
    ${btn_remove}      Replace string    ${mini_cart_page.btn_remove_sku}    $product_sku    ${sku}
    Wait web element is visible        ${btn_remove}

Get product name on mini cart by sku
    [Documentation]    Get product name on mini cart by sku
    [Arguments]        ${sku}
    ${xpath_product_name}       Replace string    ${mini_cart_page.product_name}    $product_sku    ${sku}
    ${product_name}             Get Text          ${xpath_product_name}
    [Return]        ${product_name}

Get product qty can edit on mini cart by sku
    [Documentation]    Get product qty can edit on mini cart by sku
    [Arguments]        ${sku}
    ${xpath_product_qty}       Replace string    ${mini_cart_page.product_qty}    $product_sku    ${sku}
    ${product_qty}             Get element attribute    ${xpath_product_qty}    value          
    [Return]        ${product_qty}

Get price on mini cart by sku
    [Documentation]     Get price on mini cart by sku
    [Arguments]         ${sku}
    ${xpath_price}      Replace string    ${mini_cart_page.price}    $product_sku    ${sku}
    ${price}            Get Text          ${xpath_price}
    ${price}            Replace string    ${price}    ${space}฿    ${empty}
    ${price}            Replace string    ${price}    ,    ${empty}
    [Return]            ${price}

Remove item in cart
    [Documentation]    Remove item in cart
    Wait until loading cart disappear
    common.Mouse over mini cart
    Set Focus To Element         ${mini_cart_page.btn_remove_item}
    Click Element When Ready     ${mini_cart_page.btn_remove_item}
    common.Wait for loading disappear