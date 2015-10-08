
#requires?

begin
  # -=-=-=-
  # Create a circuit V-R-EOF
  voltage  = Voltage::new volts: 12       # returns an electric potential difference source
                                          # frequency is not given so 0Hz (i.e. direct current) is considered
  circuit  = Circuit::new source: voltage # returns empty circuit object with source
  node1    = Node::new                    # returns empty (not connected to anything) node object
  resistor = Resistor::new ohms: 1e3      # returns a resistance object

  circuit.connect from: voltage, to: resistor, through: node1 # connects the resistor to the source through node1

  # OR #
  
  circuit.connect resistor # no `from:' is given so `source' is implied
                           # no `through:' is given so a new unnamed node is created

  # OR #

  circuit.connect from: voltage, to: resistor # no `through:' is given so a new unnamed node is created

  # If no nodes are explicitly connected between the last component back to the source,
  # the following methods will consider the last component added to be connected to the ground.

  circuit.components # return array of components (in order)
  circuit.work # return workload generated
  circuit.current # return current consumed
  circuit.resistors[0].voltage_drop # returns the voltage drop on the first resistor
  circuit.resistors[0].current # returns the current that flows through the first resistor
  circuit.nodes[0].current # returns the current that enters/leaves the node
end

