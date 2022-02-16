*** Keyword ***
Unfavorite when sku has already favorited
    [Documentation]  Unfavorite when sku has already favorited
    [Arguments]    ${sku_product}
    ${is_favorite}    Run keyword and return status    home_page.Sku should be marked as favorite     ${sku_product}     
    Run keyword if    '${is_favorite}'=='True'    home_page.Click favorite button by sku     ${sku_product}

Favorite product by product sku
    [Documentation]  Favorited product if has not favorited
    [Arguments]    ${sku_product}
    ${is_favorite}    Run keyword and return status    home_page.Sku should be marked as favorite     ${sku_product}     
    Run keyword if    '${is_favorite}'=='False'    home_page.Click favorite button by sku     ${sku_product}
    