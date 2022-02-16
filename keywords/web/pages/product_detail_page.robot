*** Variables ***
&{product_detail_page}    
...     lbl_product_name=xpath=//div[@class='name']/h1[text()='$product_name']
...     lbl_product_sku=xpath=//div[@class='sku' and text()='$product_sku']
...     lbl_product_price=xpath=//span[@class='current-price' and .='$price']
...     btn_add_to_cart=xpath=//div[@class='add-to-cart']
...     btn_add_to_my_list=xpath=//div[@data-testid='btn-addProduct-OnAddWishlist']//img
...     btn_add_to_my_list_enable=xpath=//div[@data-testid='btn-addProduct-OnAddWishlist']//img[contains(@src,'icon-favorite')]
...     btn_add_product=xpath=//button[@data-testid='adjust-product-qty-box-increase-btn' and @data-productid='sku']
...     img_product_promo_badges=xpath=//div[@class='promo-badges']//img[@class='ui image promo-image']

*** Keywords ***
Verify product name displays correctly
    [Documentation]     Check name of product on display
    [Arguments]        ${product_name}
    ${name}    Replace string    ${product_detail_page.lbl_product_name}    $product_name    ${product_name}
    Wait web element is visible   ${name}

Verify product sku displays correctly
    [Documentation]    check sku of product on display
    [Arguments]    ${sku}
    ${product_sku}    Replace string    ${product_detail_page.lbl_product_sku}    $product_sku    ${sku}
    Wait web element is visible    ${product_sku}

Verify promotion badges displays correctly
    [Documentation]    check promo baddes on display
    Wait web element is visible    ${product_detail_page.img_product_promo_badges}

Verify 'add to my list' button displays correctly
    [Documentation]    check add product on wish list on display
    Wait web element is visible    ${product_detail_page.btn_add_to_my_list}

Verify product price displays correctly
    [Documentation]    check price of product on display
    [Arguments]    ${price}
    ${product_price}    Replace string    ${product_detail_page.lbl_product_price}    $price    ${price}
    Wait web element is visible    ${product_price}

Verify 'add to cart' button displays correctly
    [Documentation]    Verify button add to cart display
    Wait web element is visible    ${product_detail_page.btn_add_to_cart}
    Element should be enabled        ${product_detail_page.btn_add_to_cart}

Click add to my list
    Click element when ready    ${product_detail_page.btn_add_to_my_list}

Sku should be marked as favorite
    [Documentation]     Sku should be marked as favorite
    Wait web element is visible         ${product_detail_page.btn_add_to_my_list_enable}