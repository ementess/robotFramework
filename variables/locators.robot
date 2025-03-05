*** Variables ***
${cookie_indicator}         //fe-product-cookie-indicator
${cookie_accept_button}            ${cookie_indicator}//button[@class="mat-caption btn accept-all"]

${bluePopUp_addressBar}    //*[@class="header-middle ng-star-inserted"]//*[@class="popover ng-star-inserted"]
${bluePopUP_closeIcon}      //*[@class="popover ng-star-inserted"]//*[@data-icon="xmark"]

${page_spinner}     //fe-spinner

${tab_migrosSanalMarket_enabled}         //*[@id="header-sanalmarket-tab" and contains(@class,"selected")]
${categories_icon}                         //div[@class="tabs"]//div[@class="categories-icon"]
${categories_dropdown}                  //*[@class="sub-categories-wrapper"]
${category_petshop_id}                 header-categories--pet-shop-c-a0


${filter_header}        id:product-filter-desktop-title
${subCategory_text}     (//*[@class="breadcrumb desktop-only"]//a[@class="breadcrumbs__link"])[2]


${sortFilter_dropdown}     //*[@class="sort-dropdown clearMarginTop"]
${filterOption_dusukFiyat}      //mat-option//span[text()=" Önce En Düşük Fiyat "]

${product_prices_onPage}           //fe-product-price//span[contains(text(),",")]