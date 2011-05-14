Feature: Start and stop Neo4j Server
  The Neo4j server should start and stop using a command line script

  Background:
    Given a platform supported by Neo4j
    And a working directory at relative path "target"
    And set Neo4j Home to "neo4j_home"
    And Neo4j Home should contain a Neo4j Server installation

  Scenario: Start Neo4j Server
    When I start Neo4j Server
    And wait for Server started at "http://localhost:7474"
    Then "http://localhost:7474" should provide the Neo4j REST interface
    Then requesting "http://localhost:7474/db/data/ext/" should contain "SpatialPlugin"
    Then sending "layer=test" to "http://localhost:7474/db/data/ext/SpatialPlugin/graphdb/addEditableLayer" should contain "EditableLayerImpl"
    #Then updating "{"lon": "13", "lat": "55"}" to "http://localhost:7474/db/data/node/0/properties" should have a response of "204"