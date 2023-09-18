*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime

*** Variables ***
${Url}   https://www.imdb.com/
${Browser}    Chrome
&{film_rating}      молчание ягнят=8.6       побег из шоушенко=9.3      бойцовский клуб=8.8     криминальное чтиво=8.9   достучаться до небес=7.8       остров проклятых=8.2      леон=8.5       зеленая миля=8.6        темный рыцарь=8.8     бесславные ублюдки=8.3

*** Test Cases ***
1 Test
    open browser    ${Url}   ${Browser}
    maximize browser window
    page should contain element     //*[@id="suggestion-search"]
    input text    id=suggestion-search      молчание ягнят
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      побег из шоушенко
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      бойцовский клуб
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      криминальное чтиво
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      достучаться до небес
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      остров проклятых
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]     леон
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      зеленая миля
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      темный рыцарь
    click button    //*[@id="suggestion-search-button"]
    input text    //*[@id="suggestion-search"]      бесславные ублюдки
    click button    //*[@id="suggestion-search-button"]
    ${sorted_ratings} =    Evaluate    sorted($film_rating.items(), key=lambda x: float(x[1]), reverse=True)
    log to console     ${sorted_ratings}