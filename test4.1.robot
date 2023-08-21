*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime
Resource        GlobalKeywords.robot

*** Variables ***
${Url}   https://www.wikipedia.org
${Browser}    Chrome

*** Test Cases ***
1 Test
    open website     ${Url}     ${Browser}
    sleep   2
    input text    id:searchInput   азбука морзе
    sleep   2
    select from list by value    xpath://*[@id="searchLanguage"]    ru
    click button   xpath://*[@id="search-form"]/fieldset/button
    sleep    2
    @{morze}    create dictionary
    ${table_rows}       Get WebElements    xpath://*[@id="mw-content-text"]/div[1]/table/tbody//tr
    FOR    ${row}   IN   ${table_rows}
        ${key}      get from list    ${row}     0   fallback=None
        ${value}      get from list    ${row}     3    fallback=None
        set to dictionary    @{morze}    ${key}    ${value}
    END
    log to console    @{morze}
