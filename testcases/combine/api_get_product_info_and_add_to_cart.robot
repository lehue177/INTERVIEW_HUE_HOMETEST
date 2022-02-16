*** Settings ***
Resource        ${CURDIR}/../../resources/imports.robot
Suite Setup     common.Open chrome browser and redirect Tops Website
Test Teardown   Test tear down

*** Variables ***
${qty}   1

*** Test Cases ***
Get product infomation from api and add To Cart then verify mini cart
    [Documentation]     Verify that user can add product to cart and verify in mini cart
    [Setup]    Run Keywords    home_keywords.Go to login page
    ...    AND    login_keywords.Login tops website successfully    ${test_acc_1.username}    ${test_acc_1.password}
    ...    AND    mini_cart_keywords.Check and remove all product
    ${response}    Get product detail infomation by sku    ${product_4901301259691.sku}   ${get_product_enpoint}
    ${product_info}    Get product information to validate    ${response}
    #Set qty to dictionary to verify in cart
    Set To Dictionary       ${product_info}     qty=${qty}
    search_keywords.Search product by value    ${product_info.sku}
    home_page.Click add to cart button    ${product_info.sku}
    common.Mouse over mini cart
    mini_cart_keywords.Verify product information on mini cart    ${product_info}
    mini_cart_keywords.Check and remove all product