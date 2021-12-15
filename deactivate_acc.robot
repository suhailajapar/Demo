*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

*** Variable ***
${deactivate_setting}       //*[@id="dc_deactivate-account_link"]
${step_one_btn}       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/button
${reasons_page}     //*[@class="deactivate-account-reasons"]
${error_text}       //*[text()="Please select at least one reason"]
${reason_one}       //*[text()="I’m no longer interested in trading."]
${reason_two}       //*[text()="I prefer another trading website."]
${reason_three}       //*[text()="Customer service was unsatisfactory."]
${cont_btn_disabled}        //*[contains(@class,"dc-btn--primary dc-btn__large") and @disabled]
${continue_btn}     //*[contains(@class,"dc-btn--primary dc-btn__large")]
${warning_alert}        //*[@class="account-closure-warning-modal"]
${goback_btn}       //*[@id="modal_root"]/div/div/div/div[2]/button[1]
${no_overlay}      //*[contains(@class,"dc-themed-scrollbars__autohide--is-hovered")]
${deactivate_btn}       //*[@id="modal_root"]/div/div/div/div[2]/button[2]
${leave_msg}        //*[@id="modal_root"]/div/div/p

*** Keywords ***
Deactivate account
    click element   ${deactivate_setting}
    wait until page does not contain element    ${loader}   120
    wait until page contains element    ${step_one_btn}   60
    click element   ${step_one_btn}
    wait until page contains element    ${reasons_page}     15
#    check "continue" button disabled when no checkboxes selected
    click element   ${continue_btn}
    page should contain element     ${error_text}
    page should contain element     ${cont_btn_disabled}
#    Check up to 3 reason
    click element   ${reason_one}
    click element   ${reason_two}
    click element   ${reason_three}
    click element   ${continue_btn}
    wait until page contains element    ${warning_alert}    15
#    Check "Go Back" Button
    click element   ${goback_btn}
    wait until page contains element     ${no_overlay}
#    Check deactivate button (final step)
    click element   ${continue_btn}
    wait until page contains element    ${warning_alert}    15
    click element   ${deactivate_btn}
    wait until page contains element     ${leave_msg}   60