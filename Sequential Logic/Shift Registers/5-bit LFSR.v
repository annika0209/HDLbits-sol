
/* https://syseng.tistory.com/168
입력 데이터 생성을 위해 "재현 가능한 난수"의 생성이 필요할 때가 있음.
(1) 실제 상황과 유사하게 임위의 데이터를 입력 + (2) 분석을 위해 재현 가능한 패턴이 필요.
: 선형 함수를 잘 선택하면 주기가 길고 무작위적인 실제와 매우 유사한 데이터 생성 가능.
-> "의사 난수 생성" , 그중 한가지 방법이 LFSR
LFSR 개념: 시프트 레지스터에 입력되는 값이 이전 상태의 선형 함수로 다시 되먹임되는 Linear Feedback 구조.
#암호학, 통신 등에서 사용함.
*/

/*
LFSR의 "최대 길이"는 특정 조건을 충족하면 
가능한 모든 비트 패턴(0이 아닌 상태)을 한 번씩 지나고 
다시 초기 상태로 돌아오는 것을 의미.
*/
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire [4:0] d;
    parameter XOR_in = 1'b0;
    
    //making a random number logic 
    
    //assign d = {q[0],q[4:1]};  단순 right shift
    assign d = {q[0]^XOR_in, q[4], q[0]^q[3], q[2], q[1]};

    //Dffs
    always @(posedge clk) begin
        if (reset) begin
            q <= 5'b1;
        end
        else begin
            q <= d;
        end
    end
    

endmodule