# CSLab #2 Verilog HW
## 檔案總覽
- `fAdder.v`
    ```verilog
    module Full_Adder (
        output Cout, Sum,
        input A, B, Cin
    );
    ```
- `8Adder.v`
    ```verilog
    module Adder8 (
        output Cout, 
        output [7:0] Sum,
        input [7:0] A, B,
        input Cin
    );
    ```
- `FSM.v`
    ```verilog
    module MUL_FSM (
        output reg [1:0] state,
        input clk, areset, 
        input [7:0] multiplier
    );
    ```
- `Multiplier.v`
    ```verilog
    module multiplier8x8 (
        output reg [15:0] product,
        input [7:0] multiplicand, multiplier,
        input clk, areset
    );
    ```
- `testbench.v`
- `Makefile`
    ```
    mul: clear mul_s_tb.v
        clear
        iverilog -o mul mul_s_tb.v
        vvp mul
    clear:
        rm -f mul
        rm -f mul.vcd
        
    ```

## 編譯檔案
因為上述的所有檔案，都有加上適當的編譯器指引，因此我們只需要對 testbench 編譯並執行，就可以適當測試我們的目標。

1. 編譯並執行「乘法器」測試檔
```
iverilog -o mul Multiplier.v
vvp mul
```
2. 使用 "Makefile" 自動編譯並執行
```
make
```

## 程式碼概述
`Multiplier.v` 共包含 3 個程式區塊

1. `MUL_FSM ControlUnit(...)`
    - 乘法器的控制單元，使用一組狀態機。其中，狀態機共包含 4 個狀態：INIT, EXEC, IDLE, HALT
    - 時脈正緣驅動，產生的結果是 next state
2. `Adder8 ALU(...)`
    - 乘法器的 ALU
    - 被加數(multiplicand) + 加數(product) = 進位(Cout) + 加總(tempSum)
    - 進位、加總 需要另外儲存的原因是這個結果不一定會被使用，要取決於 multiplier[0]
3. `always @(posedge clk)`
   - 根據上一個 clock cycle 得到的 state 決定乘法器的行為，包含初始化(INIT)、執行(EXEC)、閒置(IDLE)、停止(HALT)
   - 不同狀態會決定是否更新 product ，以及如何更新 product
4. `always @(negedge clk)`
   - 為了確保能在最後才更新狀態，因此在時脈負緣才更新狀態 state = next_state 