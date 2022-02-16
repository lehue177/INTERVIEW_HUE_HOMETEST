*** Keywords ***
Get product detail infomation by sku
    [Arguments]    ${sku}   ${enpoint}
    ${enpoint}    Replace string    ${enpoint}    product_sku    ${sku}
    ${response}    REST.GET    endpoint=${enpoint}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]    ${response}

Get data verify product detail from response
    [Arguments]    ${response}
    ${products}    Set Variable    ${response}[products]
    ${first_product}    Set Variable    ${products}[0]
    ${sku}    Set Variable    ${first_product}[sku]
    ${name}    Set Variable    ${first_product}[name]
    ${price}    Set Variable    ${first_product}[price]
    ${price_discount}    Set Variable    ${first_product}[price_discount]
    &{product_data}     Create Dictionary   sku=${sku}    name=${name}    price=${price}    price_discount=${price_discount}
    [return]    ${product_data}

Get price with discount
    [Arguments]    ${price}    ${price_discount}
    ${price}       Convert to number    ${price}
    ${price_discount}       Convert to number    ${price_discount}
    ${current_price}      Evaluate    ${price}-(${price}*${price_discount}/100)
    ${current_price}   Convert to integer    ${current_price}
    ${current_price}   Convert to 2 digits    ${current_price}
    [Return]           ${current_price}

Get product information to validate
    [Arguments]    ${response}
    ${product_data}     Get data verify product detail from response    ${response}
    ${current_price}    Get price with discount    ${product_data.price}    ${product_data.price_discount}
    &{product_info}     Create Dictionary   sku=${product_data.sku}   name=${product_data.name}    price=${current_price}
    [return]    ${product_info}