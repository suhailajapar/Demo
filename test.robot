*** Settings ***
# Import, library
Library     SeleniumLibrary
Resource    common.robot
Resource    virtual_acc.robot
Resource    buy_rise_contract.robot
Resource    buy_lower.robot
Resource    barrier_error.robot
Resource    multiplier_contract.robot
Resource    api_token.robot

*** Variable ***
# Declare variable
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${user_acc}       dt_core_account-info_acc-info
${real_acc_tab}     //*[text()="Real" and contains(@class,"active")]
${demo_acc_tab}     //*[text()="Demo" and contains(@class,"active")]
${switch_acc}       dt_core_account-switcher_demo-tab
${switch_to_demo_acc}   //*[contains(@id,"dt_VRTC")]
${underlying_menu}  //*[@class="cq-symbol-select-btn"]
${dropdown_menu}    //*[contains(@class,"cq-menu-dropdown-enter-done")]
${buy_rise}     //*[contains(@class,"btn-purchase--1")]
${chart_loader}     //*[@class="chart-container__loader"]
${purchase_button}  //*[@class="trade-container__fieldset-wrapper"]
${payout_input}     //*[@id="dt_amount_input"]
${contract_dropdown}        dt_contract_dropdown
${loading_state}    //*[text()="Loading interface..."]


*** Keyword ***
# Custom keyword

*** Test Cases ***
# whtever test cases
Open Deriv
    Login   ${user_email}     ${user_pw}
    Switch Account
    Buy rise contract
    Buy lower contract
    Barrier Error
    Multiplier contract
    API Token
