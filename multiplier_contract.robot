*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
Resource    common.robot

*** Variable ***
${volatility_50}        //*[contains(@class,"item--R_50")]
${multiplier_contract}      dt_contract_multiplier_item
${max_stake_error}      //*[text()="Maximum stake allowed is 2000.00."]
${min_stake_error}      //*[@data-tooltip="Please enter a stake amount that's at least 1.00."]
${stake_input}      //*[@id="dt_amount_input"]
${take_profit_checked}      //*[@id="dc_take_profit-checkbox_input" and @checked]
${deal_cancel_checked}      //*[@id="dt_cancellation-checkbox_input" and @checked]
${multiplier_value}     //*[text()="x100" and contains(@class,"dc-list__item")]
${deal_price}       //*[@class="trade-container__price-info-currency"]

*** Keywords ***
Multiplier contract
    wait until page contains element    ${underlying_menu}  60
    click element   ${underlying_menu}
    wait until page contains element    ${dropdown_menu}
    click element   //*[text()="Synthetic Indices"]
    click element   ${volatility_50}
    wait until page does not contain element    ${chart_loader}   60
    click element   ${contract_dropdown}
    click element   ${multiplier_contract}
    wait until page does not contain element    //*[text()="Payout"]    60
    click element       //*[@name="multiplier" and contains(@class,"dc-text")]
    Page Should Contain Element    20
    Page Should Contain Element    40
    Page Should Contain Element    60
    Page Should Contain Element    100
    Page Should Contain Element    200
    clear input field   ${stake_input}
    input text      ${stake_input}      2001
    wait until page contains element    ${max_stake_error}     60
    clear input field   ${stake_input}
    input text      ${stake_input}      0.9
    wait until page contains element    ${min_stake_error}      60
    click element   //*[contains(@class,"take_profit-checkbox__input")]
    Page Should Not Contain Element   ${deal_cancel_checked}
    click element   //*[text()="Deal cancellation"]
#    Page Should Not Contain Element   ${take_profit_checked}
    click element   //*[@name="cancellation_duration" and contains(@class,"dc-text")]
    Page Should Contain Element    5m
    Page Should Contain Element    10m
    Page Should Contain Element    15m
    Page Should Contain Element    30m
    Page Should Contain Element    60m
    clear input field   ${stake_input}
    input text      ${stake_input}      10
    wait until page contains element    ${deal_price}  60
    ${deal_fee_10}=     Get Text    ${deal_price}
    clear input field   ${stake_input}
    input text      ${stake_input}      100
    wait until page contains element    ${deal_price}  60
    ${deal_fee_100}=    Get Text    //*[@class="trade-container__price-info-currency"]
    Should Not Be Equal As Strings  ${deal_fee_10}  ${deal_fee_100}
    click element   dt_amount_input_add
    ${added_value}=     get element attribute   ${stake_input}  value
    should be equal as strings  ${added_value}  101
    click element   dt_amount_input_sub
    ${minus_value}=     get element attribute   ${stake_input}  value
    should be equal as strings  ${minus_value}  100