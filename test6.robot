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
@{film_name}      The Silence of the Lambs      Fight Club      The Shawshank Redemption        Pulp Fiction        The Dark Knight         Inglourious Basterds        Inception       Knockin' on Heaven's Door       Shutter Island      The Green Mile

*** Test Cases ***
1 Test
    open browser    ${Url}   ${Browser}     options*add_experimental_option(“datach”, True)
    maximize browser window
    ${my_dictinary}    create dictionary
    create file    My_Favorite_Films.txt   My favorite films with raitings\n---------------\n
    FOR    ${i}     IN    @{film_name}
        page should contain element     //*[@id="suggestion-search"]
        input text    id=suggestion-search      ${i}
        click element    //*[@id="suggestion-search-button"]
        wait until page contains element    //*[contains(@class, "find-result-item")]
        click element    //*[contains(@class, "find-result-item")]//*[text()="${i}"]/ancestor::li
        wait until page contains element    //*[contains(@data-testid, "hero-rating-bar__aggregate-rating__score")]/span[1]
        ${raiting}    get text    (//*[contains(@data-testid, "hero-rating-bar__aggregate-rating__score")]/span[1])[1]
        set to dictionary    ${my_dictinary}    ${i}=${raiting}
        append to file    My_Favorite_Films.txt     \r${i}-${raiting}\n
    END




