*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variable ***
${volatility_10_1s}     //*[contains(@class,"item--1HZ10V")]
${selected_underlying}      //*[text()="Volatility 10 (1s) Index" and @class="cq-symbol"]
${cntract_card}     //*[contains(@class,"dc-contract-card")]

*** Keywords ***
Buy rise contract
    wait until page does not contain element    ${loading_state}   60
    wait until page contains element    ${underlying_menu}  60
    click element   ${underlying_menu}
    wait until page contains element    ${dropdown_menu}
    click element  ${volatility_10_1s}
    wait until page does not contain element    ${chart_loader}   60
    wait until page contains element    ${purchase_button}     60
    click element   ${buy_rise}
    wait until page contains element    ${cntract_card}    60