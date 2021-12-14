*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

*** Variable ***
${deactivate_setting}       //*[@id="dc_deactivate-account_link"]
${deactivate_btn}       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/button

*** Keywords ***
Deactivate account
    click element   ${deactivate_setting}
    wait until page does not contain element    ${loader}   120
    wait until page contains element    ${deactivate_btn}   60