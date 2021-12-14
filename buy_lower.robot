*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
Resource    common.robot

*** Variable ***
${frx_AUD_USD}  //*[contains(@class,"item--frxAUDUSD")]
${duration_input}   //*[@class="dc-input__field"]
${payout_toggle}    dc_payout_toggle_item
${low_purchase_btn}     //*[contains(@class,"btn-purchase--2")]
${btn_enabled}      //*[@class="btn-purchase btn-purchase--2"]
${high_low_contract}    dt_contract_high_low_item

*** Keywords ***
Buy lower contract
    wait until page contains element    ${underlying_menu}  60
    click element   ${underlying_menu}
    wait until page contains element    ${dropdown_menu}
    click element   //*[text()="Forex"]
    click element   ${frx_AUD_USD}
    wait until page does not contain element    ${chart_loader}   60
    click element   ${contract_dropdown}
    click element   ${high_low_contract}
    clear element text  ${duration_input}
    input text  ${duration_input}   2
    click element   ${payout_toggle}
    clear input field   ${payout_input}
    Input Text  ${payout_input}    15.50
    wait until page contains element    ${btn_enabled}     120
    click element   ${low_purchase_btn}