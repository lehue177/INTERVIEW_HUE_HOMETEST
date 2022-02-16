*** Keywords ***
Verify product detail page
    [Arguments]     ${product_name}    ${sku}    ${price}
    Verify product name displays correctly     ${product_name}
    Verify product sku displays correctly    ${sku}
    Verify promotion badges displays correctly
    ${price}    Convert To String    ${price}
    Verify product price displays correctly    ${price}
    Verify 'add to my list' button displays correctly
    Verify 'add to cart' button displays correctly

Unfavorite when product has already favorited
    [Documentation]  Unfavorite when product has already favorited
    ${btn_wishlist}    Run keyword and return status    product_detail_page.Sku should be marked as favorite    
    Run keyword if    ${btn_wishlist}    product_detail_page.Click add to my list