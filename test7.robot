*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime

*** Variables ***
${Url}   https://stem.release.stemscopes-v4-dev.aws.acceleratelearning.com/login?state=tx
${Browser}    Chrome
${district}     Texas
${username}     kvinahorava
${password}     12345678Lone!1234

*** Test Cases ***
1 Test
     open browser   ${Url}    ${Browser}
     maximize browser window
     Login to site
     Go to scope page
     Count and get scopes name


2 Test
    open browser   ${Url}    ${Browser}
    maximize browser window
    Login to site
    Go to resource page
    Count and get resource name

*** Keywords ***
Login to site
    wait until page contains element    //input[@id="district"]
     input text     //input[@id="district"]     ${district}
     wait until page contains element       //*[@id][text()="Texas"]
     click element    //*[@id][text()="Texas"]
     input text     //input[@id="username"]     ${username}
     input text    //input[@id="password"]      ${password}
     click element    //button[@type="submit"]
     wait until keyword succeeds    10s      1s      wait until page contains element    //h1[@title="Dashboard"]
     sleep    2s

Go to scope page
    wait until page contains element    //*[@title="Open Scopes Page"]
     click element      //*[@title="Open Scopes Page"]
     wait until page contains element       //h1[@title="Scopes"]
     wait until page contains element    //li[@data-testid="card"]

Go to resource page
    wait until page contains element    //*[@title="Open Resource Page"]
    click element    //*[@title="Open Resource Page"]
    sleep    3s
    wait until page contains element    //h1[@title="Teacher Resources"]
    wait until page contains element    //li[@class="chakra-linkbox LinkCard_container__OY8Hm emotion-css-cache-dd1ql5"]


Count and get scopes name
    ${scopes_name}     create list
     ${count}   get element count    //li[@data-testid="card"]
     FOR    ${i}    IN RANGE    1    ${count}+1
       ${temp}    get text    (//*[contains(@class, "link-overlay-wrapper")]//p[1])[${i}]
       log to console    ${temp}
       append to list    ${scopes_name}    ${temp}
     END
     log to console    ${scopes_name}

Count and get resource name
    ${resource_name}    create list
    ${count}   get element count    //li[contains(@class, "chakra-linkbox")]
    log to console    {count}
    FOR    ${i}    IN RANGE    1    ${count}+1
       ${temp}    get text    (//*[contains(@class, "chakra-linkbox__overlay")]//p[1])[${i}]
       append to list    ${resource_name}    ${temp}
    END
    FOR    ${i}    IN RANGE    1    ${count}+1
       click element    (//*[contains(@class, "chakra-linkbox__overlay")])[${i}]
       sleep    2s
       wait until page contains    //*[contains(@class,"chakra-text")][text()="Curriculum Area"]
       click element    //*[@title="Open Resource Page"]
    END


#Curriculum arera filtr
#    wait until page contains element    //*[contains(@class,"chakra-text")][text()="Curriculum Area"]/ancestor::button
#    click element    //*[contains@class, "chakra-text")]{text})=*Curriculum Area"]/ancestor::button
#    wait until page contains element    //button[@title="Science"]
#    click element    //button[@title="Science"]
#    wait until page contains element    //h2[text()="Filters Applied"]
#    wait until page contains element    (//*[contains(@class, "chakra-button")]/*[text()="Science"])[2]
#    run keyword if    '${filter}' == 'Grades'   wait until page contains element   //*[contains(@class, "link_overlay")]//p[2][text()="1"]
#    run keyword if    '${filter}' == 'Grades'   grade count


