Feature: eIDAS Connector Node Smoke Test - Estonia - Production

    This tests the connection of the UK Connector Node to the Estonian Proxy Node

    @ignore
    Scenario: Send a request to sign in with an Estonian identity
        Given   the user visits a UK Government service
        And     they choose to sign in with a digital identity from another European country
        And     they select 'ID-kaart' scheme
        And     they navigate through the eIDAS CEF reference implementation node
        And     they click button "ENGLISH"
        Then    they should arrive at a page with text 'Insert your ID-card into the card reader'
        And     the page should not have an error message
