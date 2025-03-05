*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
Library     AllureLibrary
Library  Screenshot
Library     DateTime

Resource  ../variables/locators.robot
Resource  ../variables/config.robot


*** Keywords ***
Browser is opened and Migros web page is opened
    Open Browser    ${migrosURL}    ${browserSelection}   #${BROWSER}
    Maximize Browser Window

Accept Cookie if cookie indicator is visible
    ${isVisible}=      Run Keyword And Return Status   Element Should Be Visible   ${cookie_indicator}      ${waitTime}
    Run Keyword If   ${isVisible}         User clicks to    ${cookie_accept_button}

Close Blue Pop Up message on address bar if it is visible
    ${isVisible}=      Run Keyword And Return Status   Element Should Be Visible   ${bluePopUp_addressBar}      ${waitTime}
    Run Keyword If   ${isVisible}         User clicks to    ${bluePopUP_closeIcon}
    Run Keyword If   ${isVisible}         Sleep     1


Migros Home Page is displayed successfully
    Wait until element is visible       ${tab_migrosSanalMarket_enabled}        ${waitTime}
    Location should contain     ${migrosURL}
    Wait until element is not visible    ${page_spinner}
    #Other necessary check points can be added to this step to verify home page

User clicks to
    [Arguments]     ${element}
    Wait until element is visible       ${element}      ${waitTime}
    Click Element       ${element}

User should see
    [Arguments]     ${element}
    Wait until element is visible       ${element}      ${waitTime}

User should not see
    [Arguments]     ${element}
    Wait until element is not visible       ${element}      ${waitTime}

Current Location Should be
    [Arguments]     ${uri}
    Wait Until Location Contains    ${uri}


User selects a category option from categories dropdown
    [Arguments]     ${option}
    Scroll Element Into View        ${categories_icon}
    User clicks to     ${categories_icon}
    Wait until element is visible    ${categories_dropdown}
    Sleep  0.5
    Wait until element is visible   id:${option}
    Execute Javascript      window.document.getElementById("${option}").click()     #Since dropdown disappears suddenly when click action is called from robot, this workaround is used.
    Wait until element is visible   ${page_spinner}


Sub category under the main page should be
    [Arguments]     ${expectedSubCategory}
    Wait until element is visible       ${subcategory_text}
    Element Text Should Be    ${subcategory_text}       ${expectedSubCategory}


Filter Header Should be
    [Arguments]     ${expectedHeader}
    Wait until element is visible   ${filter_header}
    ${actualHeader}=    Get Text    ${filter_header}
    Should be equal    ${actualHeader}  ${expectedHeader}


Subcategory in filter should be existing for
    [Arguments]     ${expected}
    Wait Until Element is Visible   //*[@class="filter__subcategories ng-star-inserted"]//a[contains(text(),"${expected}")]

All Items on page are listed correctly according to lowest price
    @{all_prices}    Get WebElements    ${product_prices_onPage}
    ${price_list}    Create List
    FOR    ${price}    IN    @{all_prices}
        ${price_text}    Get Text    ${price}
        ${formatted_price}    Replace String    ${price_text}    TL    ${EMPTY}
        ${formatted_price}    Replace String    ${formatted_price}    ,    .
        ${price_float}        Convert To Number    ${formatted_price}
        Append To List    ${price_list}    ${price_float}
    END
    ${sorted_prices}    Copy List    ${price_list}
    Sort List    ${sorted_prices}
    Should Be Equal    ${price_list}    ${sorted_prices}


test
