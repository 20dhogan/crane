// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Mar 26 13:45:54 2025
// Host        : miranda.bluezone.usu.edu running 64-bit Rocky Linux release 9.4 (Blue Onyx)
// Command     : write_verilog -force post_synth.v
// Design      : top
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module debouncer
   (speed_dn,
    btn_db_reg_0,
    clk_IBUF_BUFG,
    rst_IBUF,
    uart_data_OBUF,
    speed_up,
    btn_dn_IBUF);
  output speed_dn;
  output btn_db_reg_0;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input [1:0]uart_data_OBUF;
  input speed_up;
  input btn_dn_IBUF;

  wire \<const1> ;
  wire \FSM_sequential_state[0]_i_1__0_n_0 ;
  wire T1_n_0;
  wire T1_n_1;
  wire btn_db_reg_0;
  wire btn_dn_IBUF;
  wire clear_i_1_n_0;
  wire clear_reg_n_0;
  wire clk_IBUF_BUFG;
  wire rst_IBUF;
  wire speed_dn;
  wire speed_up;
  wire [1:0]state;
  wire [1:0]uart_data_OBUF;

  LUT3 #(
    .INIT(8'hE2)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(btn_dn_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[0]_i_1__0_n_0 ));
  (* FSM_ENCODED_STATES = "PRESS:01,RELEASE:10,WAIT:00" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state[0]_i_1__0_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "PRESS:01,RELEASE:10,WAIT:00" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(T1_n_1),
        .Q(state[1]));
  tcounter_1 T1
       (.\FSM_sequential_state_reg[1] (T1_n_0),
        .\FSM_sequential_state_reg[1]_0 (clear_reg_n_0),
        .btn_dn_IBUF(btn_dn_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .done_reg_0(T1_n_1),
        .rst_IBUF(rst_IBUF),
        .speed_dn(speed_dn),
        .state(state));
  VCC VCC
       (.P(\<const1> ));
  FDCE #(
    .INIT(1'b0)) 
    btn_db_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(T1_n_0),
        .Q(speed_dn));
  LUT4 #(
    .INIT(16'hC055)) 
    clear_i_1
       (.I0(btn_dn_IBUF),
        .I1(clear_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .O(clear_i_1_n_0));
  FDPE #(
    .INIT(1'b1)) 
    clear_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clear_i_1_n_0),
        .PRE(rst_IBUF),
        .Q(clear_reg_n_0));
  LUT4 #(
    .INIT(16'hD4D0)) 
    \speed[1]_i_1 
       (.I0(speed_dn),
        .I1(uart_data_OBUF[0]),
        .I2(uart_data_OBUF[1]),
        .I3(speed_up),
        .O(btn_db_reg_0));
endmodule

(* ORIG_REF_NAME = "debouncer" *) 
module debouncer_0
   (speed_up,
    btn_db_reg_0,
    clk_IBUF_BUFG,
    rst_IBUF,
    uart_data_OBUF,
    speed_dn,
    btn_up_IBUF);
  output speed_up;
  output btn_db_reg_0;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input [1:0]uart_data_OBUF;
  input speed_dn;
  input btn_up_IBUF;

  wire \<const1> ;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire T1_n_0;
  wire T1_n_1;
  wire btn_db_reg_0;
  wire btn_up_IBUF;
  wire clear_i_1__0_n_0;
  wire clear_reg_n_0;
  wire clk_IBUF_BUFG;
  wire rst_IBUF;
  wire speed_dn;
  wire speed_up;
  wire [1:0]state;
  wire [1:0]uart_data_OBUF;

  LUT3 #(
    .INIT(8'hE2)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(btn_up_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "PRESS:01,RELEASE:10,WAIT:00" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "PRESS:01,RELEASE:10,WAIT:00" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(T1_n_1),
        .Q(state[1]));
  tcounter T1
       (.\FSM_sequential_state_reg[1] (T1_n_0),
        .\FSM_sequential_state_reg[1]_0 (clear_reg_n_0),
        .btn_up_IBUF(btn_up_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .done_reg_0(T1_n_1),
        .rst_IBUF(rst_IBUF),
        .speed_up(speed_up),
        .state(state));
  VCC VCC
       (.P(\<const1> ));
  FDCE #(
    .INIT(1'b0)) 
    btn_db_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(T1_n_0),
        .Q(speed_up));
  LUT4 #(
    .INIT(16'hC055)) 
    clear_i_1__0
       (.I0(btn_up_IBUF),
        .I1(clear_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .O(clear_i_1__0_n_0));
  FDPE #(
    .INIT(1'b1)) 
    clear_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clear_i_1__0_n_0),
        .PRE(rst_IBUF),
        .Q(clear_reg_n_0));
  LUT4 #(
    .INIT(16'h0DEA)) 
    \speed[0]_i_1 
       (.I0(speed_up),
        .I1(uart_data_OBUF[1]),
        .I2(speed_dn),
        .I3(uart_data_OBUF[0]),
        .O(btn_db_reg_0));
endmodule

module sev_seg_display
   (Q,
    an_OBUF,
    D,
    clk_IBUF_BUFG);
  output [6:0]Q;
  output [3:0]an_OBUF;
  input [7:0]D;
  input clk_IBUF_BUFG;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]D;
  wire [6:0]Q;
  wire \an[1]_i_1_n_0 ;
  wire \an[3]_i_1_n_0 ;
  wire [3:0]an_OBUF;
  wire arm_down;
  wire arm_up;
  wire ccw;
  wire clk_IBUF_BUFG;
  wire clk_count;
  wire \clk_count[0]_i_1_n_0 ;
  wire \clk_count[1]_i_1_n_0 ;
  wire [15:0]clk_div;
  wire clk_div0_carry__0_n_0;
  wire clk_div0_carry__0_n_1;
  wire clk_div0_carry__0_n_2;
  wire clk_div0_carry__0_n_3;
  wire clk_div0_carry__0_n_4;
  wire clk_div0_carry__0_n_5;
  wire clk_div0_carry__0_n_6;
  wire clk_div0_carry__0_n_7;
  wire clk_div0_carry__1_n_0;
  wire clk_div0_carry__1_n_1;
  wire clk_div0_carry__1_n_2;
  wire clk_div0_carry__1_n_3;
  wire clk_div0_carry__1_n_4;
  wire clk_div0_carry__1_n_5;
  wire clk_div0_carry__1_n_6;
  wire clk_div0_carry__1_n_7;
  wire clk_div0_carry__2_n_2;
  wire clk_div0_carry__2_n_3;
  wire clk_div0_carry__2_n_5;
  wire clk_div0_carry__2_n_6;
  wire clk_div0_carry__2_n_7;
  wire clk_div0_carry_n_0;
  wire clk_div0_carry_n_1;
  wire clk_div0_carry_n_2;
  wire clk_div0_carry_n_3;
  wire clk_div0_carry_n_4;
  wire clk_div0_carry_n_5;
  wire clk_div0_carry_n_6;
  wire clk_div0_carry_n_7;
  wire \clk_div[0]_i_1_n_0 ;
  wire \clk_div[15]_i_2_n_0 ;
  wire \clk_div[15]_i_3_n_0 ;
  wire cw;
  wire load_line_down;
  wire load_line_up;
  wire \seg[0]_i_1_n_0 ;
  wire \seg[1]_i_1_n_0 ;
  wire \seg[2]_i_1_n_0 ;
  wire \seg[3]_i_1_n_0 ;
  wire \seg[4]_i_1_n_0 ;
  wire \seg[4]_i_2_n_0 ;
  wire \seg[4]_i_3_n_0 ;
  wire \seg[5]_i_1_n_0 ;
  wire \seg[5]_i_2_n_0 ;
  wire \seg[6]_i_1_n_0 ;
  wire [3:0]sel0__1;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h1)) 
    \an[1]_i_1 
       (.I0(sel0__1[2]),
        .O(\an[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \an[3]_i_1 
       (.I0(sel0__1[3]),
        .O(\an[3]_i_1_n_0 ));
  FDSE \an_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(sel0__1[2]),
        .Q(an_OBUF[0]),
        .S(sel0__1[3]));
  FDSE \an_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\an[1]_i_1_n_0 ),
        .Q(an_OBUF[1]),
        .S(sel0__1[3]));
  FDSE \an_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(sel0__1[2]),
        .Q(an_OBUF[2]),
        .S(\an[3]_i_1_n_0 ));
  FDSE \an_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\an[1]_i_1_n_0 ),
        .Q(an_OBUF[3]),
        .S(\an[3]_i_1_n_0 ));
  FDRE arm_down_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(arm_down),
        .R(\<const0> ));
  FDRE arm_up_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(arm_up),
        .R(\<const0> ));
  FDRE ccw_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[4]),
        .Q(ccw),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_count[0]_i_1 
       (.I0(clk_count),
        .I1(sel0__1[2]),
        .O(\clk_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \clk_count[1]_i_1 
       (.I0(sel0__1[2]),
        .I1(clk_count),
        .I2(sel0__1[3]),
        .O(\clk_count[1]_i_1_n_0 ));
  FDRE \clk_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\clk_count[0]_i_1_n_0 ),
        .Q(sel0__1[2]),
        .R(\<const0> ));
  FDRE \clk_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\clk_count[1]_i_1_n_0 ),
        .Q(sel0__1[3]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_div0_carry
       (.CI(\<const0> ),
        .CO({clk_div0_carry_n_0,clk_div0_carry_n_1,clk_div0_carry_n_2,clk_div0_carry_n_3}),
        .CYINIT(clk_div[0]),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({clk_div0_carry_n_4,clk_div0_carry_n_5,clk_div0_carry_n_6,clk_div0_carry_n_7}),
        .S(clk_div[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_div0_carry__0
       (.CI(clk_div0_carry_n_0),
        .CO({clk_div0_carry__0_n_0,clk_div0_carry__0_n_1,clk_div0_carry__0_n_2,clk_div0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({clk_div0_carry__0_n_4,clk_div0_carry__0_n_5,clk_div0_carry__0_n_6,clk_div0_carry__0_n_7}),
        .S(clk_div[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_div0_carry__1
       (.CI(clk_div0_carry__0_n_0),
        .CO({clk_div0_carry__1_n_0,clk_div0_carry__1_n_1,clk_div0_carry__1_n_2,clk_div0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({clk_div0_carry__1_n_4,clk_div0_carry__1_n_5,clk_div0_carry__1_n_6,clk_div0_carry__1_n_7}),
        .S(clk_div[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 clk_div0_carry__2
       (.CI(clk_div0_carry__1_n_0),
        .CO({clk_div0_carry__2_n_2,clk_div0_carry__2_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({clk_div0_carry__2_n_5,clk_div0_carry__2_n_6,clk_div0_carry__2_n_7}),
        .S({\<const0> ,clk_div[15:13]}));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_div[0]_i_1 
       (.I0(clk_div[0]),
        .O(\clk_div[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \clk_div[15]_i_1 
       (.I0(clk_div[13]),
        .I1(clk_div[14]),
        .I2(\clk_div[15]_i_2_n_0 ),
        .I3(clk_div[11]),
        .I4(clk_div[12]),
        .I5(clk_div[15]),
        .O(clk_count));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    \clk_div[15]_i_2 
       (.I0(clk_div[10]),
        .I1(clk_div[6]),
        .I2(\clk_div[15]_i_3_n_0 ),
        .I3(clk_div[7]),
        .I4(clk_div[8]),
        .I5(clk_div[9]),
        .O(\clk_div[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \clk_div[15]_i_3 
       (.I0(clk_div[4]),
        .I1(clk_div[2]),
        .I2(clk_div[1]),
        .I3(clk_div[0]),
        .I4(clk_div[3]),
        .I5(clk_div[5]),
        .O(\clk_div[15]_i_3_n_0 ));
  FDRE \clk_div_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\clk_div[0]_i_1_n_0 ),
        .Q(clk_div[0]),
        .R(clk_count));
  FDRE \clk_div_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__1_n_6),
        .Q(clk_div[10]),
        .R(clk_count));
  FDRE \clk_div_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__1_n_5),
        .Q(clk_div[11]),
        .R(clk_count));
  FDRE \clk_div_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__1_n_4),
        .Q(clk_div[12]),
        .R(clk_count));
  FDRE \clk_div_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__2_n_7),
        .Q(clk_div[13]),
        .R(clk_count));
  FDRE \clk_div_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__2_n_6),
        .Q(clk_div[14]),
        .R(clk_count));
  FDRE \clk_div_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__2_n_5),
        .Q(clk_div[15]),
        .R(clk_count));
  FDRE \clk_div_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry_n_7),
        .Q(clk_div[1]),
        .R(clk_count));
  FDRE \clk_div_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry_n_6),
        .Q(clk_div[2]),
        .R(clk_count));
  FDRE \clk_div_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry_n_5),
        .Q(clk_div[3]),
        .R(clk_count));
  FDRE \clk_div_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry_n_4),
        .Q(clk_div[4]),
        .R(clk_count));
  FDRE \clk_div_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__0_n_7),
        .Q(clk_div[5]),
        .R(clk_count));
  FDRE \clk_div_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__0_n_6),
        .Q(clk_div[6]),
        .R(clk_count));
  FDRE \clk_div_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__0_n_5),
        .Q(clk_div[7]),
        .R(clk_count));
  FDRE \clk_div_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__0_n_4),
        .Q(clk_div[8]),
        .R(clk_count));
  FDRE \clk_div_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(clk_div0_carry__1_n_7),
        .Q(clk_div[9]),
        .R(clk_count));
  FDRE cw_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[5]),
        .Q(cw),
        .R(\<const0> ));
  FDRE load_line_down_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(load_line_down),
        .R(\<const0> ));
  FDRE load_line_up_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(load_line_up),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h9FFF9F00)) 
    \seg[0]_i_1 
       (.I0(sel0__1[0]),
        .I1(sel0__1[1]),
        .I2(sel0__1[2]),
        .I3(sel0__1[3]),
        .I4(\seg[5]_i_2_n_0 ),
        .O(\seg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h45FF45AA45FF45FF)) 
    \seg[1]_i_1 
       (.I0(sel0__1[3]),
        .I1(arm_down),
        .I2(arm_up),
        .I3(sel0__1[2]),
        .I4(load_line_down),
        .I5(load_line_up),
        .O(\seg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h404FF0F0404FFFFF)) 
    \seg[2]_i_1 
       (.I0(sel0__1[1]),
        .I1(sel0__1[0]),
        .I2(sel0__1[3]),
        .I3(arm_down),
        .I4(sel0__1[2]),
        .I5(load_line_down),
        .O(\seg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h909FFFFF909F0000)) 
    \seg[3]_i_1 
       (.I0(sel0__1[1]),
        .I1(sel0__1[0]),
        .I2(sel0__1[2]),
        .I3(ccw),
        .I4(sel0__1[3]),
        .I5(\seg[4]_i_3_n_0 ),
        .O(\seg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h888BFFFF888B0000)) 
    \seg[4]_i_1 
       (.I0(\seg[4]_i_2_n_0 ),
        .I1(sel0__1[2]),
        .I2(cw),
        .I3(ccw),
        .I4(sel0__1[3]),
        .I5(\seg[4]_i_3_n_0 ),
        .O(\seg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \seg[4]_i_2 
       (.I0(sel0__1[1]),
        .I1(sel0__1[0]),
        .O(\seg[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \seg[4]_i_3 
       (.I0(arm_down),
        .I1(sel0__1[2]),
        .I2(load_line_down),
        .O(\seg[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h707FFFFF707F0000)) 
    \seg[5]_i_1 
       (.I0(sel0__1[0]),
        .I1(sel0__1[1]),
        .I2(sel0__1[2]),
        .I3(ccw),
        .I4(sel0__1[3]),
        .I5(\seg[5]_i_2_n_0 ),
        .O(\seg[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBFB0BFBF)) 
    \seg[5]_i_2 
       (.I0(arm_down),
        .I1(arm_up),
        .I2(sel0__1[2]),
        .I3(load_line_down),
        .I4(load_line_up),
        .O(\seg[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0D0D0DFD00000000)) 
    \seg[6]_i_1 
       (.I0(cw),
        .I1(ccw),
        .I2(sel0__1[2]),
        .I3(sel0__1[1]),
        .I4(sel0__1[0]),
        .I5(sel0__1[3]),
        .O(\seg[6]_i_1_n_0 ));
  FDRE \seg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(\<const0> ));
  FDRE \seg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(\<const0> ));
  FDRE \seg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(\<const0> ));
  FDRE \seg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(\<const0> ));
  FDRE \seg_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[4]_i_1_n_0 ),
        .Q(Q[4]),
        .R(\<const0> ));
  FDRE \seg_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(\<const0> ));
  FDRE \seg_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\seg[6]_i_1_n_0 ),
        .Q(Q[6]),
        .R(\<const0> ));
  FDRE \speed_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[6]),
        .Q(sel0__1[0]),
        .R(\<const0> ));
  FDRE \speed_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[7]),
        .Q(sel0__1[1]),
        .R(\<const0> ));
endmodule

module tcounter
   (\FSM_sequential_state_reg[1] ,
    done_reg_0,
    clk_IBUF_BUFG,
    rst_IBUF,
    \FSM_sequential_state_reg[1]_0 ,
    btn_up_IBUF,
    state,
    speed_up);
  output \FSM_sequential_state_reg[1] ;
  output done_reg_0;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input \FSM_sequential_state_reg[1]_0 ;
  input btn_up_IBUF;
  input [1:0]state;
  input speed_up;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire btn_up_IBUF;
  wire clk_IBUF_BUFG;
  wire \clk_count[0]_i_10_n_0 ;
  wire \clk_count[0]_i_11_n_0 ;
  wire \clk_count[0]_i_12_n_0 ;
  wire \clk_count[0]_i_13_n_0 ;
  wire \clk_count[0]_i_14_n_0 ;
  wire \clk_count[0]_i_15_n_0 ;
  wire \clk_count[0]_i_1_n_0 ;
  wire \clk_count[0]_i_3_n_0 ;
  wire \clk_count[0]_i_4_n_0 ;
  wire \clk_count[0]_i_5_n_0 ;
  wire \clk_count[0]_i_6_n_0 ;
  wire \clk_count[0]_i_8_n_0 ;
  wire \clk_count[0]_i_9_n_0 ;
  wire \clk_count[12]_i_2_n_0 ;
  wire \clk_count[12]_i_3_n_0 ;
  wire \clk_count[12]_i_4_n_0 ;
  wire \clk_count[12]_i_5_n_0 ;
  wire \clk_count[16]_i_2_n_0 ;
  wire \clk_count[16]_i_3_n_0 ;
  wire \clk_count[16]_i_4_n_0 ;
  wire \clk_count[16]_i_5_n_0 ;
  wire \clk_count[20]_i_2_n_0 ;
  wire \clk_count[20]_i_3_n_0 ;
  wire \clk_count[20]_i_4_n_0 ;
  wire \clk_count[20]_i_5_n_0 ;
  wire \clk_count[24]_i_2_n_0 ;
  wire \clk_count[24]_i_3_n_0 ;
  wire \clk_count[24]_i_4_n_0 ;
  wire \clk_count[24]_i_5_n_0 ;
  wire \clk_count[28]_i_2_n_0 ;
  wire \clk_count[28]_i_3_n_0 ;
  wire \clk_count[28]_i_4_n_0 ;
  wire \clk_count[28]_i_5_n_0 ;
  wire \clk_count[4]_i_2_n_0 ;
  wire \clk_count[4]_i_3_n_0 ;
  wire \clk_count[4]_i_4_n_0 ;
  wire \clk_count[4]_i_5_n_0 ;
  wire \clk_count[8]_i_2_n_0 ;
  wire \clk_count[8]_i_3_n_0 ;
  wire \clk_count[8]_i_4_n_0 ;
  wire \clk_count[8]_i_5_n_0 ;
  wire \clk_count_reg[0]_i_2_n_0 ;
  wire \clk_count_reg[0]_i_2_n_1 ;
  wire \clk_count_reg[0]_i_2_n_2 ;
  wire \clk_count_reg[0]_i_2_n_3 ;
  wire \clk_count_reg[0]_i_2_n_4 ;
  wire \clk_count_reg[0]_i_2_n_5 ;
  wire \clk_count_reg[0]_i_2_n_6 ;
  wire \clk_count_reg[0]_i_2_n_7 ;
  wire \clk_count_reg[12]_i_1_n_0 ;
  wire \clk_count_reg[12]_i_1_n_1 ;
  wire \clk_count_reg[12]_i_1_n_2 ;
  wire \clk_count_reg[12]_i_1_n_3 ;
  wire \clk_count_reg[12]_i_1_n_4 ;
  wire \clk_count_reg[12]_i_1_n_5 ;
  wire \clk_count_reg[12]_i_1_n_6 ;
  wire \clk_count_reg[12]_i_1_n_7 ;
  wire \clk_count_reg[16]_i_1_n_0 ;
  wire \clk_count_reg[16]_i_1_n_1 ;
  wire \clk_count_reg[16]_i_1_n_2 ;
  wire \clk_count_reg[16]_i_1_n_3 ;
  wire \clk_count_reg[16]_i_1_n_4 ;
  wire \clk_count_reg[16]_i_1_n_5 ;
  wire \clk_count_reg[16]_i_1_n_6 ;
  wire \clk_count_reg[16]_i_1_n_7 ;
  wire \clk_count_reg[20]_i_1_n_0 ;
  wire \clk_count_reg[20]_i_1_n_1 ;
  wire \clk_count_reg[20]_i_1_n_2 ;
  wire \clk_count_reg[20]_i_1_n_3 ;
  wire \clk_count_reg[20]_i_1_n_4 ;
  wire \clk_count_reg[20]_i_1_n_5 ;
  wire \clk_count_reg[20]_i_1_n_6 ;
  wire \clk_count_reg[20]_i_1_n_7 ;
  wire \clk_count_reg[24]_i_1_n_0 ;
  wire \clk_count_reg[24]_i_1_n_1 ;
  wire \clk_count_reg[24]_i_1_n_2 ;
  wire \clk_count_reg[24]_i_1_n_3 ;
  wire \clk_count_reg[24]_i_1_n_4 ;
  wire \clk_count_reg[24]_i_1_n_5 ;
  wire \clk_count_reg[24]_i_1_n_6 ;
  wire \clk_count_reg[24]_i_1_n_7 ;
  wire \clk_count_reg[28]_i_1_n_1 ;
  wire \clk_count_reg[28]_i_1_n_2 ;
  wire \clk_count_reg[28]_i_1_n_3 ;
  wire \clk_count_reg[28]_i_1_n_4 ;
  wire \clk_count_reg[28]_i_1_n_5 ;
  wire \clk_count_reg[28]_i_1_n_6 ;
  wire \clk_count_reg[28]_i_1_n_7 ;
  wire \clk_count_reg[4]_i_1_n_0 ;
  wire \clk_count_reg[4]_i_1_n_1 ;
  wire \clk_count_reg[4]_i_1_n_2 ;
  wire \clk_count_reg[4]_i_1_n_3 ;
  wire \clk_count_reg[4]_i_1_n_4 ;
  wire \clk_count_reg[4]_i_1_n_5 ;
  wire \clk_count_reg[4]_i_1_n_6 ;
  wire \clk_count_reg[4]_i_1_n_7 ;
  wire \clk_count_reg[8]_i_1_n_0 ;
  wire \clk_count_reg[8]_i_1_n_1 ;
  wire \clk_count_reg[8]_i_1_n_2 ;
  wire \clk_count_reg[8]_i_1_n_3 ;
  wire \clk_count_reg[8]_i_1_n_4 ;
  wire \clk_count_reg[8]_i_1_n_5 ;
  wire \clk_count_reg[8]_i_1_n_6 ;
  wire \clk_count_reg[8]_i_1_n_7 ;
  wire done_i_1_n_0;
  wire done_reg_0;
  wire p_1_in;
  wire rst_IBUF;
  wire [31:0]sel0;
  wire speed_up;
  wire [1:0]state;
  wire t;

  LUT5 #(
    .INIT(32'hFF0ADD00)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(t),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .I2(btn_up_IBUF),
        .I3(state[1]),
        .I4(state[0]),
        .O(done_reg_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'hFF001000)) 
    btn_db_i_1
       (.I0(btn_up_IBUF),
        .I1(state[1]),
        .I2(t),
        .I3(state[0]),
        .I4(speed_up),
        .O(\FSM_sequential_state_reg[1] ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \clk_count[0]_i_1 
       (.I0(\clk_count[0]_i_3_n_0 ),
        .I1(\clk_count[0]_i_4_n_0 ),
        .I2(\clk_count[0]_i_5_n_0 ),
        .I3(\clk_count[0]_i_6_n_0 ),
        .I4(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_10 
       (.I0(sel0[1]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \clk_count[0]_i_11 
       (.I0(sel0[0]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_12 
       (.I0(sel0[22]),
        .I1(sel0[19]),
        .I2(sel0[7]),
        .I3(sel0[0]),
        .O(\clk_count[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_13 
       (.I0(sel0[31]),
        .I1(sel0[12]),
        .I2(sel0[28]),
        .I3(sel0[1]),
        .O(\clk_count[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_14 
       (.I0(sel0[30]),
        .I1(sel0[4]),
        .I2(sel0[29]),
        .I3(sel0[27]),
        .O(\clk_count[0]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \clk_count[0]_i_15 
       (.I0(sel0[6]),
        .I1(sel0[2]),
        .I2(sel0[21]),
        .I3(sel0[18]),
        .O(\clk_count[0]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \clk_count[0]_i_3 
       (.I0(sel0[10]),
        .I1(sel0[13]),
        .I2(sel0[14]),
        .I3(sel0[5]),
        .I4(\clk_count[0]_i_12_n_0 ),
        .O(\clk_count[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \clk_count[0]_i_4 
       (.I0(sel0[20]),
        .I1(sel0[23]),
        .I2(sel0[16]),
        .I3(sel0[17]),
        .I4(\clk_count[0]_i_13_n_0 ),
        .O(\clk_count[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_count[0]_i_5 
       (.I0(sel0[9]),
        .I1(sel0[15]),
        .I2(sel0[24]),
        .I3(sel0[25]),
        .I4(\clk_count[0]_i_14_n_0 ),
        .O(\clk_count[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_count[0]_i_6 
       (.I0(sel0[8]),
        .I1(sel0[11]),
        .I2(sel0[3]),
        .I3(sel0[26]),
        .I4(\clk_count[0]_i_15_n_0 ),
        .O(\clk_count[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_count[0]_i_7 
       (.I0(\FSM_sequential_state_reg[1]_0 ),
        .O(p_1_in));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_8 
       (.I0(sel0[3]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_9 
       (.I0(sel0[2]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_2 
       (.I0(sel0[15]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_3 
       (.I0(sel0[14]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_4 
       (.I0(sel0[13]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_5 
       (.I0(sel0[12]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_2 
       (.I0(sel0[19]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_3 
       (.I0(sel0[18]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_4 
       (.I0(sel0[17]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_5 
       (.I0(sel0[16]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_2 
       (.I0(sel0[23]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_3 
       (.I0(sel0[22]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_4 
       (.I0(sel0[21]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_5 
       (.I0(sel0[20]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_2 
       (.I0(sel0[27]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_3 
       (.I0(sel0[26]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_4 
       (.I0(sel0[25]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_5 
       (.I0(sel0[24]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_2 
       (.I0(sel0[31]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_3 
       (.I0(sel0[30]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_4 
       (.I0(sel0[29]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_5 
       (.I0(sel0[28]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_2 
       (.I0(sel0[7]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_3 
       (.I0(sel0[6]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_4 
       (.I0(sel0[5]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_5 
       (.I0(sel0[4]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_2 
       (.I0(sel0[11]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_3 
       (.I0(sel0[10]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_4 
       (.I0(sel0[9]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_5 
       (.I0(sel0[8]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2_n_7 ),
        .Q(sel0[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\clk_count_reg[0]_i_2_n_0 ,\clk_count_reg[0]_i_2_n_1 ,\clk_count_reg[0]_i_2_n_2 ,\clk_count_reg[0]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,p_1_in}),
        .O({\clk_count_reg[0]_i_2_n_4 ,\clk_count_reg[0]_i_2_n_5 ,\clk_count_reg[0]_i_2_n_6 ,\clk_count_reg[0]_i_2_n_7 }),
        .S({\clk_count[0]_i_8_n_0 ,\clk_count[0]_i_9_n_0 ,\clk_count[0]_i_10_n_0 ,\clk_count[0]_i_11_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1_n_5 ),
        .Q(sel0[10]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1_n_4 ),
        .Q(sel0[11]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1_n_7 ),
        .Q(sel0[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[12]_i_1 
       (.CI(\clk_count_reg[8]_i_1_n_0 ),
        .CO({\clk_count_reg[12]_i_1_n_0 ,\clk_count_reg[12]_i_1_n_1 ,\clk_count_reg[12]_i_1_n_2 ,\clk_count_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[12]_i_1_n_4 ,\clk_count_reg[12]_i_1_n_5 ,\clk_count_reg[12]_i_1_n_6 ,\clk_count_reg[12]_i_1_n_7 }),
        .S({\clk_count[12]_i_2_n_0 ,\clk_count[12]_i_3_n_0 ,\clk_count[12]_i_4_n_0 ,\clk_count[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1_n_6 ),
        .Q(sel0[13]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1_n_5 ),
        .Q(sel0[14]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1_n_4 ),
        .Q(sel0[15]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1_n_7 ),
        .Q(sel0[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[16]_i_1 
       (.CI(\clk_count_reg[12]_i_1_n_0 ),
        .CO({\clk_count_reg[16]_i_1_n_0 ,\clk_count_reg[16]_i_1_n_1 ,\clk_count_reg[16]_i_1_n_2 ,\clk_count_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[16]_i_1_n_4 ,\clk_count_reg[16]_i_1_n_5 ,\clk_count_reg[16]_i_1_n_6 ,\clk_count_reg[16]_i_1_n_7 }),
        .S({\clk_count[16]_i_2_n_0 ,\clk_count[16]_i_3_n_0 ,\clk_count[16]_i_4_n_0 ,\clk_count[16]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1_n_6 ),
        .Q(sel0[17]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1_n_5 ),
        .Q(sel0[18]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1_n_4 ),
        .Q(sel0[19]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2_n_6 ),
        .Q(sel0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1_n_7 ),
        .Q(sel0[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[20]_i_1 
       (.CI(\clk_count_reg[16]_i_1_n_0 ),
        .CO({\clk_count_reg[20]_i_1_n_0 ,\clk_count_reg[20]_i_1_n_1 ,\clk_count_reg[20]_i_1_n_2 ,\clk_count_reg[20]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[20]_i_1_n_4 ,\clk_count_reg[20]_i_1_n_5 ,\clk_count_reg[20]_i_1_n_6 ,\clk_count_reg[20]_i_1_n_7 }),
        .S({\clk_count[20]_i_2_n_0 ,\clk_count[20]_i_3_n_0 ,\clk_count[20]_i_4_n_0 ,\clk_count[20]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1_n_6 ),
        .Q(sel0[21]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1_n_5 ),
        .Q(sel0[22]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1_n_4 ),
        .Q(sel0[23]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1_n_7 ),
        .Q(sel0[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[24]_i_1 
       (.CI(\clk_count_reg[20]_i_1_n_0 ),
        .CO({\clk_count_reg[24]_i_1_n_0 ,\clk_count_reg[24]_i_1_n_1 ,\clk_count_reg[24]_i_1_n_2 ,\clk_count_reg[24]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[24]_i_1_n_4 ,\clk_count_reg[24]_i_1_n_5 ,\clk_count_reg[24]_i_1_n_6 ,\clk_count_reg[24]_i_1_n_7 }),
        .S({\clk_count[24]_i_2_n_0 ,\clk_count[24]_i_3_n_0 ,\clk_count[24]_i_4_n_0 ,\clk_count[24]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1_n_6 ),
        .Q(sel0[25]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1_n_5 ),
        .Q(sel0[26]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1_n_4 ),
        .Q(sel0[27]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1_n_7 ),
        .Q(sel0[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[28]_i_1 
       (.CI(\clk_count_reg[24]_i_1_n_0 ),
        .CO({\clk_count_reg[28]_i_1_n_1 ,\clk_count_reg[28]_i_1_n_2 ,\clk_count_reg[28]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[28]_i_1_n_4 ,\clk_count_reg[28]_i_1_n_5 ,\clk_count_reg[28]_i_1_n_6 ,\clk_count_reg[28]_i_1_n_7 }),
        .S({\clk_count[28]_i_2_n_0 ,\clk_count[28]_i_3_n_0 ,\clk_count[28]_i_4_n_0 ,\clk_count[28]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1_n_6 ),
        .Q(sel0[29]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2_n_5 ),
        .Q(sel0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1_n_5 ),
        .Q(sel0[30]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1_n_4 ),
        .Q(sel0[31]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2_n_4 ),
        .Q(sel0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1_n_7 ),
        .Q(sel0[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[4]_i_1 
       (.CI(\clk_count_reg[0]_i_2_n_0 ),
        .CO({\clk_count_reg[4]_i_1_n_0 ,\clk_count_reg[4]_i_1_n_1 ,\clk_count_reg[4]_i_1_n_2 ,\clk_count_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[4]_i_1_n_4 ,\clk_count_reg[4]_i_1_n_5 ,\clk_count_reg[4]_i_1_n_6 ,\clk_count_reg[4]_i_1_n_7 }),
        .S({\clk_count[4]_i_2_n_0 ,\clk_count[4]_i_3_n_0 ,\clk_count[4]_i_4_n_0 ,\clk_count[4]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1_n_6 ),
        .Q(sel0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1_n_5 ),
        .Q(sel0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1_n_4 ),
        .Q(sel0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1_n_7 ),
        .Q(sel0[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[8]_i_1 
       (.CI(\clk_count_reg[4]_i_1_n_0 ),
        .CO({\clk_count_reg[8]_i_1_n_0 ,\clk_count_reg[8]_i_1_n_1 ,\clk_count_reg[8]_i_1_n_2 ,\clk_count_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[8]_i_1_n_4 ,\clk_count_reg[8]_i_1_n_5 ,\clk_count_reg[8]_i_1_n_6 ,\clk_count_reg[8]_i_1_n_7 }),
        .S({\clk_count[8]_i_2_n_0 ,\clk_count[8]_i_3_n_0 ,\clk_count[8]_i_4_n_0 ,\clk_count[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1_n_6 ),
        .Q(sel0[9]));
  LUT6 #(
    .INIT(64'h0000FFFF00000004)) 
    done_i_1
       (.I0(\clk_count[0]_i_3_n_0 ),
        .I1(\clk_count[0]_i_4_n_0 ),
        .I2(\clk_count[0]_i_5_n_0 ),
        .I3(\clk_count[0]_i_6_n_0 ),
        .I4(\FSM_sequential_state_reg[1]_0 ),
        .I5(t),
        .O(done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(done_i_1_n_0),
        .Q(t));
endmodule

(* ORIG_REF_NAME = "tcounter" *) 
module tcounter_1
   (\FSM_sequential_state_reg[1] ,
    done_reg_0,
    clk_IBUF_BUFG,
    rst_IBUF,
    \FSM_sequential_state_reg[1]_0 ,
    btn_dn_IBUF,
    state,
    speed_dn);
  output \FSM_sequential_state_reg[1] ;
  output done_reg_0;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input \FSM_sequential_state_reg[1]_0 ;
  input btn_dn_IBUF;
  input [1:0]state;
  input speed_dn;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire btn_dn_IBUF;
  wire clk_IBUF_BUFG;
  wire \clk_count[0]_i_10__0_n_0 ;
  wire \clk_count[0]_i_11__0_n_0 ;
  wire \clk_count[0]_i_12__0_n_0 ;
  wire \clk_count[0]_i_13__0_n_0 ;
  wire \clk_count[0]_i_14__0_n_0 ;
  wire \clk_count[0]_i_15__0_n_0 ;
  wire \clk_count[0]_i_1__0_n_0 ;
  wire \clk_count[0]_i_3__0_n_0 ;
  wire \clk_count[0]_i_4__0_n_0 ;
  wire \clk_count[0]_i_5__0_n_0 ;
  wire \clk_count[0]_i_6__0_n_0 ;
  wire \clk_count[0]_i_7__0_n_0 ;
  wire \clk_count[0]_i_8__0_n_0 ;
  wire \clk_count[0]_i_9__0_n_0 ;
  wire \clk_count[12]_i_2__0_n_0 ;
  wire \clk_count[12]_i_3__0_n_0 ;
  wire \clk_count[12]_i_4__0_n_0 ;
  wire \clk_count[12]_i_5__0_n_0 ;
  wire \clk_count[16]_i_2__0_n_0 ;
  wire \clk_count[16]_i_3__0_n_0 ;
  wire \clk_count[16]_i_4__0_n_0 ;
  wire \clk_count[16]_i_5__0_n_0 ;
  wire \clk_count[20]_i_2__0_n_0 ;
  wire \clk_count[20]_i_3__0_n_0 ;
  wire \clk_count[20]_i_4__0_n_0 ;
  wire \clk_count[20]_i_5__0_n_0 ;
  wire \clk_count[24]_i_2__0_n_0 ;
  wire \clk_count[24]_i_3__0_n_0 ;
  wire \clk_count[24]_i_4__0_n_0 ;
  wire \clk_count[24]_i_5__0_n_0 ;
  wire \clk_count[28]_i_2__0_n_0 ;
  wire \clk_count[28]_i_3__0_n_0 ;
  wire \clk_count[28]_i_4__0_n_0 ;
  wire \clk_count[28]_i_5__0_n_0 ;
  wire \clk_count[4]_i_2__0_n_0 ;
  wire \clk_count[4]_i_3__0_n_0 ;
  wire \clk_count[4]_i_4__0_n_0 ;
  wire \clk_count[4]_i_5__0_n_0 ;
  wire \clk_count[8]_i_2__0_n_0 ;
  wire \clk_count[8]_i_3__0_n_0 ;
  wire \clk_count[8]_i_4__0_n_0 ;
  wire \clk_count[8]_i_5__0_n_0 ;
  wire \clk_count_reg[0]_i_2__0_n_0 ;
  wire \clk_count_reg[0]_i_2__0_n_1 ;
  wire \clk_count_reg[0]_i_2__0_n_2 ;
  wire \clk_count_reg[0]_i_2__0_n_3 ;
  wire \clk_count_reg[0]_i_2__0_n_4 ;
  wire \clk_count_reg[0]_i_2__0_n_5 ;
  wire \clk_count_reg[0]_i_2__0_n_6 ;
  wire \clk_count_reg[0]_i_2__0_n_7 ;
  wire \clk_count_reg[12]_i_1__0_n_0 ;
  wire \clk_count_reg[12]_i_1__0_n_1 ;
  wire \clk_count_reg[12]_i_1__0_n_2 ;
  wire \clk_count_reg[12]_i_1__0_n_3 ;
  wire \clk_count_reg[12]_i_1__0_n_4 ;
  wire \clk_count_reg[12]_i_1__0_n_5 ;
  wire \clk_count_reg[12]_i_1__0_n_6 ;
  wire \clk_count_reg[12]_i_1__0_n_7 ;
  wire \clk_count_reg[16]_i_1__0_n_0 ;
  wire \clk_count_reg[16]_i_1__0_n_1 ;
  wire \clk_count_reg[16]_i_1__0_n_2 ;
  wire \clk_count_reg[16]_i_1__0_n_3 ;
  wire \clk_count_reg[16]_i_1__0_n_4 ;
  wire \clk_count_reg[16]_i_1__0_n_5 ;
  wire \clk_count_reg[16]_i_1__0_n_6 ;
  wire \clk_count_reg[16]_i_1__0_n_7 ;
  wire \clk_count_reg[20]_i_1__0_n_0 ;
  wire \clk_count_reg[20]_i_1__0_n_1 ;
  wire \clk_count_reg[20]_i_1__0_n_2 ;
  wire \clk_count_reg[20]_i_1__0_n_3 ;
  wire \clk_count_reg[20]_i_1__0_n_4 ;
  wire \clk_count_reg[20]_i_1__0_n_5 ;
  wire \clk_count_reg[20]_i_1__0_n_6 ;
  wire \clk_count_reg[20]_i_1__0_n_7 ;
  wire \clk_count_reg[24]_i_1__0_n_0 ;
  wire \clk_count_reg[24]_i_1__0_n_1 ;
  wire \clk_count_reg[24]_i_1__0_n_2 ;
  wire \clk_count_reg[24]_i_1__0_n_3 ;
  wire \clk_count_reg[24]_i_1__0_n_4 ;
  wire \clk_count_reg[24]_i_1__0_n_5 ;
  wire \clk_count_reg[24]_i_1__0_n_6 ;
  wire \clk_count_reg[24]_i_1__0_n_7 ;
  wire \clk_count_reg[28]_i_1__0_n_1 ;
  wire \clk_count_reg[28]_i_1__0_n_2 ;
  wire \clk_count_reg[28]_i_1__0_n_3 ;
  wire \clk_count_reg[28]_i_1__0_n_4 ;
  wire \clk_count_reg[28]_i_1__0_n_5 ;
  wire \clk_count_reg[28]_i_1__0_n_6 ;
  wire \clk_count_reg[28]_i_1__0_n_7 ;
  wire \clk_count_reg[4]_i_1__0_n_0 ;
  wire \clk_count_reg[4]_i_1__0_n_1 ;
  wire \clk_count_reg[4]_i_1__0_n_2 ;
  wire \clk_count_reg[4]_i_1__0_n_3 ;
  wire \clk_count_reg[4]_i_1__0_n_4 ;
  wire \clk_count_reg[4]_i_1__0_n_5 ;
  wire \clk_count_reg[4]_i_1__0_n_6 ;
  wire \clk_count_reg[4]_i_1__0_n_7 ;
  wire \clk_count_reg[8]_i_1__0_n_0 ;
  wire \clk_count_reg[8]_i_1__0_n_1 ;
  wire \clk_count_reg[8]_i_1__0_n_2 ;
  wire \clk_count_reg[8]_i_1__0_n_3 ;
  wire \clk_count_reg[8]_i_1__0_n_4 ;
  wire \clk_count_reg[8]_i_1__0_n_5 ;
  wire \clk_count_reg[8]_i_1__0_n_6 ;
  wire \clk_count_reg[8]_i_1__0_n_7 ;
  wire done_i_1__0_n_0;
  wire done_reg_0;
  wire rst_IBUF;
  wire [31:0]sel0__0;
  wire speed_dn;
  wire [1:0]state;
  wire t;

  LUT5 #(
    .INIT(32'hFF0ADD00)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(t),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .I2(btn_dn_IBUF),
        .I3(state[1]),
        .I4(state[0]),
        .O(done_reg_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'hFF001000)) 
    btn_db_i_1__0
       (.I0(btn_dn_IBUF),
        .I1(state[1]),
        .I2(t),
        .I3(state[0]),
        .I4(speed_dn),
        .O(\FSM_sequential_state_reg[1] ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_10__0 
       (.I0(sel0__0[1]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \clk_count[0]_i_11__0 
       (.I0(sel0__0[0]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_11__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_12__0 
       (.I0(sel0__0[28]),
        .I1(sel0__0[1]),
        .I2(sel0__0[7]),
        .I3(sel0__0[0]),
        .O(\clk_count[0]_i_12__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_13__0 
       (.I0(sel0__0[17]),
        .I1(sel0__0[14]),
        .I2(sel0__0[23]),
        .I3(sel0__0[20]),
        .O(\clk_count[0]_i_13__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_14__0 
       (.I0(sel0__0[30]),
        .I1(sel0__0[25]),
        .I2(sel0__0[4]),
        .I3(sel0__0[3]),
        .O(\clk_count[0]_i_14__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \clk_count[0]_i_15__0 
       (.I0(sel0__0[2]),
        .I1(sel0__0[24]),
        .I2(sel0__0[18]),
        .I3(sel0__0[13]),
        .O(\clk_count[0]_i_15__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \clk_count[0]_i_1__0 
       (.I0(\clk_count[0]_i_3__0_n_0 ),
        .I1(\clk_count[0]_i_4__0_n_0 ),
        .I2(\clk_count[0]_i_5__0_n_0 ),
        .I3(\clk_count[0]_i_6__0_n_0 ),
        .I4(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \clk_count[0]_i_3__0 
       (.I0(sel0__0[8]),
        .I1(sel0__0[15]),
        .I2(sel0__0[12]),
        .I3(sel0__0[5]),
        .I4(\clk_count[0]_i_12__0_n_0 ),
        .O(\clk_count[0]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \clk_count[0]_i_4__0 
       (.I0(sel0__0[10]),
        .I1(sel0__0[31]),
        .I2(sel0__0[9]),
        .I3(sel0__0[11]),
        .I4(\clk_count[0]_i_13__0_n_0 ),
        .O(\clk_count[0]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_count[0]_i_5__0 
       (.I0(sel0__0[16]),
        .I1(sel0__0[19]),
        .I2(sel0__0[26]),
        .I3(sel0__0[27]),
        .I4(\clk_count[0]_i_14__0_n_0 ),
        .O(\clk_count[0]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \clk_count[0]_i_6__0 
       (.I0(sel0__0[21]),
        .I1(sel0__0[22]),
        .I2(sel0__0[29]),
        .I3(sel0__0[6]),
        .I4(\clk_count[0]_i_15__0_n_0 ),
        .O(\clk_count[0]_i_6__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_count[0]_i_7__0 
       (.I0(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_8__0 
       (.I0(sel0__0[3]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_9__0 
       (.I0(sel0__0[2]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[0]_i_9__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_2__0 
       (.I0(sel0__0[15]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_3__0 
       (.I0(sel0__0[14]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_4__0 
       (.I0(sel0__0[13]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[12]_i_5__0 
       (.I0(sel0__0[12]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[12]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_2__0 
       (.I0(sel0__0[19]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_3__0 
       (.I0(sel0__0[18]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_4__0 
       (.I0(sel0__0[17]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[16]_i_5__0 
       (.I0(sel0__0[16]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[16]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_2__0 
       (.I0(sel0__0[23]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_3__0 
       (.I0(sel0__0[22]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_4__0 
       (.I0(sel0__0[21]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[20]_i_5__0 
       (.I0(sel0__0[20]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[20]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_2__0 
       (.I0(sel0__0[27]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_3__0 
       (.I0(sel0__0[26]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_4__0 
       (.I0(sel0__0[25]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[24]_i_5__0 
       (.I0(sel0__0[24]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[24]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_2__0 
       (.I0(sel0__0[31]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_3__0 
       (.I0(sel0__0[30]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_4__0 
       (.I0(sel0__0[29]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[28]_i_5__0 
       (.I0(sel0__0[28]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[28]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_2__0 
       (.I0(sel0__0[7]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_3__0 
       (.I0(sel0__0[6]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_4__0 
       (.I0(sel0__0[5]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[4]_i_5__0 
       (.I0(sel0__0[4]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[4]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_2__0 
       (.I0(sel0__0[11]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_3__0 
       (.I0(sel0__0[10]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_4__0 
       (.I0(sel0__0[9]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[8]_i_5__0 
       (.I0(sel0__0[8]),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .O(\clk_count[8]_i_5__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2__0_n_7 ),
        .Q(sel0__0[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[0]_i_2__0 
       (.CI(\<const0> ),
        .CO({\clk_count_reg[0]_i_2__0_n_0 ,\clk_count_reg[0]_i_2__0_n_1 ,\clk_count_reg[0]_i_2__0_n_2 ,\clk_count_reg[0]_i_2__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\clk_count[0]_i_7__0_n_0 }),
        .O({\clk_count_reg[0]_i_2__0_n_4 ,\clk_count_reg[0]_i_2__0_n_5 ,\clk_count_reg[0]_i_2__0_n_6 ,\clk_count_reg[0]_i_2__0_n_7 }),
        .S({\clk_count[0]_i_8__0_n_0 ,\clk_count[0]_i_9__0_n_0 ,\clk_count[0]_i_10__0_n_0 ,\clk_count[0]_i_11__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1__0_n_5 ),
        .Q(sel0__0[10]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1__0_n_4 ),
        .Q(sel0__0[11]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1__0_n_7 ),
        .Q(sel0__0[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[12]_i_1__0 
       (.CI(\clk_count_reg[8]_i_1__0_n_0 ),
        .CO({\clk_count_reg[12]_i_1__0_n_0 ,\clk_count_reg[12]_i_1__0_n_1 ,\clk_count_reg[12]_i_1__0_n_2 ,\clk_count_reg[12]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[12]_i_1__0_n_4 ,\clk_count_reg[12]_i_1__0_n_5 ,\clk_count_reg[12]_i_1__0_n_6 ,\clk_count_reg[12]_i_1__0_n_7 }),
        .S({\clk_count[12]_i_2__0_n_0 ,\clk_count[12]_i_3__0_n_0 ,\clk_count[12]_i_4__0_n_0 ,\clk_count[12]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1__0_n_6 ),
        .Q(sel0__0[13]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1__0_n_5 ),
        .Q(sel0__0[14]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[12]_i_1__0_n_4 ),
        .Q(sel0__0[15]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1__0_n_7 ),
        .Q(sel0__0[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[16]_i_1__0 
       (.CI(\clk_count_reg[12]_i_1__0_n_0 ),
        .CO({\clk_count_reg[16]_i_1__0_n_0 ,\clk_count_reg[16]_i_1__0_n_1 ,\clk_count_reg[16]_i_1__0_n_2 ,\clk_count_reg[16]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[16]_i_1__0_n_4 ,\clk_count_reg[16]_i_1__0_n_5 ,\clk_count_reg[16]_i_1__0_n_6 ,\clk_count_reg[16]_i_1__0_n_7 }),
        .S({\clk_count[16]_i_2__0_n_0 ,\clk_count[16]_i_3__0_n_0 ,\clk_count[16]_i_4__0_n_0 ,\clk_count[16]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1__0_n_6 ),
        .Q(sel0__0[17]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1__0_n_5 ),
        .Q(sel0__0[18]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[16]_i_1__0_n_4 ),
        .Q(sel0__0[19]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2__0_n_6 ),
        .Q(sel0__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1__0_n_7 ),
        .Q(sel0__0[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[20]_i_1__0 
       (.CI(\clk_count_reg[16]_i_1__0_n_0 ),
        .CO({\clk_count_reg[20]_i_1__0_n_0 ,\clk_count_reg[20]_i_1__0_n_1 ,\clk_count_reg[20]_i_1__0_n_2 ,\clk_count_reg[20]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[20]_i_1__0_n_4 ,\clk_count_reg[20]_i_1__0_n_5 ,\clk_count_reg[20]_i_1__0_n_6 ,\clk_count_reg[20]_i_1__0_n_7 }),
        .S({\clk_count[20]_i_2__0_n_0 ,\clk_count[20]_i_3__0_n_0 ,\clk_count[20]_i_4__0_n_0 ,\clk_count[20]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1__0_n_6 ),
        .Q(sel0__0[21]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1__0_n_5 ),
        .Q(sel0__0[22]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[20]_i_1__0_n_4 ),
        .Q(sel0__0[23]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1__0_n_7 ),
        .Q(sel0__0[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[24]_i_1__0 
       (.CI(\clk_count_reg[20]_i_1__0_n_0 ),
        .CO({\clk_count_reg[24]_i_1__0_n_0 ,\clk_count_reg[24]_i_1__0_n_1 ,\clk_count_reg[24]_i_1__0_n_2 ,\clk_count_reg[24]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[24]_i_1__0_n_4 ,\clk_count_reg[24]_i_1__0_n_5 ,\clk_count_reg[24]_i_1__0_n_6 ,\clk_count_reg[24]_i_1__0_n_7 }),
        .S({\clk_count[24]_i_2__0_n_0 ,\clk_count[24]_i_3__0_n_0 ,\clk_count[24]_i_4__0_n_0 ,\clk_count[24]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1__0_n_6 ),
        .Q(sel0__0[25]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1__0_n_5 ),
        .Q(sel0__0[26]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[24]_i_1__0_n_4 ),
        .Q(sel0__0[27]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1__0_n_7 ),
        .Q(sel0__0[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[28]_i_1__0 
       (.CI(\clk_count_reg[24]_i_1__0_n_0 ),
        .CO({\clk_count_reg[28]_i_1__0_n_1 ,\clk_count_reg[28]_i_1__0_n_2 ,\clk_count_reg[28]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[28]_i_1__0_n_4 ,\clk_count_reg[28]_i_1__0_n_5 ,\clk_count_reg[28]_i_1__0_n_6 ,\clk_count_reg[28]_i_1__0_n_7 }),
        .S({\clk_count[28]_i_2__0_n_0 ,\clk_count[28]_i_3__0_n_0 ,\clk_count[28]_i_4__0_n_0 ,\clk_count[28]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1__0_n_6 ),
        .Q(sel0__0[29]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2__0_n_5 ),
        .Q(sel0__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1__0_n_5 ),
        .Q(sel0__0[30]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[28]_i_1__0_n_4 ),
        .Q(sel0__0[31]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[0]_i_2__0_n_4 ),
        .Q(sel0__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1__0_n_7 ),
        .Q(sel0__0[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[4]_i_1__0 
       (.CI(\clk_count_reg[0]_i_2__0_n_0 ),
        .CO({\clk_count_reg[4]_i_1__0_n_0 ,\clk_count_reg[4]_i_1__0_n_1 ,\clk_count_reg[4]_i_1__0_n_2 ,\clk_count_reg[4]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[4]_i_1__0_n_4 ,\clk_count_reg[4]_i_1__0_n_5 ,\clk_count_reg[4]_i_1__0_n_6 ,\clk_count_reg[4]_i_1__0_n_7 }),
        .S({\clk_count[4]_i_2__0_n_0 ,\clk_count[4]_i_3__0_n_0 ,\clk_count[4]_i_4__0_n_0 ,\clk_count[4]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1__0_n_6 ),
        .Q(sel0__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1__0_n_5 ),
        .Q(sel0__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[4]_i_1__0_n_4 ),
        .Q(sel0__0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1__0_n_7 ),
        .Q(sel0__0[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[8]_i_1__0 
       (.CI(\clk_count_reg[4]_i_1__0_n_0 ),
        .CO({\clk_count_reg[8]_i_1__0_n_0 ,\clk_count_reg[8]_i_1__0_n_1 ,\clk_count_reg[8]_i_1__0_n_2 ,\clk_count_reg[8]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\clk_count_reg[8]_i_1__0_n_4 ,\clk_count_reg[8]_i_1__0_n_5 ,\clk_count_reg[8]_i_1__0_n_6 ,\clk_count_reg[8]_i_1__0_n_7 }),
        .S({\clk_count[8]_i_2__0_n_0 ,\clk_count[8]_i_3__0_n_0 ,\clk_count[8]_i_4__0_n_0 ,\clk_count[8]_i_5__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\clk_count[0]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\clk_count_reg[8]_i_1__0_n_6 ),
        .Q(sel0__0[9]));
  LUT6 #(
    .INIT(64'h0000FFFF00000004)) 
    done_i_1__0
       (.I0(\clk_count[0]_i_3__0_n_0 ),
        .I1(\clk_count[0]_i_4__0_n_0 ),
        .I2(\clk_count[0]_i_5__0_n_0 ),
        .I3(\clk_count[0]_i_6__0_n_0 ),
        .I4(\FSM_sequential_state_reg[1]_0 ),
        .I5(t),
        .O(done_i_1__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(done_i_1__0_n_0),
        .Q(t));
endmodule

(* STRUCTURAL_NETLIST = "yes" *)
module top
   (btn_up,
    btn_dn,
    clk,
    rst,
    cw,
    ccw,
    arm_up,
    arm_down,
    load_line_up,
    load_line_down,
    uart_data,
    tx,
    seg,
    an);
  input btn_up;
  input btn_dn;
  input clk;
  input rst;
  input cw;
  input ccw;
  input arm_up;
  input arm_down;
  input load_line_up;
  input load_line_down;
  output [7:0]uart_data;
  output tx;
  output [6:0]seg;
  output [3:0]an;

  wire \<const1> ;
  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire arm_down;
  wire arm_down_IBUF;
  wire arm_up;
  wire arm_up_IBUF;
  wire btn_dn;
  wire btn_dn_IBUF;
  wire btn_up;
  wire btn_up_IBUF;
  wire ccw;
  wire ccw_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire cw;
  wire cw_IBUF;
  wire db_down_n_1;
  wire db_up_n_1;
  wire load_line_down;
  wire load_line_down_IBUF;
  wire load_line_up;
  wire load_line_up_IBUF;
  wire rst;
  wire rst_IBUF;
  wire [6:0]seg;
  wire [6:0]seg_OBUF;
  wire speed_dn;
  wire speed_up;
  wire tx;
  wire tx_OBUF;
  wire [7:0]uart_data;
  wire [7:0]uart_data_OBUF;

  VCC VCC
       (.P(\<const1> ));
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  IBUF arm_down_IBUF_inst
       (.I(arm_down),
        .O(arm_down_IBUF));
  IBUF arm_up_IBUF_inst
       (.I(arm_up),
        .O(arm_up_IBUF));
  IBUF btn_dn_IBUF_inst
       (.I(btn_dn),
        .O(btn_dn_IBUF));
  IBUF btn_up_IBUF_inst
       (.I(btn_up),
        .O(btn_up_IBUF));
  IBUF ccw_IBUF_inst
       (.I(ccw),
        .O(ccw_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF cw_IBUF_inst
       (.I(cw),
        .O(cw_IBUF));
  debouncer db_down
       (.btn_db_reg_0(db_down_n_1),
        .btn_dn_IBUF(btn_dn_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_IBUF(rst_IBUF),
        .speed_dn(speed_dn),
        .speed_up(speed_up),
        .uart_data_OBUF(uart_data_OBUF[7:6]));
  debouncer_0 db_up
       (.btn_db_reg_0(db_up_n_1),
        .btn_up_IBUF(btn_up_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_IBUF(rst_IBUF),
        .speed_dn(speed_dn),
        .speed_up(speed_up),
        .uart_data_OBUF(uart_data_OBUF[7:6]));
  sev_seg_display display
       (.D(uart_data_OBUF),
        .Q(seg_OBUF),
        .an_OBUF(an_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
  IBUF load_line_down_IBUF_inst
       (.I(load_line_down),
        .O(load_line_down_IBUF));
  IBUF load_line_up_IBUF_inst
       (.I(load_line_up),
        .O(load_line_up_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  OBUF \seg_OBUF[0]_inst 
       (.I(seg_OBUF[0]),
        .O(seg[0]));
  OBUF \seg_OBUF[1]_inst 
       (.I(seg_OBUF[1]),
        .O(seg[1]));
  OBUF \seg_OBUF[2]_inst 
       (.I(seg_OBUF[2]),
        .O(seg[2]));
  OBUF \seg_OBUF[3]_inst 
       (.I(seg_OBUF[3]),
        .O(seg[3]));
  OBUF \seg_OBUF[4]_inst 
       (.I(seg_OBUF[4]),
        .O(seg[4]));
  OBUF \seg_OBUF[5]_inst 
       (.I(seg_OBUF[5]),
        .O(seg[5]));
  OBUF \seg_OBUF[6]_inst 
       (.I(seg_OBUF[6]),
        .O(seg[6]));
  FDCE \speed_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(db_up_n_1),
        .Q(uart_data_OBUF[6]));
  FDCE \speed_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(db_down_n_1),
        .Q(uart_data_OBUF[7]));
  OBUF tx_OBUF_inst
       (.I(tx_OBUF),
        .O(tx));
  OBUF \uart_data_OBUF[0]_inst 
       (.I(uart_data_OBUF[0]),
        .O(uart_data[0]));
  OBUF \uart_data_OBUF[1]_inst 
       (.I(uart_data_OBUF[1]),
        .O(uart_data[1]));
  OBUF \uart_data_OBUF[2]_inst 
       (.I(uart_data_OBUF[2]),
        .O(uart_data[2]));
  OBUF \uart_data_OBUF[3]_inst 
       (.I(uart_data_OBUF[3]),
        .O(uart_data[3]));
  OBUF \uart_data_OBUF[4]_inst 
       (.I(uart_data_OBUF[4]),
        .O(uart_data[4]));
  OBUF \uart_data_OBUF[5]_inst 
       (.I(uart_data_OBUF[5]),
        .O(uart_data[5]));
  OBUF \uart_data_OBUF[6]_inst 
       (.I(uart_data_OBUF[6]),
        .O(uart_data[6]));
  OBUF \uart_data_OBUF[7]_inst 
       (.I(uart_data_OBUF[7]),
        .O(uart_data[7]));
  uart_tx uart_module
       (.D(uart_data_OBUF[5:0]),
        .arm_down_IBUF(arm_down_IBUF),
        .arm_up_IBUF(arm_up_IBUF),
        .ccw_IBUF(ccw_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cw_IBUF(cw_IBUF),
        .\last_data_reg[7]_0 (uart_data_OBUF[7:6]),
        .load_line_down_IBUF(load_line_down_IBUF),
        .load_line_up_IBUF(load_line_up_IBUF),
        .rst_IBUF(rst_IBUF),
        .tx_OBUF(tx_OBUF));
endmodule

module uart_tx
   (tx_OBUF,
    D,
    clk_IBUF_BUFG,
    rst_IBUF,
    load_line_down_IBUF,
    load_line_up_IBUF,
    arm_down_IBUF,
    arm_up_IBUF,
    cw_IBUF,
    ccw_IBUF,
    \last_data_reg[7]_0 );
  output tx_OBUF;
  output [5:0]D;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input load_line_down_IBUF;
  input load_line_up_IBUF;
  input arm_down_IBUF;
  input arm_up_IBUF;
  input cw_IBUF;
  input ccw_IBUF;
  input [1:0]\last_data_reg[7]_0 ;

  wire \<const0> ;
  wire [5:0]D;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_3_n_0 ;
  wire \FSM_onehot_state[3]_i_4_n_0 ;
  wire \FSM_onehot_state[3]_i_5_n_0 ;
  wire arm_down_IBUF;
  wire arm_up_IBUF;
  wire bit_index;
  wire \bit_index[0]_i_1_n_0 ;
  wire \bit_index[1]_i_1_n_0 ;
  wire \bit_index[2]_i_1_n_0 ;
  wire \bit_index[3]_i_2_n_0 ;
  wire \bit_index_reg_n_0_[0] ;
  wire \bit_index_reg_n_0_[1] ;
  wire \bit_index_reg_n_0_[2] ;
  wire \bit_index_reg_n_0_[3] ;
  wire ccw_IBUF;
  wire clk_IBUF_BUFG;
  wire clk_counter;
  wire [13:1]clk_counter0;
  wire \clk_counter[0]_i_1_n_0 ;
  wire \clk_counter[10]_i_1_n_0 ;
  wire \clk_counter[11]_i_1_n_0 ;
  wire \clk_counter[12]_i_1_n_0 ;
  wire \clk_counter[13]_i_2_n_0 ;
  wire \clk_counter[13]_i_3_n_0 ;
  wire \clk_counter[1]_i_1_n_0 ;
  wire \clk_counter[2]_i_1_n_0 ;
  wire \clk_counter[3]_i_1_n_0 ;
  wire \clk_counter[4]_i_1_n_0 ;
  wire \clk_counter[5]_i_1_n_0 ;
  wire \clk_counter[6]_i_1_n_0 ;
  wire \clk_counter[7]_i_1_n_0 ;
  wire \clk_counter[8]_i_1_n_0 ;
  wire \clk_counter[9]_i_1_n_0 ;
  wire \clk_counter_reg[12]_i_2_n_0 ;
  wire \clk_counter_reg[12]_i_2_n_1 ;
  wire \clk_counter_reg[12]_i_2_n_2 ;
  wire \clk_counter_reg[12]_i_2_n_3 ;
  wire \clk_counter_reg[4]_i_2_n_0 ;
  wire \clk_counter_reg[4]_i_2_n_1 ;
  wire \clk_counter_reg[4]_i_2_n_2 ;
  wire \clk_counter_reg[4]_i_2_n_3 ;
  wire \clk_counter_reg[8]_i_2_n_0 ;
  wire \clk_counter_reg[8]_i_2_n_1 ;
  wire \clk_counter_reg[8]_i_2_n_2 ;
  wire \clk_counter_reg[8]_i_2_n_3 ;
  wire \clk_counter_reg_n_0_[0] ;
  wire \clk_counter_reg_n_0_[10] ;
  wire \clk_counter_reg_n_0_[11] ;
  wire \clk_counter_reg_n_0_[12] ;
  wire \clk_counter_reg_n_0_[13] ;
  wire \clk_counter_reg_n_0_[1] ;
  wire \clk_counter_reg_n_0_[2] ;
  wire \clk_counter_reg_n_0_[3] ;
  wire \clk_counter_reg_n_0_[4] ;
  wire \clk_counter_reg_n_0_[5] ;
  wire \clk_counter_reg_n_0_[6] ;
  wire \clk_counter_reg_n_0_[7] ;
  wire \clk_counter_reg_n_0_[8] ;
  wire \clk_counter_reg_n_0_[9] ;
  wire cw_IBUF;
  wire [8:1]data;
  wire \data[8]_i_1_n_0 ;
  wire data_1;
  wire [7:0]last_data;
  wire \last_data[7]_i_2_n_0 ;
  wire \last_data[7]_i_3_n_0 ;
  wire \last_data[7]_i_4_n_0 ;
  wire last_data_0;
  wire [1:0]\last_data_reg[7]_0 ;
  wire load_line_down_IBUF;
  wire load_line_up_IBUF;
  wire rst_IBUF;
  wire [3:0]state__0;
  wire tx_OBUF;
  wire tx_i_1_n_0;
  wire tx_i_2_n_0;
  wire tx_i_3_n_0;
  wire tx_i_4_n_0;
  wire tx_i_5_n_0;

  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state[3]_i_2_n_0 ),
        .I1(\FSM_onehot_state[3]_i_3_n_0 ),
        .I2(data_1),
        .I3(state__0[3]),
        .I4(last_data_0),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[3] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .O(\FSM_onehot_state[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA8AA888800000000)) 
    \FSM_onehot_state[3]_i_3 
       (.I0(\clk_counter_reg_n_0_[13] ),
        .I1(\clk_counter_reg_n_0_[12] ),
        .I2(\FSM_onehot_state[3]_i_4_n_0 ),
        .I3(\FSM_onehot_state[3]_i_5_n_0 ),
        .I4(\clk_counter_reg_n_0_[11] ),
        .I5(state__0[2]),
        .O(\FSM_onehot_state[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_onehot_state[3]_i_4 
       (.I0(\clk_counter_reg_n_0_[10] ),
        .I1(\clk_counter_reg_n_0_[8] ),
        .I2(\clk_counter_reg_n_0_[9] ),
        .O(\FSM_onehot_state[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h557F)) 
    \FSM_onehot_state[3]_i_5 
       (.I0(\clk_counter_reg_n_0_[7] ),
        .I1(\clk_counter_reg_n_0_[5] ),
        .I2(\clk_counter_reg_n_0_[4] ),
        .I3(\clk_counter_reg_n_0_[6] ),
        .O(\FSM_onehot_state[3]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .D(state__0[3]),
        .PRE(rst_IBUF),
        .Q(state__0[0]));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(state__0[0]),
        .Q(data_1));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(data_1),
        .Q(state__0[2]));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(state__0[2]),
        .Q(state__0[3]));
  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \bit_index[0]_i_1 
       (.I0(state__0[2]),
        .I1(\bit_index_reg_n_0_[0] ),
        .O(\bit_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \bit_index[1]_i_1 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(state__0[2]),
        .O(\bit_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \bit_index[2]_i_1 
       (.I0(state__0[2]),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .O(\bit_index[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \bit_index[3]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(state__0[3]),
        .I2(data_1),
        .O(bit_index));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \bit_index[3]_i_2 
       (.I0(state__0[2]),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\bit_index_reg_n_0_[3] ),
        .O(\bit_index[3]_i_2_n_0 ));
  FDCE \bit_index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(bit_index),
        .CLR(rst_IBUF),
        .D(\bit_index[0]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[0] ));
  FDCE \bit_index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(bit_index),
        .CLR(rst_IBUF),
        .D(\bit_index[1]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[1] ));
  FDCE \bit_index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(bit_index),
        .CLR(rst_IBUF),
        .D(\bit_index[2]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[2] ));
  FDCE \bit_index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(bit_index),
        .CLR(rst_IBUF),
        .D(\bit_index[3]_i_2_n_0 ),
        .Q(\bit_index_reg_n_0_[3] ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAB)) 
    \clk_counter[0]_i_1 
       (.I0(data_1),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .I2(\clk_counter_reg_n_0_[0] ),
        .O(\clk_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[10]_i_1 
       (.I0(clk_counter0[10]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \clk_counter[11]_i_1 
       (.I0(data_1),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .I2(clk_counter0[11]),
        .O(\clk_counter[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[12]_i_1 
       (.I0(clk_counter0[12]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \clk_counter[13]_i_1 
       (.I0(data_1),
        .I1(state__0[2]),
        .O(clk_counter));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \clk_counter[13]_i_2 
       (.I0(data_1),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .I2(clk_counter0[13]),
        .O(\clk_counter[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA8AA8888FFFFFFFF)) 
    \clk_counter[13]_i_3 
       (.I0(\clk_counter_reg_n_0_[13] ),
        .I1(\clk_counter_reg_n_0_[12] ),
        .I2(\FSM_onehot_state[3]_i_4_n_0 ),
        .I3(\FSM_onehot_state[3]_i_5_n_0 ),
        .I4(\clk_counter_reg_n_0_[11] ),
        .I5(state__0[2]),
        .O(\clk_counter[13]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[1]_i_1 
       (.I0(clk_counter0[1]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[2]_i_1 
       (.I0(clk_counter0[2]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[3]_i_1 
       (.I0(clk_counter0[3]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \clk_counter[4]_i_1 
       (.I0(data_1),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .I2(clk_counter0[4]),
        .O(\clk_counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \clk_counter[5]_i_1 
       (.I0(data_1),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .I2(clk_counter0[5]),
        .O(\clk_counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[6]_i_1 
       (.I0(clk_counter0[6]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \clk_counter[7]_i_1 
       (.I0(data_1),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .I2(clk_counter0[7]),
        .O(\clk_counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[8]_i_1 
       (.I0(clk_counter0[8]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \clk_counter[9]_i_1 
       (.I0(clk_counter0[9]),
        .I1(\clk_counter[13]_i_3_n_0 ),
        .O(\clk_counter[9]_i_1_n_0 ));
  FDCE \clk_counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[0]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[0] ));
  FDCE \clk_counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[10]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[10] ));
  FDCE \clk_counter_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[11]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[11] ));
  FDCE \clk_counter_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[12]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[12] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clk_counter_reg[12]_i_2 
       (.CI(\clk_counter_reg[8]_i_2_n_0 ),
        .CO({\clk_counter_reg[12]_i_2_n_0 ,\clk_counter_reg[12]_i_2_n_1 ,\clk_counter_reg[12]_i_2_n_2 ,\clk_counter_reg[12]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_counter0[12:9]),
        .S({\clk_counter_reg_n_0_[12] ,\clk_counter_reg_n_0_[11] ,\clk_counter_reg_n_0_[10] ,\clk_counter_reg_n_0_[9] }));
  FDCE \clk_counter_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[13]_i_2_n_0 ),
        .Q(\clk_counter_reg_n_0_[13] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clk_counter_reg[13]_i_4 
       (.CI(\clk_counter_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_counter0[13]),
        .S({\<const0> ,\<const0> ,\<const0> ,\clk_counter_reg_n_0_[13] }));
  FDCE \clk_counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[1]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[1] ));
  FDCE \clk_counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[2]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[2] ));
  FDCE \clk_counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[3]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[3] ));
  FDCE \clk_counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[4]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[4] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clk_counter_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\clk_counter_reg[4]_i_2_n_0 ,\clk_counter_reg[4]_i_2_n_1 ,\clk_counter_reg[4]_i_2_n_2 ,\clk_counter_reg[4]_i_2_n_3 }),
        .CYINIT(\clk_counter_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_counter0[4:1]),
        .S({\clk_counter_reg_n_0_[4] ,\clk_counter_reg_n_0_[3] ,\clk_counter_reg_n_0_[2] ,\clk_counter_reg_n_0_[1] }));
  FDCE \clk_counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[5]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[5] ));
  FDCE \clk_counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[6]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[6] ));
  FDCE \clk_counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[7]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[7] ));
  FDCE \clk_counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[8]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[8] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \clk_counter_reg[8]_i_2 
       (.CI(\clk_counter_reg[4]_i_2_n_0 ),
        .CO({\clk_counter_reg[8]_i_2_n_0 ,\clk_counter_reg[8]_i_2_n_1 ,\clk_counter_reg[8]_i_2_n_2 ,\clk_counter_reg[8]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_counter0[8:5]),
        .S({\clk_counter_reg_n_0_[8] ,\clk_counter_reg_n_0_[7] ,\clk_counter_reg_n_0_[6] ,\clk_counter_reg_n_0_[5] }));
  FDCE \clk_counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(clk_counter),
        .CLR(rst_IBUF),
        .D(\clk_counter[9]_i_1_n_0 ),
        .Q(\clk_counter_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'h2)) 
    \data[8]_i_1 
       (.I0(data_1),
        .I1(rst_IBUF),
        .O(\data[8]_i_1_n_0 ));
  FDRE \data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(D[0]),
        .Q(data[1]),
        .R(\<const0> ));
  FDRE \data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(D[1]),
        .Q(data[2]),
        .R(\<const0> ));
  FDRE \data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(D[2]),
        .Q(data[3]),
        .R(\<const0> ));
  FDRE \data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(D[3]),
        .Q(data[4]),
        .R(\<const0> ));
  FDRE \data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(D[4]),
        .Q(data[5]),
        .R(\<const0> ));
  FDRE \data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(D[5]),
        .Q(data[6]),
        .R(\<const0> ));
  FDRE \data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(\last_data_reg[7]_0 [0]),
        .Q(data[7]),
        .R(\<const0> ));
  FDRE \data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[8]_i_1_n_0 ),
        .D(\last_data_reg[7]_0 [1]),
        .Q(data[8]),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'hA8AA)) 
    \last_data[7]_i_1 
       (.I0(state__0[0]),
        .I1(\last_data[7]_i_2_n_0 ),
        .I2(\last_data[7]_i_3_n_0 ),
        .I3(\last_data[7]_i_4_n_0 ),
        .O(last_data_0));
  LUT6 #(
    .INIT(64'hFB9EFFFFFFFFFB9E)) 
    \last_data[7]_i_2 
       (.I0(last_data[4]),
        .I1(cw_IBUF),
        .I2(ccw_IBUF),
        .I3(last_data[5]),
        .I4(D[3]),
        .I5(last_data[3]),
        .O(\last_data[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBEFFBE7DFFBE)) 
    \last_data[7]_i_3 
       (.I0(last_data[1]),
        .I1(last_data[2]),
        .I2(D[2]),
        .I3(load_line_down_IBUF),
        .I4(load_line_up_IBUF),
        .I5(last_data[0]),
        .O(\last_data[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \last_data[7]_i_4 
       (.I0(last_data[7]),
        .I1(\last_data_reg[7]_0 [1]),
        .I2(last_data[6]),
        .I3(\last_data_reg[7]_0 [0]),
        .O(\last_data[7]_i_4_n_0 ));
  FDCE \last_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(last_data[0]));
  FDCE \last_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(last_data[1]));
  FDCE \last_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(last_data[2]));
  FDCE \last_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(last_data[3]));
  FDCE \last_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(D[4]),
        .Q(last_data[4]));
  FDCE \last_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(D[5]),
        .Q(last_data[5]));
  FDCE \last_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(\last_data_reg[7]_0 [0]),
        .Q(last_data[6]));
  FDCE \last_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(last_data_0),
        .CLR(rst_IBUF),
        .D(\last_data_reg[7]_0 [1]),
        .Q(last_data[7]));
  LUT3 #(
    .INIT(8'hFE)) 
    tx_i_1
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(state__0[0]),
        .I2(state__0[3]),
        .O(tx_i_1_n_0));
  LUT4 #(
    .INIT(16'hEFEE)) 
    tx_i_2
       (.I0(state__0[0]),
        .I1(state__0[3]),
        .I2(tx_i_3_n_0),
        .I3(state__0[2]),
        .O(tx_i_2_n_0));
  LUT6 #(
    .INIT(64'h1F1F1F1F101F1010)) 
    tx_i_3
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(data[8]),
        .I2(\bit_index_reg_n_0_[3] ),
        .I3(tx_i_4_n_0),
        .I4(\bit_index_reg_n_0_[2] ),
        .I5(tx_i_5_n_0),
        .O(tx_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    tx_i_4
       (.I0(data[7]),
        .I1(data[6]),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(data[5]),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(data[4]),
        .O(tx_i_4_n_0));
  LUT6 #(
    .INIT(64'h0015051550155515)) 
    tx_i_5
       (.I0(\bit_index_reg_n_0_[2] ),
        .I1(data[1]),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(data[2]),
        .I5(data[3]),
        .O(tx_i_5_n_0));
  FDPE tx_reg
       (.C(clk_IBUF_BUFG),
        .CE(tx_i_1_n_0),
        .D(tx_i_2_n_0),
        .PRE(rst_IBUF),
        .Q(tx_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_data_OBUF[0]_inst_i_1 
       (.I0(load_line_down_IBUF),
        .I1(load_line_up_IBUF),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_data_OBUF[1]_inst_i_1 
       (.I0(load_line_up_IBUF),
        .I1(load_line_down_IBUF),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_data_OBUF[2]_inst_i_1 
       (.I0(arm_down_IBUF),
        .I1(arm_up_IBUF),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_data_OBUF[3]_inst_i_1 
       (.I0(arm_up_IBUF),
        .I1(arm_down_IBUF),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_data_OBUF[4]_inst_i_1 
       (.I0(ccw_IBUF),
        .I1(cw_IBUF),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \uart_data_OBUF[5]_inst_i_1 
       (.I0(cw_IBUF),
        .I1(ccw_IBUF),
        .O(D[5]));
endmodule
