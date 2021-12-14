*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
Resource    common.robot

*** Variable ***
${account_page}     //*[@class="account-settings-toggle"]
${loader}       //*[contains(@class,"account__initial-loader")]
${token_setting}    //*[@id="dc_api-token_link"]
${token_name}       //*[@name="token_name" and @class="dc-input__field"]
${char_error_min}       //*[text()="Length of token name must be between 2 and 32 characters."]
${char_error_max}       //*[text()="Maximum 32 characters."]
${create_btn_disabled}      //*[contains(@class,"da-api-token__button") and @disabled]
${create_btn_enabled}      //*[contains(@class,"da-api-token__button")]
${copy_button}      //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
${delete_button}    //*[@class="dc-btn dc-btn--secondary dc-btn__small"]
${table_row}        //*[@class="da-api-token__table-cell-row"]
${yes_btn}      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]


*** Keywords ***
API Token
    wait until page does not contain element    ${loading_state}   60
    click element   ${account_page}
    wait until page does not contain element    ${loader}   120
    wait until page contains element    //*[contains(@class,"dc-vertical-tab__tab")]    60
    click element   ${token_setting}
    wait until page does not contain element    ${loader}   120
    click element   //*[text()="Read"]
    click element   //*[text()="Trade"]
    click element   //*[text()="Payments"]
    click element   //*[text()="Admin"]
    click element   //*[text()="Trading information"]
    input text      ${token_name}   a
    page should contain element     ${char_error_min}
    clear input field   ${token_name}
    input text      ${token_name}   asdfghjklopiuytredswqazxcvbnmkloiuytre
    page should contain element     ${char_error_max}
    clear input field   ${token_name}
    input text      ${token_name}   1234567890
    page should not contain element     ${create_btn_disabled}
    clear input field   ${token_name}
    input text      ${token_name}   abcdefghi
    page should not contain element     ${create_btn_disabled}
    clear input field   ${token_name}
    input text      ${token_name}   !
    page should contain element     //*[text()="Only letters, numbers, and underscores are allowed."]
    clear input field   ${token_name}
    input text      ${token_name}   abcdefghi123
    page should not contain element     ${create_btn_disabled}
    click element   ${create_btn_enabled}
    wait until page contains element    ${table_row}    60
    click element   ${copy_button}
    wait until page contains element    //*[text()="Token copied!"]     60
    wait until page does not contain element    //*[text()="Token copied!"]     60
    click element   ${delete_button}
    click element   ${yes_btn}


