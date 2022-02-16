*** Settings ***
Resource    ${CURDIR}/../../resources/imports.robot
Suite Setup     common.Open chrome browser and redirect Tops Website
Test Teardown   Test tear down

*** Test Cases ***
Get product infomation from api to Verify product detail page
    [Documentation]     Get product infomation from api to Verify product detail page
    [Setup]    Run Keywords    home_keywords.Go to login page
    ...    AND    login_keywords.Login tops website successfully    ${test_acc_1.username}    ${test_acc_1.password}
    ${response}    Get product detail infomation by sku    ${product_4901301259691.sku}   ${get_product_enpoint}
    ${product_info}    Get product information to validate    ${response}
    search_keywords.Search product by value    ${product_info.sku}
    home_page.Go to product detail    ${product_info.sku}
    product_detail_keywords.Verify product detail page   ${product_info.name}    ${product_info.sku}    ${product_info.price}