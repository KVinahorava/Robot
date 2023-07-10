*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Library         DateTime

*** Variables ***
#${name}    John Doe
#${age}     30
#@{fruits}    Apple    Banana    Orange
#&{person}    name=John age=30 city=New York

*** Test Cases ***
1 Test
    set test variable    ${name}    John Doe
    log    ${name}
    set test variable    ${age}     30
    log    ${age}
    set test variable    @{fruits}      Apple    Banana    Orange
    create list    ${fruits}
    log    ${fruits}
    set test variable    &{person}      name=John age=30 city=New York
    create dictionary    &{person}
    log many    &{person}
    append to list    ${fruits}    Mango    Kiwi    Ananas
    log    ${fruits}
    set to dictionary    ${person}    name=Kate    age=37    city=Vilnius
    log many    &{person}
    set test variable    @{favorite}     The Count of Monte Cristo     Shantaram     Anna Karenina
    create list    ${favorite}
    log    ${favorite}
