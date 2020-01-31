*** Settings ***
Documentation  "Work with Amazon web page to make purchases, log in, etc."
Library  SeleniumLibrary

*** Variables ***
${BROWSER}=  Firefox
${SLEEPTIME}=  5s

*** Test Cases ***
User Must Sign In To Purchase
    [Documentation]  Using Amazon Services
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  ${BROWSER}
    Wait Until Page Contains  Hello, Sign in
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=/html/body/div[1]/header/div/div[1]/div[3]/div/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"
    Log  Results for search are present on the page
    Sleep  ${SLEEPTIME}
    Click Link  css=#search > div.s-desktop-width-max.s-desktop-content.sg-row > div.sg-col-20-of-24.sg-col-28-of-32.sg-col-16-of-20.sg-col.s-right-column.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(5) > div.s-result-list.s-search-results.sg-row > div:nth-child(4) > div > span > div > div > div:nth-child(3) > h2 > a
    Sleep  ${SLEEPTIME}
    Click Button  id=add-to-cart-button
    Sleep  15s
    Close Browser

*** Keywords ***
