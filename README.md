# Lab9CA

This lab aimed to create a control unit for the datapath and become a full processor in the process. The control unit takes in the instruction from the ROM and determines which mux flags should be raised in the datapath. There is also an edge case with branch instrctions which also needs the status bits from the ALU in the datapath to properly function. This program does not need any clock or reset inputs since the datapath is already dependent on those.
