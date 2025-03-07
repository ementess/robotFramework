*** Settings ***
Resource  ../stepDefinitions/migrosSteps.robot

Suite Setup     Browser is opened and Migros web page is opened
Test Teardown   Run keyword if test failed      capture screenshot


*** Test Cases ***
Migros Main Page is displayed successfully
    Given Migros Home Page is displayed successfully
    And Accept Cookie if cookie indicator is visible
    And Close Blue Pop Up message on address bar if it is visible

Pet Shop option can be selected from Categories and User is redirected to Pet Shop page
    Given User should see  ${categories_icon}
    When User selects a category option from categories dropdown  ${category_petshop_id}
    Then Current Location should be     /pet-shop-c-a0

Pet Shop page can be displayed successfully
    Given Current Location Should be    /pet-shop-c-a0
    And User should not see     ${page_spinner}
    And Mouse over  ${tab_migrossanalmarket_enabled}    #Added as a workaround since close categories dropdown because it stays on screen after click action
    Then Filter header should be     Pet Shop
    And Sub category under the main page should be     Pet Shop
    And Subcategory in filter should be existing for    Köpek
    And Subcategory in filter should be existing for    Kedi
    And Subcategory in filter should be existing for    Pet Aksesuarları

Product items are listed according to lowest price on the page
    Given User should see    ${sortfilter_dropdown}
    When User clicks to     ${sortfilter_dropdown}
    And User clicks to   ${filteroption_dusukfiyat}
    Then User should see    ${page_spinner}
    Then User should not see  ${page_spinner}
    And All Items on page are listed correctly according to lowest price
