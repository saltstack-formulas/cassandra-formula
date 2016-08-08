{% from "cassandra/map.jinja" import cassandra with context %}

include:
  - cassandra

cassandra_config_yaml:
  file.managed:
    - name: /etc/cassandra/cassandra.yaml
    - source: salt://cassandra/files/cassandra_{{ cassandra.series }}.yaml
    - template: jinja
    - require:
      - pkg: cassandra
    - watch_in:
      - service: cassandra

cassandra_config_rackdc:
  file.managed:
    - name: /etc/cassandra/cassandra-rackdc.properties
    - source: salt://cassandra/files/cassandra-rackdc.properties
    - template: jinja
    - require:
      - pkg: cassandra
    - watch_in:
      - service: cassandra

