#!/bin/bash
source_file="FSM2_async"  # 원본 파일
names=(
    Simple_state_transitions_3
    Simple_one_hot_state_transitions_3
    Simple_FSM_3_asynchronous_reset
    Simple_FSM_3_synchronous_reset
    Design_a_Moore_FSM
    Lemmings_1
    Lemmings_2
    Lemmings_3
    Lemmings_4
    One_hot_FSM
    packet_parser
    packet_parser_and_datapath
    Serial_receiver
    Serial_receiver_and_datapath
    Serial_receiver_with_parity_checking
    Sequence_recognition
    Design_a_Mealy_FSM
    Serial_twos_complementer_Moore_FSM
    Q5b_Serial_twos_complementer_Mealy_FSM
    Q3a_FSM
    Q3b_FSM
    Q3c_FSM_logic
    Q6b_FSM_next_state_logic
    Q6c_FSM_one_hot_next_state_logic
    Q6_FSM
    Q2a_FSM
    Q2b_One_hot_FSM_equations
    Q2a_FSM
    Q2b_Another_FSM
)
for name in "${names[@]}"; do
    cp "$source_file" "$name"
done

