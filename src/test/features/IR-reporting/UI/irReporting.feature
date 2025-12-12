Feature: IR Reporting

    Scenario: Login into QC page and land on irreporting
        Given Login into application
        When User opne the <accountId> and <eventId> 
        And navigate to IR Reporting page
        Then Verify that user is on IR Reporting page

        @qc
        Examples:
        | accountId | eventId |
        | 360       | 38463   |

        @uat
        Examples:
        | accountId | eventId |
        | 396       | 6077    |