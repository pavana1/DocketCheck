*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${Browser}      Chrome
${URL}      https://demoqa.com/text-box

*** Test Cases ***
Open and Close Browser #Test case name
    open browser     ${URL}     ${Browser}
    close browser
