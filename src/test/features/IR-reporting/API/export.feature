# Feature: IR Events Engagement xlxs Export Downloads API

# 	Scenario Outline: Verify 200 status for with POST Method for audience timeline
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 405 status for with <method> Method for audience timeline
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status for with POST Method with sortOrder firstname as <sortOrder> for audience timeline
# 		Given I have a valid <accountId> and <eventId>
# 		And I set sortOrder to firstname <sortOrder>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | sortOrder |
# 		| 360       | 38463   | ASC       |
# 		| 360       | 38463   | DESC      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | sortOrder |
# 		| 396       | 6077    | ASC       |
# 		| 396       | 6077    | DESC      |

#     Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for audience timeline
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

#     Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for audience timeline
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc 
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |

# 	@uat 
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

#     Scenario Outline: Verify 404 not found with invalid event id token with POST Method for audience timeline
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |
    

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for audience countries
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample        |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing        |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for audience countries
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for audience countries
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for audience countries
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for audience countries
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |
	
# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for audience providers
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for audience providers
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for audience providers
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for audience providers
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for audience providers
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for audience smart-codes
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for audience smart-codes
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for audience smart-codes
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for audience smart-codes
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for audience smart-codes
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for audience views
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for audience views
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for audience views
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for audience views
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for audience views
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for audience languages
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for audience languages
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for audience languages
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678     | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for audience languages
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for audience languages
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for call-guestbook
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | sample      |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for call-guestbook
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:	
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for call-guestbook
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for call-guestbook
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for call-guestbook
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

#    Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for webcast-guestbook
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | sample      |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for webcast-guestbook
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for webcast-guestbook
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678     | 38463     |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for webcast-guestbook
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for webcast-guestbook
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:	
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for engagement polls
# 		Given I have a valid <accountId> and <eventId> and <pollId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | pollId | searchValue |
# 		| 360       | 38463   | 4241   |   sample    |
# 	@uat
# 	Examples:
# 		| accountId | eventId | pollId | searchValue    |
# 		| 396       | 6077    | 7001   |   UAT Testing  |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for engagement polls
# 		Given I have a valid <accountId> and <eventId> and <pollId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |	pollId |
# 		| 360       | 38463   |	4241   |
# 	@uat
# 	Examples:
# 		| accountId | eventId | pollId |
# 		| 396       | 6077    | 1270   |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for engagement polls
# 		Given I have an invalid <accountId> and a valid <eventId> and <pollId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |	pollId |
# 		| 360       | 38463   |	4241   |
# 	@uat
# 	Examples:
# 		| accountId | eventId | pollId |
# 		| 3961       | 6077    | 1270   |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for engagement polls
# 		Given I have a valid <accountId> and an invalid <eventId> and <pollId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |	pollId |
# 		| 360       | 99999   |	4241   |
# 	@uat
# 	Examples:
# 		| accountId | eventId | pollId |
# 		| 396       | 99999   | 1270   |

# 	Scenario Outline: Verify 405 status for with <method> Method for engagement polls
# 		Given I have a valid <accountId> and <eventId> and <pollId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId | pollId |
# 		| GET     | 360       | 38463   | 4241   |
# 		| PUT     | 360       | 38463   | 4241   |
# 		| DELETE  | 360       | 38463   | 4241   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId | pollId |
# 		| GET     | 396       | 6077    | 1270   |
# 		| PUT     | 396       | 6077    | 1270   |
# 		| DELETE  | 396       | 6077    | 1270   |

#    Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for engagement surveys
# 		Given I have a valid <accountId> and <eventId> and <surveyId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | surveyId |searchValue |
# 		| 360       | 38463   | 4243     |sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | surveyId |searchValue |		
# 		| 396       | 6077    | 1269     |UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for engagement surveys
# 		Given I have a valid <accountId> and <eventId> and <surveyId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for engagement surveys
# 		Given I have an invalid <accountId> and a valid <eventId> and <surveyId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678     | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for engagement surveys
# 		Given I have a valid <accountId> and an invalid <eventId> and <surveyId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for engagement surveys
# 		Given I have a valid <accountId> and <eventId> and <surveyId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for engagement questions
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for engagement questions
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for engagement questions
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678     | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for engagement questions
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for engagement questions
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |
	
# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for engagement social-sharing
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample        |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing  |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for engagement social-sharing
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for engagement social-sharing
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678     | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961       | 6077    |	

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for engagement social-sharing
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for engagement social-sharing
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for engagement download
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for engagement download
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for engagement download
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961      | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for engagement download
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for engagement download
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for technology browsers
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for technology browsers
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for technology browsers
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961      | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for technology browsers
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for technology browsers
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# 	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for technology devices
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for technology devices
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for technology devices
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961      | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for technology devices
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for technology devices
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

#   	Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for technology platforms
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat	
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for technology platforms
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for technology platforms
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961      | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for technology platforms
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for technology platforms
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for technology resolutions
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue   |
# 		| 360       | 38463   | sample        |
# 	@uat
# 	Examples:	
# 		| accountId | eventId | searchValue   |
# 		| 396       | 6077    | UAT Testing   |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for technology resolutions
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for technology resolutions
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961      | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for technology resolutions
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for technology resolutions
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |

# Scenario Outline: Verify 200 status with POST Method with search for name value <searchValue> for technology streams
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 200
# 	@qc
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 360       | 38463   | sample      |
# 	@uat
# 	Examples:
# 		| accountId | eventId | searchValue |
# 		| 396       | 6077    | UAT Testing |

# 	Scenario Outline: Verify 401 Unauthorized with invalid token with POST Method for technology streams
# 		Given I have a valid <accountId> and <eventId>
# 		And I use an invalid token
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 401
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 6077    |

# 	Scenario Outline: Verify 400 bad request with invalid account id token with POST Method for technology streams
# 		Given I have an invalid <accountId> and a valid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 400
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 678       | 38463   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 3961      | 6077    |

# 	Scenario Outline: Verify 404 not found with invalid event id token with POST Method for technology streams
# 		Given I have a valid <accountId> and an invalid <eventId>
# 		When I send a POST request to the exportDownloads endpoint
# 		Then the response status should be 404
# 	@qc
# 	Examples:
# 		| accountId | eventId |
# 		| 360       | 99999   |
# 	@uat
# 	Examples:
# 		| accountId | eventId |
# 		| 396       | 99999   |

# 	Scenario Outline: Verify 405 status for with <method> Method for technology streams
# 		Given I have a valid <accountId> and <eventId>
# 		When I send a <method> request to the exportDownloads endpoint
# 		Then the response status should be 405
# 	@qc
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 360       | 38463   |
# 		| PUT     | 360       | 38463   |
# 		| DELETE  | 360       | 38463   |
# 	@uat
# 	Examples:
# 		| method  | accountId | eventId |
# 		| GET     | 396       | 6077    |
# 		| PUT     | 396       | 6077    |
# 		| DELETE  | 396       | 6077    |
		