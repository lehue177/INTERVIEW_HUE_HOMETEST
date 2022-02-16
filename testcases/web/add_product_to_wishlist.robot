*** Settings ***
Resource    ${CURDIR}/../../resources/imports.robot
Suite Setup     common.Open chrome browser and redirect Tops Website
Test Teardown   Test tear down

*** Test Cases ***
Add Product To Wishlist Successfully
    [Documentation]     Verify that user can add wishlist successfully
    [Setup]    Run Keywords    home_keywords.Go to login page
    ...    AND    login_keywords.Login tops website successfully    ${test_acc_1.username}    ${test_acc_1.password}
    search_keywords.Search product by value    ${product_4901301259691.sku}
    wishlist_keywords.Unfavorite when sku has already favorited    ${product_4901301259691.sku}
    wishlist_keywords.Favorite product by product sku    ${product_4901301259691.sku}
    home_keywords.Go to my list page
    mylist_page.My list should contain sku    ${product_4901301259691.sku}