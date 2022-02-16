*** Settings ***
Resource        ${CURDIR}/../../resources/imports.robot

*** Test Cases ***
Get product information by sku and verify
    ${response}    Get product detail infomation by sku    ${product_4901301259691.sku}   ${get_product_enpoint}
    ${product_info}    Get data verify product detail from response    ${response}
    Log To Console    Product Infomations: ${product_info}
    Should be equal     '${product_info.sku}'    '${product_4901301259691.sku}'
    Should be equal     '${product_info.name}'    '${product_4901301259691.name}'
    