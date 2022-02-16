*** Settings ***
Library     OperatingSystem
Library     Collections
Library     DateTime
Library     String
Library     RequestsLibrary
Library     REST
Library     SeleniumLibrary                 
Library     JSONLibrary

#resource
Variables   ${CURDIR}/test_data.yaml
Variables   ${CURDIR}/configs.yaml

#api
Resource    ../keywords/api/get_product_api.robot

#pages
Resource    ../keywords/web/common/common.robot
Resource    ../keywords/web/pages/home_page.robot
Resource    ../keywords/web/pages/login_page.robot
Resource    ../keywords/web/pages/mini_cart_page.robot
Resource    ../keywords/web/pages/mylist_page.robot
Resource    ../keywords/web/pages/product_detail_page.robot
#feature
Resource    ../keywords/web/features/login_keywords.robot
Resource    ../keywords/web/features/search_keywords.robot
Resource    ../keywords/web/features/home_keywords.robot
Resource    ../keywords/web/features/mini_cart_keywords.robot
Resource    ../keywords/web/features/wishlist_keywords.robot
Resource    ../keywords/web/features/product_detail_keywords.robot
